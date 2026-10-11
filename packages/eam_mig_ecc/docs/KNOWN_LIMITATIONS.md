# Customer implementation requirements

Use the source preparation workflow and specialized-data helpers according to the documented extraction scope.

1. Confirm all CDS fields/keys, the helper DDIC structures and function-module signatures on your exact releases. Prioritize permit, serial-stock, label and capacity definitions and report field conversion.
2. Existing current/max-counter CDS extracts are previews. Use the raw-ledger preparation workflow for historical cutover; a postfilter cannot recover discarded history.
3. Native engineering-change eligibility, typed root scope and identifier maps are explicit customer inputs. Unevaluated or ambiguous effectivity stops preparation. No claim of a universal ECM evaluation engine is made.
4. Specialized full-row exports preserve DDIC data. Dependency source decoding, customizing decisions and target posting require your chosen interface.
5. Create the two optional ABAP reports in SE38 and run them through an interactive SAP GUI. Confirm the helper DDIC fields and READ_TEXT signature on your installed SAP release.
