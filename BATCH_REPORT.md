# Batch report

Running log of what was generated, what was checked offline, and what must still be
verified on a real SAP S/4HANA 2025 system.

> **Nothing has been activated or tested on an SAP system.** "Checked" below always means
> offline checks: abaplint, the repository validator and the Python unit tests.

---

## Batch 1 - Equipment, Functional Location, link views

**Date:** 2026-10-09 · **Status:** draft-unverified · **Tested release:** none (draft, 2025 assumed)

### Generated

| Module | Basic | Composite | Consumption | DCL | DDLX | ABAP Unit |
|---|---|---|---|---|---|---|
| equipment | `ZEAM_I_EquipmentText`, `ZEAM_I_Equipment`, `ZEAM_I_EquipmentVH` | `ZEAM_R_Equipment` (cube) | `ZEAM_C_EquipmentQ` | 4 (not for Q) | `ZEAM_R_Equipment` | `ZEAM_CL_EQUIPMENT_TEST` |
| functional_location | `ZEAM_I_FuncLocText`, `ZEAM_I_FuncLoc`, `ZEAM_I_FuncLocVH` | `ZEAM_R_FuncLoc` (cube) | `ZEAM_C_FuncLocQ` | 4 (not for Q) | `ZEAM_R_FuncLoc` | `ZEAM_CL_FUNCLOC_TEST` |
| link (equipment + functional_location) | `ZEAM_I_EquipmentWithFuncLoc`, `ZEAM_I_FuncLocWithEquipment` | - | - | 2 | - | - |

Totals: 12 DDLS, 10 DCLS, 2 DDLX, 2 test classes, 12 doc pages, 2 `module.json`.

Infrastructure created in this batch: `.abapgit.xml`, `abaplint.json`, `library.json`,
`build_package.py` (+ 10 unit tests), `tools/sync_xml.py`, `tools/validate_repo.py`,
`tools/todo_verify_report.py`, `README.md`, `ADT_SETUP.md`, `ACTIVATION_CHECKLIST.md`.

### Offline checks run

| Check | Result |
|---|---|
| abaplint 2.120.71 (`syntax.version` v816 = S/4HANA 2025), files `/src` + `/tests/abap` | **0 issues** (53 files). First run flagged 22 `cds_field_order` issues: inherited associations listed after local ones, and path-expression fields before associations. Fixed by reordering. Test classes: 2 `sequential_blank` issues, fixed. |
| abaplint parser sanity (error injected into a scratch copy) | DDLS errors are detected, including the transient query. DCLS / DDLX syntax errors are **not** detected; abaplint does not parse these types. |
| `tools/validate_repo.py` (rules M1-M11) | **0 errors**. First run found a duplicate TODO-VERIFY id (fixed). Negative test on a scratch copy (cross-module association in a base view, missing DCL, wrong `@VDM.viewType`, unknown DDLX element) produced 4 errors as expected. |
| `tools/sync_xml.py --check` | in sync |
| `python3 -m unittest discover -s tests/build` | 10 tests OK |
| `build_package.py` | single module (no links), both modules (+2 link views +2 DCL), `ZACME_` rewrite, `/ACME/` namespace (`#acme#` file names), length overflow refused, unknown module refused, broken dependency closure refused |
| Activation on SAP | **not possible - no system** |

### Design decisions taken in this batch (please confirm)

1. **Current time segment only.** `ZEAM_I_Equipment` filters `ValidityEndDate = '99991231'`,
   so `Equipment` alone is the key. The equipment history (time segments) is left out for
   now; candidate for Batch 5 (`ZEAM_I_EquipmentTimeSegment`).
2. **No DCL for transient queries.** `ZEAM_C_*Q` carry `@AccessControl.authorizationCheck: #NOT_ALLOWED`
   and are listed in `no_dcl_by_design`. This deviates from hard rule 5 ("every view gets a
   DCL"). As far as we know, a role cannot be defined on a transient entity, and the
   analytical engine applies the provider's (cube's) DCL. Revisit if activation proves otherwise (GEN-Q01).
