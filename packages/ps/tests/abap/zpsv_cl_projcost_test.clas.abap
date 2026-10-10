"! <p class="shorttext synchronized">ZPSV VDM - Project cost CDS unit tests (draft)</p>
"! CDS test double tests. Never executed: no SAP system available.
"! TODO-VERIFY[M] TST-401: test data names (see PS-020) and the WBS filter in the test double
CLASS zpsv_cl_projcost_test DEFINITION
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
    METHODS derived_values FOR TESTING.
ENDCLASS.


CLASS zpsv_cl_projcost_test IMPLEMENTATION.

  METHOD class_setup.
    environment = cl_cds_test_environment=>create( i_for_entity = 'ZPSV_I_PROJECTJOURNALITEM' ).
  ENDMETHOD.


  METHOD class_teardown.
    environment->destroy( ).
  ENDMETHOD.


  METHOD setup.
    environment->clear_doubles( ).
  ENDMETHOD.


  METHOD derived_values.
    DATA rows TYPE STANDARD TABLE OF i_journalentryitem WITH EMPTY KEY.

    rows = VALUE #(
      companycode = '1010' fiscalyear = '2026' ledger = '0L' ledgergllineitem = '000001'
      ( accountingdocument = '0100000001' wbselementinternalid = '00000001' businesstransactiontype = 'RKL' )
      ( accountingdocument = '0100000002' wbselementinternalid = '00000001' businesstransactiontype = 'KOAO' )
      ( accountingdocument = '0100000003' ) ).
    environment->insert_test_data( i_data = rows ).

    SELECT FROM zpsv_i_projectjournalitem
      FIELDS accountingdocument, issettlementposting
      INTO TABLE @DATA(result).

    cl_abap_unit_assert=>assert_equals( act = lines( result )
                                        exp = 2 ).
  ENDMETHOD.

ENDCLASS.
