# ModuPorter EAM customer documentation

Documentation for the EAM migration release candidate 1.0.0-rc.1, based on technical revision cc08609d92e6a623412c395f0fac4d6205cf376f. SAP activation and runtime validation remain pending.

- [English customer manual](CUSTOMER_MANUAL_EN.md) and [editable Word manual](ModuPorter-EAM-Documentation-EN.docx)
- [Deutsches Kundenhandbuch](CUSTOMER_MANUAL_DE.md) und [bearbeitbares Word Handbuch](ModuPorter-EAM-Documentation-DE.docx)
- [VDM object map](ModuPorter-EAM-VDM.html) with English and German interface labels. Download and open locally in a browser; it works offline.
- [CDS object catalog](moduporter-eam-object-catalog.csv) and [diagram data](moduporter-eam-object-model.json)

Coverage: all 158 ECC views and 16 S4 companion views, 41 canonical extraction structures and 440 mapped fields. The map uses module manifests for layer placement and source DDLS for dependencies, including UNION branches and associations. Supplemental raw tables and optional helpers are identified separately. Catalog keys use projected aliases; SAP runtime/DDIC correctness still needs customer verification. Direct source and association edges are drawn for the selected object where both endpoints are visible in its module band; cross module relationships are accessible through the detail panel.

The Word manuals each have nine pages. All pages were rendered using native Microsoft Word PDF conversion and the packaged document renderer, then visually inspected. Diagram QA covered every view selection, language switching, filters, search, connectors and widths from 320 to 1600 pixels. These documentation checks do not change SAP validation status.

For installation and execution, use the full customer pack and its START_HERE.md. The diagram is documentation, not an import file or target posting implementation.