3. **DCL inheritance from SAP roles** instead of our own PFCG mappings. This depends on the
   SAP roles' element names (EQ-D01, FL-D01, HIGH).
4. **Text views: unrestricted role** (explicit `grant select on ...;`), like SAP's own
   text views, which do not check authorization.
5. **`FuncLoc` abbreviation** in object names, so a prefix up to 6 characters still fits in 30
   (`ZEAM_I_FunctionalLocationText` would have been 29 characters).
6. **Flat package.** All objects go in `ZEAM_VDM` (no sub-package per module). Test classes
   live in `/tests/abap` and are copied into `src/` only with `--with-tests`.
7. **DDLX layer `#PARTNER`.** It suits a sold add-on, and customers can still override in
   `#CUSTOMER`.
8. **Measures on master data.** The cubes use a constant counter (`NumberOfEquipments`,
   `NumberOfFunctionalLocations`). The equipment cube also has `AcquisitionValue`
   aggregated per currency.

### Open risks (beyond the individual TODO-VERIFY items)

| Risk | Impact | Mitigation |
|---|---|---|
| Element names of SAP released views are based on our knowledge of the API, not a system | Many activation errors in the first import | First step of `ACTIVATION_CHECKLIST.md`: compare element lists in ADT before importing |
| abaplint cannot validate DCLS / DDLX syntax | Syntax errors in roles or metadata extensions only show up on the system | `validate_repo.py` M7/M8 structural checks. Activate the DCLs right after their views |
| Link view `ZEAM_I_EquipmentWithFuncLoc` checks only equipment authorizations | Functional-location restrictions are not combined in the link view itself | Documented. Optional later: add a second condition with `replacing { root with _FunctionalLocation }` once that syntax is confirmed |
| `abap-adt-api` signatures in `ADT_SETUP.md` were written without running them | Script may need small adjustments | Marked as draft. Check against the installed version's `.d.ts` |
| ADT type codes / URIs (`DDLS/DF`, `DCLS/DL`, `DDLX/EX`) in `ADT_SETUP.md` | Push step fails | TODO-VERIFY (doc) in `ADT_SETUP.md` §3 |
| Prefix rewrite also changes `ZEAM_` inside comments and string literals | Intended (test classes reference entity names in literals). The product name "ZEAM VDM" in comments stays as is (no underscore) | Covered by unit test `test_prefix_and_package_rewrite` |

### TODO-VERIFY (ranked by risk: HIGH = likely to fail activation / import)

<!-- TODO-VERIFY:BEGIN -->

_Generated by `tools/todo_verify_report.py` - 47 items (HIGH 11, MEDIUM 29, LOW 7). Do not edit by hand._

#### HIGH

