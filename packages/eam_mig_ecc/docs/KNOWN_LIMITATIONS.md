# System verification boundaries

This release candidate includes preparation/reconciliation and specialized-data helpers previously absent from the pack. SAP system validation is still pending.

1. Confirm all CDS fields/keys, the helper DDIC structures and function-module signatures on your exact releases. Prioritize permit, serial-stock, label and capacity definitions and report field conversion.
2. Existing current/max-counter CDS extracts are previews. Use the raw-ledger preparation workflow for historical cutover; a postfilter cannot recover discarded history.
3. Native engineering-change eligibility, typed root scope and identifier maps are explicit customer inputs. Unevaluated or ambiguous effectivity stops preparation. No claim of a universal ECM evaluation engine is made.
4. Specialized full-row exports preserve DDIC data. Dependency source decoding, customizing decisions and target posting require your chosen interface.
5. The two optional ABAP reports need an interactive SAP GUI. They have parser checks only and require SAP activation/runtime tests; do not treat these checks as DDIC validation.
6. The target CDS companion covers eight main objects. Python reconciliation covers every canonical structure and raw extensions, using customer target exports and maps for changed technical identities.
7. Real extraction, Unicode/numeric/raw conversion, authorizations and target posting are untested. OPEN_CHECKS.md retains all pending source/target questions.
