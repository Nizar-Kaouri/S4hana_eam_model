"! <p class="shorttext synchronized">ZFIV VDM - Open item CDS unit tests (draft)</p>
"! CDS test double tests. Never executed: no SAP system available.
"! TODO-VERIFY[M] TST-701: test data names (see FI-041) and the open-item filter in the test double
CLASS zfiv_cl_openitem_test DEFINITION
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


CLASS zfiv_cl_openitem_test IMPLEMENTATION.

  METHOD class_setup.
    environment = cl_cds_test_environment=>create( i_for_entity = 'ZFIV_B_OPENITEM' ).
  ENDMETHOD.


  METHOD class_teardown.
    environment->destroy( ).
  ENDMETHOD.


  METHOD setup.
    environment->clear_doubles( ).
  ENDMETHOD.


  METHOD derived_values.
    DATA rows TYPE STANDARD TABLE OF i_operationalacctgdocitem WITH EMPTY KEY.

    rows = VALUE #(
      companycode = '1010' fiscalyear = '2026' accountingdocumentitem = '001'
      ( accountingdocument = '1900000001' financialaccounttype = 'D' )
      ( accountingdocument = '1900000002' financialaccounttype = 'D' clearingaccountingdocument = '1400000001' )
      ( accountingdocument = '1900000003' financialaccounttype = 'S' ) ).
    environment->insert_test_data( i_data = rows ).

    SELECT FROM zfiv_b_openitem
      FIELDS accountingdocument, financialaccounttype
      INTO TABLE @DATA(result).

    cl_abap_unit_assert=>assert_equals( act = lines( result )
                                        exp = 1 ).
  ENDMETHOD.

ENDCLASS.