| ID | What to verify | Location |
|---|---|---|
| EQ-001 | I_Equipment key is (Equipment, ValidityEndDate); current segment has ValidityEndDate = 99991231 | `src/zeam_i_equipment.ddls.asddls:5` |
| EQ-017 | AcquisitionValue + Currency element names and amount/currency semantics in I_Equipment | `src/zeam_i_equipment.ddls.asddls:79` |
| EQ-019 | location/account-assignment data (ILOA: MaintenancePlant, PlantSection, CompanyCode, BusinessArea, CostCenter...) are direct elements of I_Equipment and not only reachable via an association | `src/zeam_i_equipment.ddls.asddls:8` |
| EQ-D01 | I_Equipment has an access control role and all elements it references are projected by ZEAM_I_Equipment | `src/zeam_i_equipment.dcls.asdcls:5` |
| FL-001 | I_FunctionalLocation key element is FunctionalLocation (internal TPLNR) and is not time-dependent | `src/zeam_i_funcloc.ddls.asddls:5` |
| FL-002 | FunctionalLocationLabelName is the element for the external label (IFLOT-STRNO equivalent) | `src/zeam_i_funcloc.ddls.asddls:6` |
| FL-004 | element name for the structure indicator (IFLOT-TPLKZ); assumed FuncLocationStructure | `src/zeam_i_funcloc.ddls.asddls:39` |
| FL-010 | location/account-assignment data (ILOA) are direct elements of I_FunctionalLocation and not only reachable via an association | `src/zeam_i_funcloc.ddls.asddls:7` |
| FL-D01 | I_FunctionalLocation has an access control role and all elements it references are projected by ZEAM_I_FuncLoc | `src/zeam_i_funcloc.dcls.asdcls:4` |
| GEN-A01 | SOURCE_TYPE for a transient view entity (assumed 'P' like projection views) | `tools/sync_xml.py:29` |
| GEN-Q01 | @AccessControl.authorizationCheck: #NOT_ALLOWED is the correct value for a transient analytical query | `src/zeam_c_equipmentq.ddls.asddls:5` |

#### MEDIUM

| ID | What to verify | Location |
|---|---|---|
| EQ-002 | I_EquipmentCategory exists (key EquipmentCategory) and is released | `src/zeam_i_equipment.ddls.asddls:6` |
| EQ-003 | I_TechnicalObjectType exists (key TechnicalObjectType) and is released | `src/zeam_i_equipment.ddls.asddls:7` |
| EQ-010 | ValidityStartDate / ValidityEndDate element names in I_Equipment | `src/zeam_i_equipment.ddls.asddls:37` |
| EQ-011 | AuthorizationGroup element name in I_Equipment (EQUI-BEGRU) | `src/zeam_i_equipment.ddls.asddls:44` |
| EQ-012 | MaintenancePlannerGroup, PlantSection, AssetLocation, AssetRoom, ABCIndicator in I_Equipment | `src/zeam_i_equipment.ddls.asddls:50` |
| EQ-013 | EquipInstallationPositionNmbr element name (EQUZ-HEQNR) | `src/zeam_i_equipment.ddls.asddls:59` |
| EQ-014 | MasterFixedAsset / FixedAsset element names in I_Equipment | `src/zeam_i_equipment.ddls.asddls:66` |
| EQ-015 | manufacturer element names (AssetManufacturerName, ManufacturerPartNmbr, ManufacturerSerialNumber, ConstructionYear) | `src/zeam_i_equipment.ddls.asddls:71` |
| EQ-016 | InventoryNumber / OperationStartDate element names in I_Equipment | `src/zeam_i_equipment.ddls.asddls:76` |
| EQ-018 | CreationDate / CreatedByUser element names in I_Equipment | `src/zeam_i_equipment.ddls.asddls:83` |
| EQ-R02 | amount measure AcquisitionValue aggregates per Currency (depends on EQ-017) | `src/zeam_r_equipment.ddls.asddls:4` |
| EQ-T01 | I_EquipmentText exists and is released (C1) in S/4HANA 2025 | `src/zeam_i_equipmenttext.ddls.asddls:2` |
| EQ-T02 | I_EquipmentText element names Equipment / Language / EquipmentName | `src/zeam_i_equipmenttext.ddls.asddls:3` |
| EQ-V01 | path filter syntax _Text[1: Language = $session.system_language] accepted in a view entity | `src/zeam_i_equipmentvh.ddls.asddls:4` |
| FL-003 | I_FunctionalLocationCategory exists (key FunctionalLocationCategory) and is released | `src/zeam_i_funcloc.ddls.asddls:8` |
| FL-005 | SuperiorFunctionalLocation element name (IFLOT-TPLMA) | `src/zeam_i_funcloc.ddls.asddls:42` |
| FL-006 | AuthorizationGroup element name in I_FunctionalLocation (IFLOT-BEGRU) | `src/zeam_i_funcloc.ddls.asddls:46` |
| FL-007 | MaintenancePlannerGroup, PlantSection, AssetLocation, AssetRoom, ABCIndicator in I_FunctionalLocation | `src/zeam_i_funcloc.ddls.asddls:52` |
| FL-008 | manufacturer / construction / inventory element names in I_FunctionalLocation | `src/zeam_i_funcloc.ddls.asddls:63` |
| FL-009 | CreationDate / CreatedByUser element names in I_FunctionalLocation | `src/zeam_i_funcloc.ddls.asddls:68` |
| FL-T01 | I_FunctionalLocationText exists and is released (C1) in S/4HANA 2025 | `src/zeam_i_funcloctext.ddls.asddls:2` |
| FL-T02 | I_FunctionalLocationText element names FunctionalLocation / Language / FunctionalLocationName | `src/zeam_i_funcloctext.ddls.asddls:3` |
| FL-V01 | path filter syntax _Text[1: Language = $session.system_language] accepted in a view entity | `src/zeam_i_funclocvh.ddls.asddls:4` |
| GEN-D01 | unrestricted grant syntax (grant select on <entity>; without where clause) | `src/zeam_i_equipmenttext.dcls.asdcls:5` |
| GEN-D02 | inheriting from a Z entity whose own role inherits from an SAP entity (chained inheritance) | `src/zeam_i_equipmentvh.dcls.asdcls:4` |
| GEN-Q02 | @VDM.viewType: #CONSUMPTION accepted on a transient view entity | `src/zeam_c_equipmentq.ddls.asddls:6` |
| LNK-002 | I_Equipment.FunctionalLocation holds the internal key that matches I_FunctionalLocation.FunctionalLocation | `src/zeam_i_equipmentwithfuncloc.ddls.asddls:7` |
| TST-001 | test data names (see EQ-0xx); test double resolves path _Text in ZEAM_I_EquipmentVH | `tests/abap/zeam_cl_equipment_test.clas.abap:3` |
| TST-002 | test data names (see FL-0xx); test double resolves path _Text in ZEAM_I_FuncLocVH | `tests/abap/zeam_cl_funcloc_test.clas.abap:3` |

