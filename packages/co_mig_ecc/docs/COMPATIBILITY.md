# Compatibility requirements

Source templates use classic ABAP CDS over the documented ECC tables. The design baseline is NetWeaver 7.40 SP08 or newer. Availability of annotations, fields and helper interfaces depends on the installed stack and components.

Use the documented data definitions and module manifests to check the installed schema. A single source or target release does not establish compatibility with every SAP release. Public Cloud deployment restrictions require a separate interface assessment.

Provide the required ABAP development authorizations and authorized extraction channel. No DCL is supplied; table-display authorization alone does not authorize every CDS access path.

Python tools require Python 3.10 or newer. Native helpers use an interactive SAP GUI. No loading service, posting adapter or SAP certification is included.
