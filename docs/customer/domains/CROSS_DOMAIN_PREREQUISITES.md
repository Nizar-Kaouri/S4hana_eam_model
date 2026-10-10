# Cross domain prerequisites

Customer customizing, company codes, controlling areas, plants, currencies, units, calendars and catalogs must exist first. This matrix orders business posting work; it does not imply that history/reference modules are posted.

| Data | Prerequisites |
|---|---|
| G/L accounts | Chart of accounts and company codes |
| Profit and cost centers | FI organizational scope; profit centers before assigned cost centers |
| Customer and supplier | Business Partner/CVI strategy and reconciliation accounts |
| Material master | FI valuation/account determination and organization |
| Fixed assets | FI-AA configuration, FI accounts and CO assignments |
| Projects and WBS | FI/CO organization, hierarchy and internal-to-external key mapping |
| Purchasing and sales | Material master, business partners and mapped CO/PS assignments |
| Inventory | Material/batch master and reconciled cutover totals |
| BOMs and routings | Materials, work centers and verified effectivity |
| QM | Materials, plants, catalogs and verified inspection process scope |
| EAM | Materials, fixed assets, business partners, CO/PS and work centers as applicable |

Existing rpt_* analytical modules stay in their original product folders. Asset balance migration has its own asset_balance module; open purchasing and sales populations use the corresponding business module plus customer scope approval. The commercial claim is the explicitly catalogued template scope, not universal coverage of SAP.

EWM, TM, FSCM, EHS and industry candidates remain feasibility items until their business object and interface scopes are defined. They have no existing product folder in this repository and are not included in these eight drafts.
