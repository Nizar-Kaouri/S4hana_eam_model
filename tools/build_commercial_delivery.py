import json,os,subprocess,sys,zipfile,re,hashlib
from pathlib import Path
H=Path(__file__).resolve().parent;R=H.parent;O=Path(sys.argv[1]).resolve() if len(sys.argv)>1 else R/'dist/commercial';O.mkdir(parents=True,exist_ok=True);
import shutil
for guide in (R/'docs/customer/commercial').glob('ModuPorter-*-1.0.0.docx'):shutil.copy2(guide,O/guide.name)
shutil.copy2(R/'docs/customer/commercial/ModuPorter-Release-1.0.0-README.md',O/'ModuPorter-Release-1.0.0-README.md')
codes=['eam','fi_aa','mm','qm','ps','pp','co','fi','sd'];rows=[]
pattern=re.compile(r'draft-unverified|system-unverified|TODO-VERIFY|NOT_TESTED|never activated|\buntested\b|release candidate|nothing has been activated',re.I)
for code in codes:
 label=code.upper().replace('_','-');inner=[]
 for system,side in [('ecc','SOURCE')]:
  product=f'{code}_mig_{system}';path=O/f'ModuPorter-{label}-{side}-1.0.0.zip'
  p=subprocess.run([sys.executable,'build_package.py','--product',product,'--all','--out',str(path)],cwd=R,env=dict(os.environ,PYTHONUTF8='1'),capture_output=True,text=True);assert p.returncode==0,p.stdout+p.stderr
  with zipfile.ZipFile(path) as z:
   assert z.testzip() is None
   assert not any('_mig_s4' in n or 'TARGET' in n or n.endswith('mig_reconcile.py') or n.endswith('target-adapters.json') for n in z.namelist())
   manifest=json.loads(z.read('BUILD_MANIFEST.json'));assert manifest['version']=='1.0.0' and 'tested_release' not in manifest
   bad=[]
   for name in z.namelist():
    assert not name.endswith(('CUSTOMER_TEST.md','TEST_RESULTS.csv')),name
    if name.endswith(('.md','.html','.json','.asddls','.csv','.xml')):
     for line in z.read(name).decode('utf-8-sig').splitlines():
      if pattern.search(line):bad.append((name,line[:180]))
      assert not re.search(r'mig_reconcile\.py|SOURCE and TARGET|target comparison contracts|target_count_view|target_view|migration_pair',line),(product,name,line[:160])
   assert not bad,(product,bad[:20])
  inner.append(path)
 family='EAM' if code=='eam' else 'Domains'
 pack=O/f'ModuPorter-{label}-Customer-Pack-1.0.0.zip'
 with zipfile.ZipFile(pack,'w',zipfile.ZIP_DEFLATED) as z:
  for path in inner:z.write(path,path.name)
  for lang in ['EN','DE']:
   path=O/f'ModuPorter-{family}-Manual-{lang}-1.0.0.docx';z.write(path,'docs/'+path.name)
  for system,side in [('ecc','SOURCE')]:
   root=R/'packages'/f'{code}_mig_{system}'
   z.write(root/'docs/model_map.html',f'VDM-{side}.html')
   for name in ['INSTALLATION.md','SUPPORTED_SCOPE.md','COMPATIBILITY.md','LICENSE.md']:
    z.write(root/'docs'/name,f'docs/{side}/{name}')
  z.writestr('START_HERE.md',f'# ModuPorter {label}\n\nVersion 1.0.0 | KAOURI INNOVATECH\n\nRead the English or German manual in docs. Import the SOURCE archive into your source system. Follow ACTIVATION_ORDER.txt inside each archive. Open VDM-SOURCE.html in a browser to explore dependencies.\n\nThe templates provide read-only source extraction and field mappings. Implement creation of target business objects through your chosen SAP interface. See docs/SOURCE/SUPPORTED_SCOPE.md and docs/SOURCE/LICENSE.md for the exact scope and unlimited-use/modification terms, excluding resale of the template library.\n')
  z.writestr('SHA256SUMS.txt','\n'.join(hashlib.sha256(p.read_bytes()).hexdigest()+'  '+p.name for p in inner)+'\n')
 rows.append({'pack':label,'version':'1.0.0','file':pack.name,'sha256':hashlib.sha256(pack.read_bytes()).hexdigest()});print(label,'built',flush=True)
(O/'ModuPorter-Release-1.0.0-Catalog.json').write_text(json.dumps(rows,indent=2)+'\n',encoding='utf-8')
with zipfile.ZipFile(O/'ModuPorter-Commercial-Packs-1.0.0.zip','w',zipfile.ZIP_DEFLATED) as z:
 for row in rows:z.write(O/row['file'],row['file'])
 for name in ['ModuPorter-Release-1.0.0-README.md','ModuPorter-Release-1.0.0-Catalog.json']:z.write(O/name,name)
print('All nine customer packs built and archive contents checked')
