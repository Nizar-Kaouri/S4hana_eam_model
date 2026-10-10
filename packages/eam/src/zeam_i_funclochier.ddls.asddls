// ZEAM EAM/PM VDM - status: draft-unverified (no SAP system available, never activated)
// Purpose: CDS parent-child hierarchy of functional locations (roots = locations without superior
//   location) with level, rank and tree size of every node.
// Example: SELECT FROM ZEAM_I_FuncLocHier to list a plant structure top-down; subtree size per location.
// Analytical use (hierarchy display in queries) needs an additional hierarchy annotation on a
// dimension; that hookup is open (FH-003).
// TODO-VERIFY[H] FH-001: define hierarchy syntax (source / child to parent association / start where / siblings order by / multiple parents / orphans / cycles) on S/4HANA 2025
// TODO-VERIFY[M] FH-002: hierarchy node attributes $node.hierarchy_level, hierarchy_rank, hierarchy_tree_size, hierarchy_parent_rank
// TODO-VERIFY[M] FH-003: analytical hierarchy usage (e.g. @ObjectModel.hierarchy.association on a functional location dimension) not modeled yet
@AccessControl.authorizationCheck: #CHECK
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'Functional Location Hierarchy'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType: {
  serviceQuality: #C,
  sizeCategory: #L,
  dataClass: #MASTER
}
@VDM.viewType: #BASIC
define hierarchy ZEAM_I_FuncLocHier
  as parent child hierarchy(
    source ZEAM_I_FuncLocHierNode
    child to parent association _SuperiorNode
    start where
      SuperiorFunctionalLocation = ''
    siblings order by
      FunctionalLocation ascending
    multiple parents not allowed
    orphans root
    cycles breakup
  )
{
  FunctionalLocation,
  SuperiorFunctionalLocation,
  FunctionalLocationLabelName,
  FunctionalLocationCategory,
  TechnicalObjectType,
  AuthorizationGroup,
  MaintenancePlant,
  MaintenancePlanningPlant,
  PlantSection,
  CompanyCode,
  BusinessArea,
  CostCenter,
  $node.hierarchy_level       as HierarchyLevel,
  $node.hierarchy_rank        as HierarchyRank,
  $node.hierarchy_parent_rank as HierarchyParentRank,
  $node.hierarchy_tree_size   as HierarchyTreeSize
}
