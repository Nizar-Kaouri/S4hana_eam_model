// ModuPorter migration - status: draft-unverified (never activated on SAP)
// Purpose: Read ProjectCompare as target comparison candidates.
// Example: Export a small approved cohort, preserve internal keys, and compare with the mapped target population.
// TODO-VERIFY[H] PST-001: Verify source availability, exact fields, complete DDIC keys and authorizations on the customer release.
@AccessControl.authorizationCheck: #NOT_REQUIRED
@Analytics.dataExtraction.enabled: false
@EndUserText.label: 'ProjectCompare'
@ObjectModel.usageType.dataClass: #MIXED
@ObjectModel.usageType.serviceQuality: #D
@ObjectModel.usageType.sizeCategory: #L
@VDM.viewType: #BASIC
define view entity ZPST_I_ProjectCompare
  as select from I_EnterpriseProject as src
{
  key src.EnterpriseProject as ProjectInternalID,
      src.EnterpriseProjectID as ProjectExternalID,
      src.EnterpriseProjectDescription as ProjectDescription,
      src.CompanyCode as CompanyCode,
      src.ControllingArea as ControllingArea
}
