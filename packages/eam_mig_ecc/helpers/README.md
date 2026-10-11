# SAP extraction helpers

Create the two delivered .prog.abap files as executable reports in SE38 in your development system. These files are deliberately kept outside src/: abapGit imports the CDS library, while you can test the optional reports independently. Use the shipped customer prefix if you rebuild. Use the installed release definitions for DDIC and function-module signatures.

## Full-row table export

ZEMX_EAM_TABLE_EXPORT runs on ECC or on your S/4HANA target. P_TABLE must be in the hardcoded EAM allowlist. Every DDIC field is exported; the adjacent .fields.csv lists actual keys, datatypes, lengths and decimals. No target-table writes occur. Table availability is checked at runtime. The report explicitly requires S_TABU_NAM display authorization and runs in the current client.

Optional P_FIELD/P_KEYS restrict the query to one CHAR/NUMC reference field. P_KEYS is a UTF-8 file containing one internal-format key per line, without a header. Both parameters must be supplied together. Preserve leading zeros. Filter values are escaped and the field must exist in DDIC. For composite identities, additionally run the Python cohort filter on all identity columns.

P_MAX limits rows (default 10000; maximum 1000000). Exceeding the limit stops before writing a truncated payload. Use narrower populations or a controlled higher limit. P_FILE names a new CSV file on the SAP GUI frontend. The report needs an interactive SAP GUI; it is not a background/RFC exporter. Use a writable customer export directory, and avoid choosing an existing filename.

Numeric and binary fields are exported through ABAP character conversion; retain .fields.csv and validate decimal, float and raw/binary representation before translating or posting. The generic report does not interpret dependency source blobs. Validate date, Unicode, CSV quoting and release-specific include structures for the selected release.

## Long-text payload

First restrict ZEMX_C_LongTextIndexMig to an explicit selected-text cohort, including language and TextID. Never infer a text-name suffix from an equipment number alone. Generate the report input from this selected CSV:

    python tools/eam_prepare.py text-keys --input selected_text_index.csv --out selected_text_keys.tsv

Run ZEMX_EAM_TEXT_EXPORT with that TSV and a new output CSV. It calls READ_TEXT for every key, retaining line order and SAPscript format. Empty texts have LineNumber 0; missing/error texts stop publication of the whole payload and appear in the SAP list log. Keys, format tags and text lines use escaped CSV quoting. P_MAX bounds the selected text key count (default 10000). The report requires STXH display authorization; also test authorization through READ_TEXT on your system. It performs no SAVE_TEXT or COMMIT.

Repeat on the target with mapped text keys, then compare ordered Format/Text payloads with the long-text comparison contract. Creating/posting target texts remains part of the customer's loading program.
