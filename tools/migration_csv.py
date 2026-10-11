"""Lossless CSV reading and source export validation."""
import csv,io
from pathlib import Path

class InputError(Exception):
    pass

class CsvRows(list):
    def __init__(self, rows, columns):
        super().__init__(rows)
        self.columns = columns

def read_csv(path, preserve_values=False):
    path = Path(path)
    try:
        text = path.read_text(encoding="utf-8-sig")
    except (OSError, UnicodeError) as exc:
        raise InputError(f"cannot read CSV {path}: {exc}") from exc
    if not text.strip():
        raise InputError(f"{path}: CSV header is required, even for an empty export")
    try:
        dialect = csv.Sniffer().sniff(text.splitlines()[0], delimiters=",;\t")
    except csv.Error:
        dialect = csv.excel
    # A header cannot establish whether body values contain escaped quotes.
    # Infer only the separator; SAP/our exports use standard doubled quotes.
    reader = csv.DictReader(io.StringIO(text, newline=""), delimiter=dialect.delimiter,
                            quotechar='"', doublequote=True, strict=True)
    try:
        columns = [c.strip() for c in (reader.fieldnames or [])]
        if not columns or any(not c for c in columns) or len(set(columns)) != len(columns):
            raise InputError(f"{path}: empty or duplicate column names")
        reader.fieldnames = columns
        rows = []
        for r in reader:
            if None in r or any(v is None for v in r.values()):
                raise InputError(f"{path}: row {reader.line_num} has the wrong number of fields")
            rows.append({k: v if preserve_values else v.strip() for k, v in r.items()})
    except csv.Error as exc:
        raise InputError(f"{path}: malformed CSV: {exc}") from exc
    return CsvRows(rows, columns)

def require(rows, columns, label):
    available = rows.columns if isinstance(rows, CsvRows) else (rows[0].keys() if rows else columns)
    if missing := [c for c in columns if c not in available]:
        raise InputError(f"{label}: columns missing: {', '.join(missing)}")
