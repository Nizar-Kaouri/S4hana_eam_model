"! <p class="shorttext synchronized">ZSDV VDM - Sales order CDS unit tests (draft)</p>
"! CDS test double tests. Never executed: no SAP system available.
"! TODO-VERIFY[M] TST-801: test data names (see SD-001, SD-002) and the order category filter in the test double
CLASS zsdv_cl_salesorder_test DEFINITION
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


CLASS zsdv_cl_salesorder_test IMPLEMENTATION.

  METHOD class_setup.
    environment = cl_cds_test_environment=>create( i_for_entity = 'ZSDV_I_SALESORDER' ).
  ENDMETHOD.


  METHOD class_teardown.
    environment->destroy( ).
  ENDMETHOD.


  METHOD setup.
    environment->clear_doubles( ).
  ENDMETHOD.


  METHOD derived_values.
    DATA rows TYPE STANDARD TABLE OF i_salesdocument WITH EMPTY KEY.

    rows = VALUE #(
      ( salesdocument = '0000000001' sddocumentcategory = 'C' overallsdprocessstatus = 'A' )
      ( salesdocument = '0000000002' sddocumentcategory = 'C' overallsdprocessstatus = 'C' )
      ( salesdocument = '0000000003' sddocumentcategory = 'B' ) ).
    environment->insert_test_data( i_data = rows ).

    SELECT FROM zsdv_i_salesorder
      FIELDS salesdocument, salesorderisopen
      INTO TABLE @DATA(result).

    cl_abap_unit_assert=>assert_equals( act = lines( result )
                                        exp = 2 ).
  ENDMETHOD.

ENDCLASS.
