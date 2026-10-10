# Customer staging reports

Create stage_load and stage_export manually in SE38. Only the delivered customer stages are allowlisted. Loader requires S_TABU_NAM change authorization and defaults to simulation. Exporter requires display authorization. Validate UTF-8 TSV, all-field CHAR lengths, duplicate insert rollback and current-client behavior on SAP before use. Native business tables are never allowed. A stage insert does not create a business object.
