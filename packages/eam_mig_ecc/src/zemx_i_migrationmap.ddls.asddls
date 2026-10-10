// ZEMX EAM migration - ECC source - status: draft-unverified (no SAP system available, never activated)
// Purpose: Customer-maintained translation table (map name, old value, new value) used by every consumption view; a value without an entry is delivered unchanged.
// Example: Map plant 1000 to P100: insert MAP_NAME = 'PLANT', SOURCE_VALUE = '1000', TARGET_VALUE = 'P100' into ZEMX_MAP.
// TODO-VERIFY[H] XGEN-004: CHAR comparison of SourceValue (CHAR 50) with shorter key fields in ON conditions and coalesce( TargetValue, <shorter CHAR field> ) are accepted on 7.40 SP08; the result type is CHAR 50
// TODO-VERIFY[H] XGEN-002: literal comparisons (MapName = '...') in the ON condition of a left outer join are supported on 7.40 SP08
@AbapCatalog.sqlViewName: 'ZEMX_MAPV'
@AbapCatalog.compiler.compareFilter: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataCategory: #DIMENSION
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Migration value and key map'
@ObjectModel.representativeKey: 'SourceValue'
@ObjectModel.usageType.dataClass: #CUSTOMIZING
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #M
@VDM.viewType: #BASIC
define view ZEMX_I_MigrationMap
  as select from zemx_map
{
  key zemx_map.map_name     as MapName,
  key zemx_map.source_value as SourceValue,
      zemx_map.target_value as TargetValue
}
