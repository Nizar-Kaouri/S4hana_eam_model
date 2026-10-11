# Synthetic walkthrough

The example uses synthetic source data. From the ZIP root run:

`python tools/migration_run.py --project customer/examples/project.json --out example-prepared`

The project selects one of two synthetic rows per structure and writes a hash audit. The production selection templates are empty. Replace sample exports, business scope and target adapter definitions before any SAP load.
