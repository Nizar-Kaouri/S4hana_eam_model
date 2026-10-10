# Installation

Unzip the appropriate ECC or S/4HANA package. Check library.json, BUILD_MANIFEST.json, OPEN_CHECKS.md and DDIC_REQUIREMENTS.csv. Import the src objects into a customer Z package with abapGit and activate using ACTIVATION_ORDER.txt. Prefix and package customization is supported by build_package.py. Install helpers separately in SE38 after reviewing their source and authorization. Use Python 3.10 or higher; no external Python dependencies are required. Follow CUSTOMER_WORKFLOW and CUSTOMER_TEST before posting.
