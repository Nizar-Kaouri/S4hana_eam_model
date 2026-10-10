# EAM migration template installation

Status: draft-unverified. No system activation or extraction has been performed.

1. Inspect BUILD_MANIFEST.json for selected modules, automatically included dependencies, target prefix and package.
2. Confirm the source is ECC 6.0 on NetWeaver 7.40 SP08 or higher. This is an assumed baseline, not a certified compatibility statement.
3. Use a development/sandbox system first. Create the customer package and transport using the customer's change process.
4. Import the delivered src/ through abapGit. Activate using ACTIVATION_ORDER.txt; association cycles may require group activation.
5. Resolve every source-table/field TODO against the actual DDIC. Do not guess replacement fields from their names.
6. Check every consumption view against source tables: keys, duplicates, deletion state, units, date validity and parent scope.
7. Give the extraction user only the access required by the actual extraction channel. These views intentionally have no DCL. Do not assume S_TABU_NAM alone protects arbitrary custom SQL/RFC readers.
8. Read mapping/docs and FIELD_CATALOG.csv. Targets are provisional table-field references; they are not supported posting APIs.
9. The customer supplies transformation, identifier maps, API/BAPI posting, transaction handling and error recovery. No direct target-table updates are supplied.
10. Perform a cutover rehearsal. Confirm reference/master objects exist; extract with consistent scope, reconcile keys and counts, and preserve old-to-new identifiers.
11. Record exact ECC/S4 releases, activation logs, authorizations and extraction evidence before changing module status.

SAP S/4HANA reconciliation views are a separate product, installed in the target system. The Python reconciliation script rejects duplicate record keys with input-error exit code 2.

Long texts: the package provides a text index only. The customer's ABAP loader reads text content through READ_TEXT using TextObject, TextName, TextID and language. Compressed text content is not represented as CDS rows.
