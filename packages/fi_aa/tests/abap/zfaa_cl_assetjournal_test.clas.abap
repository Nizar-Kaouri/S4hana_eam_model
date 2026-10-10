"! <p class="shorttext synchronized">ZFAA VDM - Asset journal CDS unit tests (draft)</p>
"! CDS test double tests for module "asset_transaction". Never executed: no SAP system.
"! TODO-VERIFY[M] TST-101: test data names (see AT-0xx) and the path element GLAccountType in the test double
CLASS zfaa_cl_assetjournal_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  FOR TESTING
  RISK LEVEL HARMLESS
  DURATION SHORT.

  PRIVATE SECTION.
    CLASS-DATA environment TYPE REF TO if_cds_test_environment.

    CLASS-METHODS class_setup.
    CLASS-METHODS class_teardown.

    METHODS setup.
    METHODS value_category_rules FOR TESTING.
    METHODS lines_without_asset_ignored FOR TESTING.
ENDCLASS.


CLASS zfaa_cl_assetjournal_test IMPLEMENTATION.

  METHOD class_setup.
    environment = cl_cds_test_environment=>create( i_for_entity = 'ZFAA_I_ASSETJOURNALITEM' ).
  ENDMETHOD.


  METHOD class_teardown.
    environment->destroy( ).
  ENDMETHOD.


  METHOD setup.
    environment->clear_doubles( ).
  ENDMETHOD.


  METHOD value_category_rules.
    DATA items TYPE STANDARD TABLE OF i_journalentryitem WITH EMPTY KEY.

    items = VALUE #( companycode = '1010' fiscalyear = '2026' ledger = '0L' masterfixedasset = '000000100001'
      ( accountingdocument = '0100000001' ledgergllineitem = '000001' assettransactiontype = '100' )
      ( accountingdocument = '0100000002' ledgergllineitem = '000001' assettransactiontype = '210' )
      ( accountingdocument = '0100000003' ledgergllineitem = '000001' assettransactiontype = '300' )
      ( accountingdocument = '0100000004' ledgergllineitem = '000001' businesstransactiontype = 'AFAB' ) ).
    environment->insert_test_data( i_data = items ).

    SELECT FROM zfaa_i_assetjournalitem
      FIELDS accountingdocument, assetvaluecategory
      ORDER BY accountingdocument
      INTO TABLE @DATA(result).

    cl_abap_unit_assert=>assert_equals( act = lines( result )
                                        exp = 4 ).
    cl_abap_unit_assert=>assert_equals( act = result[ 1 ]-assetvaluecategory
                                        exp = 'ACQ' ).
    cl_abap_unit_assert=>assert_equals( act = result[ 2 ]-assetvaluecategory
                                        exp = 'RET' ).
    cl_abap_unit_assert=>assert_equals( act = result[ 3 ]-assetvaluecategory
                                        exp = 'TRF' ).
    cl_abap_unit_assert=>assert_equals( act = result[ 4 ]-assetvaluecategory
                                        exp = 'DEP' ).
  ENDMETHOD.


  METHOD lines_without_asset_ignored.
    DATA items TYPE STANDARD TABLE OF i_journalentryitem WITH EMPTY KEY.

    items = VALUE #( companycode = '1010' fiscalyear = '2026' ledger = '0L'
      ( accountingdocument = '0100000010' ledgergllineitem = '000001' )
      ( accountingdocument = '0100000011' ledgergllineitem = '000001' masterfixedasset = '000000100002' ) ).
    environment->insert_test_data( i_data = items ).

    SELECT FROM zfaa_i_assetjournalitem
      FIELDS accountingdocument
      INTO TABLE @DATA(result).

    cl_abap_unit_assert=>assert_equals( act = lines( result )
                                        exp = 1 ).
  ENDMETHOD.

ENDCLASS.
