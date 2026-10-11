"""CSV integrity for source exports."""
import sys,tempfile,unittest
from pathlib import Path
sys.path.insert(0,str(Path(__file__).resolve().parents[1]))
import migration_csv as mr
def write(folder,name,text):
 p=Path(folder)/name;p.write_text(text,encoding="utf-8");return str(p)

class CsvIntegrityTest(unittest.TestCase):
    def test_multiline_fields_are_preserved(self):
        with tempfile.TemporaryDirectory() as folder:
            rows = mr.read_csv(write(folder, 'x.csv', 'Key,Text\n1,"first\nsecond"\n'))
            self.assertEqual(rows[0]['Text'], 'first\nsecond')

    def test_invalid_csv_is_rejected(self):
        with tempfile.TemporaryDirectory() as folder:
            for text in ('', 'A,A\n1,2\n', 'A,B\n1\n', 'A,B\n1,2,3\n'):
                with self.subTest(text=text), self.assertRaises(mr.InputError):
                    mr.read_csv(write(folder, 'x.csv', text))

    def test_empty_exports_still_require_the_correct_header(self):
        with tempfile.TemporaryDirectory() as folder:
            rows = mr.read_csv(write(folder, 'x.csv', 'Wrong,Header\n'))
            with self.assertRaises(mr.InputError):
                mr.require(rows, ['Equipment'], 'source')
