// ModuPorter PS migration | Release 1.0.0
// Purpose: Read ProjectCompare as target comparison records.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// Compatibility note: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProjectCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZPST_B_ProjectCompare
  as select from I_EnterpriseProject as src
{
  key src.EnterpriseProject as ProjectInternalID,
      src.EnterpriseProjectID as ProjectExternalID,
      src.EnterpriseProjectDescription as ProjectDescription,
      src.CompanyCode as CompanyCode,
      src.ControllingArea as ControllingArea
}
