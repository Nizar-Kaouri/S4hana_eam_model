# Migration sequence

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

Load order derived from `sequence_after`. Objects on the same level can be loaded in parallel; objects that refer to other objects load after them.

| Level | Modules | Consumption views read by the load program |
|---|---|---|
| 1 | [`chemical_property`](mapping/chemical_property.md), [`dangerous_goods`](mapping/dangerous_goods.md), [`ehs_location`](mapping/ehs_location.md), [`phrase`](mapping/phrase.md) | `ZEHX_C_ChemicalPropMig`, `ZEHX_C_PropertyUnitMig`, `ZEHX_C_DangerousGoodsMig`, `ZEHX_C_DGTransportMig`, `ZEHX_C_EHSLocationMig`, `ZEHX_C_EHSLocHierarchMig`, `ZEHX_C_PhraseMig`, `ZEHX_C_PhraseSetMig` |
| 2 | [`environmental_data`](mapping/environmental_data.md), [`incident`](mapping/incident.md), [`risk_assessment`](mapping/risk_assessment.md), [`specification`](mapping/specification.md) | `ZEHX_C_DataClassifierMig`, `ZEHX_C_DataCollectionMig`, `ZEHX_C_MeasurementMig`, `ZEHX_C_IncidentMig`, `ZEHX_C_IncidentPersonMig`, `ZEHX_C_IncidentActionMig`, `ZEHX_C_RiskAssessmentMig`, `ZEHX_C_RiskHazardMig`, `ZEHX_C_RiskControlMig`, `ZEHX_C_SpecificationMig`, `ZEHX_C_SpecIdentifierMig`, `ZEHX_C_SpecPropertyMig` |
| 3 | [`compliance`](mapping/compliance.md) | `ZEHX_C_ComplianceReqMig`, `ZEHX_C_ComplianceScenMig`, `ZEHX_C_ComplianceLinkMig` |
