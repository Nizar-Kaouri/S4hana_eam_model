# ModuPorter Asset Accounting installation

Version 1.0.0. Delivery: source extraction.

1. Select the required modules. The builder includes their hard dependencies automatically; individual views need every referenced object.
2. Inspect BUILD_MANIFEST.json, DDIC_REQUIREMENTS.csv where supplied, and docs/COMPATIBILITY.md.
3. Create a customer ABAP package and transport according to your change process.
4. In abapGit choose New Offline, assign that package, Import ZIP, then Pull ZIP. Import the SOURCE and TARGET archives separately on the corresponding systems. The entire GitHub repository is not an abapGit import archive.
5. Activate in ACTIVATION_ORDER.txt order. Association cycles can require activation as a group. Native SAP tables and target standard views must already exist.
6. Use Eclipse/ADT data preview or your authorized extraction channel to read the views. Keep the same business scope in source and target.
7. Read the module mappings and FIELD_CATALOG.csv. Preserve leading zeros, units, currencies and source identifiers. Map regenerated identifiers before comparing.

Optional reports in helpers are created separately in SE38. Python tools run on your workstation with Python 3.10 or newer and no additional Python dependencies. Selection files are empty until the customer supplies the approved population.

The views read data. Target business-object creation, API/BAPI calls, transaction handling and error recovery belong to the customer's migration implementation. Do not write directly to SAP application tables.
