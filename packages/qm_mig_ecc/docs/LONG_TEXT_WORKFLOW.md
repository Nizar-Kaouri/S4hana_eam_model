# Long-text delivery

Native STXH -> B text data -> I object long-text index -> C object long-text index.
Each row preserves TextObject, TextName, TextID and Language. The customer project
uses a text_scope step with a full-key owner link file and the prepared master
population. Index records without an approved owner link are excluded, including
texts of unselected masters. Duplicate identities, ambiguous links, missing
referenced texts and duplicate parent identities stop preparation.

Populate customer/text-links from the source text editor header/application
metadata. SAP documents that OBJECT, ID and NAME depend on the application and
its configuration. Include organizational/item keys in the owner link when the
text belongs to that level. Use that level's prepared parent instead of the
header parent in the customer project. Do not guess NAME from visible external
labels, object-number prefixes or substrings; preserve canonical internal keys.

Convert the prepared index to a UTF-8, headerless tab-separated file in the order
TextObject, TextName, TextID, Language. Run the shipped *_text_export report via
SE38 using this file. READ_TEXT retrieves the content; its CSV preserves the
complete text identity, LineNumber, SAPscript Format and Text. Retrieval failure
prevents partial output. The CDS index itself does not contain the text content.
Use migrated business-key mappings and target customizing to construct the target
text identity, then write through a supported business interface.

The link CSV is preparation configuration, not a custom SAP staging table. All
CDS sources remain native SAP tables. Existing equipment-specific exports remain
available for their documented canonical format; choose one path for each text
population so records are not delivered twice.

Sources: [SAP long-text keys and text editor](https://help.sap.com/docs/SAP_NETWEAVER_AS_ABAP_FOR_SOH_740/f6a2c35cb0dd4900ad16d735f1415331/4dafaf283c31288de10000000a42189e.html);
[STXH/STXL storage](https://help.sap.com/docs/ABAP_PLATFORM_NEW/854a52b763004c1087e27e1b4bfe4285/3b04178b239647b5b7c78bcaaae5c2ed.html).
