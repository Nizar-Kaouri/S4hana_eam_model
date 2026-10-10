"! <p class="shorttext synchronized">ZPPV VDM - Production order CDS unit tests (draft)</p>
"! CDS test double tests. Never executed: no SAP system available.
"! TODO-VERIFY[M] TST-501: test data names (see PP-003) and the derived open flag in the test double
CLASS zppv_cl_prodorder_test DEFINITION
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


CLASS zppv_cl_prodorder_test IMPLEMENTATION.

  METHOD class_setup.
    environment = cl_cds_test_environment=>create( i_for_entity = 'ZPPV_I_PRODUCTIONORDER' ).
  ENDMETHOD.


  METHOD class_teardown.
    environment->destroy( ).
  ENDMETHOD.


  METHOD setup.
    environment->clear_doubles( ).
  ENDMETHOD.


  METHOD derived_values.
    DATA rows TYPE STANDARD TABLE OF i_manufacturingorder WITH EMPTY KEY.

    rows = VALUE #(
      ( manufacturingorder = '000001000001' orderistechnicallycompleted = abap_false )
      ( manufacturingorder = '000001000002' orderistechnicallycompleted = abap_true ) ).
    environment->insert_test_data( i_data = rows ).

    SELECT FROM zppv_i_productionorder
      FIELDS manufacturingorder, productionorderisopen
      INTO TABLE @DATA(result).

    cl_abap_unit_assert=>assert_equals( act = lines( result )
                                        exp = 2 ).
  ENDMETHOD.

ENDCLASS.
