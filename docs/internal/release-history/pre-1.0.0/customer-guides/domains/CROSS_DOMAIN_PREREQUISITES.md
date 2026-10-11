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

## Coverage additions in 0.2.0

Network and investment-measure assignments follow WBS/internal-order and FI-AA identifier mapping. Budgets and commitments require independent fiscal-year and currency contracts. Production versions follow material, BOM and routing. Master inspection characteristics and sampling configuration precede inspection plans. Purchasing info records/contracts and sales pricing require the configured access-key tables and condition scales. CO allocation cycles also require sender/receiver sets and rules through a native configuration export. G/L opening balances exclude amounts already migrated through subledgers or open items.
