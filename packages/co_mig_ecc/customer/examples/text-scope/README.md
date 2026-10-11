# Text owner example

Run python tools/migration_run.py --project customer/examples/text-scope/project.json --out prepared-text-example from the delivered source ZIP. The output preserves English and German text identities for the selected owner, excludes the other owner, and records counts/hashes in PREPARATION_AUDIT.json. EXAMPLE and the sample names are artificial; populate the real customer/text-links files from source application metadata. Retrieve payloads through the shipped READ_TEXT helper after scoping.
