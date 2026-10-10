"! <p class="shorttext synchronized">ZCOV VDM - CO actuals CDS unit tests (draft)</p>
"! CDS test double tests. Never executed: no SAP system available.
"! TODO-VERIFY[M] TST-601: test data names (see CO-031) and the controlling-area filter in the test double
CLASS zcov_cl_coactual_test DEFINITION
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


CLASS zcov_cl_coactual_test IMPLEMENTATION.

  METHOD class_setup.
    environment = cl_cds_test_environment=>create( i_for_entity = 'ZCOV_I_COJOURNALITEM' ).
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
      ( accountingdocument = '0100000001' controllingarea = 'A000' costcenter = '0000010101' )
      ( accountingdocument = '0100000002' ) ).
    environment->insert_test_data( i_data = rows ).

    SELECT FROM zcov_i_cojournalitem
      FIELDS accountingdocument, costcenter
      INTO TABLE @DATA(result).

    cl_abap_unit_assert=>assert_equals( act = lines( result )
                                        exp = 1 ).
  ENDMETHOD.

ENDCLASS.