#### LOW

| ID | What to verify | Location |
|---|---|---|
| EQ-004 | @Analytics.internalName: #LOCAL accepted on a #DIMENSION view entity | `src/zeam_i_equipment.ddls.asddls:9` |
| EQ-R01 | literal measure cast( 1 as abap.int4 ) with @Aggregation.default: #SUM in a #CUBE view entity | `src/zeam_r_equipment.ddls.asddls:3` |
| EQ-V02 | @Search.* and @Consumption.ranked annotations on a view entity value help | `src/zeam_i_equipmentvh.ddls.asddls:5` |
| FL-R01 | literal measure cast( 1 as abap.int4 ) with @Aggregation.default: #SUM in a #CUBE view entity | `src/zeam_r_funcloc.ddls.asddls:3` |
| GEN-Q03 | @AnalyticsDetails.query.axis and @Consumption.filter syntax in analytical_query projections | `src/zeam_c_equipmentq.ddls.asddls:7` |
| GEN-X01 | @Metadata.layer: #PARTNER is appropriate for a sold add-on (alternatively #INDUSTRY / #CUSTOMER) | `src/zeam_r_equipment.ddlx.asddlx:3` |
| LNK-001 | to-many association target filtered by the equipment's FunctionalLocation element (no installation-date logic) | `src/zeam_i_funclocwithequipment.ddls.asddls:5` |

<!-- TODO-VERIFY:END -->

### Verification log

_Empty. Add one line per verified item: date, system/release, ID, result, and the commit with the fix if one was needed._

---

## Next: Batch 2 - Maintenance Notification, Maintenance Order (header, operation, component)

Not started. Stopped after Batch 1 as instructed.
