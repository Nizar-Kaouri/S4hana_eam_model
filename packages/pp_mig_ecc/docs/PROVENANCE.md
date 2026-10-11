# Provenance

Author: ModuPorter. Sources implement original customer template views, not copied SAP source code. Source DDIC fields and target view projections depend on the installed SAP release and require compatibility review.

SAP migration guidance confirms that the available objects and posting rules depend on release, deployment and configuration. These sources justify the business boundaries, not the guessed field availability:

- https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/29193bf0ebdd4583930b2176cb993268/8dd142b479f9481891fa8b3f86648df3.html
- https://help.sap.com/docs/DATAMIG_S4HANA/0a51c1b7a2e14c1ab54ff8115ff110a1/af8751b510ca4550aeb1ed503eafa50e.html
- https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/d3a3eb7caa1842858bf0372e17ad3909/75f49eeacd204bb38a76492e95345065.html

Checked 2026-10-10. None of these citations establishes the DDIC keys or aliases drafted here. Verify them in SAP.

## Coverage extension research

Checked 2026-10-11. These official SAP sources establish object boundaries and selected table roles. They do not establish complete release-specific DDIC keys, field names or target adapter implementation. Verify all extraction structures on the customer system.

- [Available migration objects](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/29193bf0ebdd4583930b2176cb993268/8dd142b479f9481891fa8b3f86648df3.html)
- [Classic G/L balances and account eligibility](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/d3a3eb7caa1842858bf0372e17ad3909/f51bae412a414c58b90ba24cb23daa9d.html)
- [Financial migration posting and clearing](https://help.sap.com/docs/DATAMIG_S4HANA/0a51c1b7a2e14c1ab54ff8115ff110a1/af8751b510ca4550aeb1ed503eafa50e.html)
- [Production versions and MKAL](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/d3a3eb7caa1842858bf0372e17ad3909/94e563ae05544015adbf46931532aa3f.html)
- [Master inspection characteristic tables](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/2bc3ee8d1c83404e8cf62418640004f2/7767b65334e6b54ce10000000a174cb4.html)
- [Purchasing info record tables](https://help.sap.com/docs/SUPPORT_CONTENT/spmm/3362168709.html)
- [Purchasing condition access tables](https://help.sap.com/docs/SUPPORT_CONTENT/spmm/3362167609.html)
- [Condition header item and scale architecture](https://help.sap.com/docs/SAP_S4HANA_ON-PREMISE/7b24a64d9d0941bda1afa753263d9e39/ed8cc95360267214e10000000a174cb4.html)
- [Commitments and their purchasing source](https://help.sap.com/docs/SUPPORT_CONTENT/spmm/3362167763.html)
