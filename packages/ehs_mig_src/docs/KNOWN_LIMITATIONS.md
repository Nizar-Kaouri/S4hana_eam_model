# ModuPorter Environment Health and Safety

Version 0.1.0. Draft templates, never activated or tested on SAP. Source path: Classic EHS Specification/Phrase Management and modern EHSM/EHS applications are distinct; enable only the applicable path.

| Module | ID | Structures | Mode |
|---|---|---|---|
| EHS locations and hierarchy | ehs_location | 2 | master |
| Chemical and physical property definitions | chemical_property | 2 | master |
| Specifications identifiers and property values | specification | 3 | master |
| Phrases translations and set assignments | phrase | 2 | master |
| Incidents people and actions | incident | 3 | process-reference |
| Risk assessments hazards and controls | risk_assessment | 3 | reference |
| Classifiers data collection and measurements | environmental_data | 3 | reference |
| Compliance requirements scenarios and assignments | compliance | 3 | master |
| Dangerous goods classifications and regulations | dangerous_goods | 2 | regulatory-reference |

Specification records and modern EHSM objects are not interchangeable. Preserve versions, validity, regulatory jurisdiction, units, multilingual phrases and native evaluation semantics. Incident people/medical content needs restricted access; attachments and long texts use approved repository/text interfaces. Historic assessments, measurements and incidents are reference data until a supported target object is selected. Product Compliance and Dangerous Goods have separate object/release scopes; a canonical contract does not certify legal or regulatory content.

These packs define canonical export contracts and customer-owned staging DDIC tables. They do not directly query or change native SAP business tables. Basic → Composite → Consumption preserves each contract's grain. The target stages and comparison views contain exported target evidence; a stage insert is not a business migration. All values are text to preserve IDs, decimal representations and UTC/time-zone evidence. Use approved currency/unit totals; no mathematical meaning is implied by a CHAR field. Long texts, binaries, all customizing and every industry/application feature are outside this explicitly catalogued scope.
