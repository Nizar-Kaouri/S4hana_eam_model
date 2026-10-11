"""Check the declared nine-pack object scope and projected CDS field contracts."""
import json,re,sys
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
CODES=['eam','fi_aa','mm','qm','ps','pp','co','fi','sd']

def projected(text):
    code=re.sub(r'//[^\n]*','',text)
    body=code[code.index('{')+1:code.rindex('}')] if '{' in code else ''
    return {n.lower() for n in re.findall(r'\bas\s+(\w+)\s*(?:,|$)',body,re.M)} | {
        n.lower() for n in re.findall(r'^\s*(_\w+)\s*,?\s*$',body,re.M)}

def check(root=ROOT):
    errors=[];requirements=json.loads((root/'tools/pack_object_requirements.json').read_text(encoding='utf-8'))
    for code in CODES:
        pack=root/'packages'/f'{code}_mig_ecc'
        texts={f.stem.split('.')[0].lower():f.read_text(encoding='utf-8') for f in (pack/'src').glob('*.asddls')}
        fields={n:projected(t) for n,t in texts.items()}
        mappings={s['consumption_view']:s for f in (pack/'modules').glob('*/mapping.json') for s in json.loads(f.read_text(encoding='utf-8'))['structures']}
        for module,req in requirements[code].items():
            for name in req['required_structures']:
                if name not in mappings:errors.append(f'{code}/{module}: missing required business structure {name}')
            for name,required_fields in req.get('required_fields',{}).items():
                actual={f['element'] for f in mappings.get(name,{}).get('fields',[])}
                if set(required_fields)-actual:errors.append(f'{name}: missing business fields {sorted(set(required_fields)-actual)}')
        for name,s in mappings.items():
            if '_I_' not in s['source_view']:errors.append(f'{name}: normal export must select the I layer')
            if not s['keys']:errors.append(f'{name}: empty identity')
        # Check direct projections/joins against the actual dependent CDS outputs.
        # Native SAP DDIC fields are checked by the shipped customer DDIC preflight.
        for name,text in texts.items():
            code_text=re.sub(r'//[^\n]*','',text)
            if 'union' in code_text.lower():continue  # Each union branch has its own alias scope.
            aliases={a.lower():n.lower() for n,a in re.findall(r'\b(?:from|join|to)\s+(\w+)\s+as\s+(\w+)',code_text,re.I)}
            for alias,element in re.findall(r'\b(\w+)\.(\w+)\b',code_text):
                target=aliases.get(alias.lower())
                if target in fields and element.lower() not in fields[target]:
                    errors.append(f'{name}: {alias}.{element} is not projected by {target}')
        cp=pack/'customer';contracts=cp/('contracts' if code=='eam' else '')
        pr=json.loads((contracts/'customer-cohort-project.json').read_text(encoding='utf-8'));available=set(pr['inputs'])
        for step in pr['steps']:
            for k in ['input','parent','links']:
                if k in step and step[k] not in available:errors.append(f'{code}: unresolved preparation input {step[k]}')
            available.add(step['name'])
        if set(pr['outputs'])-available:errors.append(f'{code}: unavailable prepared outputs')
        for name,s in mappings.items():
            path=cp/'headers'/(name+'.csv')
            if not path.exists() or path.read_text(encoding='utf-8').strip().split(',')!=[f['element'] for f in s['fields']]:
                errors.append(f'{name}: header differs from delivered projection')
    return sorted(set(errors))

if __name__=='__main__':
    errors=check()
    for e in errors:print('ERROR '+e)
    print(f'Object coverage: {len(errors)} errors across nine packs')
    sys.exit(bool(errors))
