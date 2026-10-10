"! <p class="shorttext synchronized">ZQMV VDM - Inspection lot CDS unit tests (draft)</p>
"! CDS test double tests. Never executed: no SAP system available.
"! TODO-VERIFY[M] TST-301: test data names (see QM-002) and derived flags in the test double
CLASS zqmv_cl_insplot_test DEFINITION
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


CLASS zqmv_cl_insplot_test IMPLEMENTATION.

  METHOD class_setup.
    environment = cl_cds_test_environment=>create( i_for_entity = 'ZQMV_I_INSPECTIONLOT' ).
  ENDMETHOD.


  METHOD class_teardown.
    environment->destroy( ).
  ENDMETHOD.


  METHOD setup.
    environment->clear_doubles( ).
  ENDMETHOD.


  METHOD derived_values.
    DATA rows TYPE STANDARD TABLE OF i_inspectionlot WITH EMPTY KEY.

    rows = VALUE #(
      ( inspectionlot = '010000000001' inspectionlotusagedecisioncode = 'A' insplotusagedecisionvaluation = 'A' )
      ( inspectionlot = '010000000002' inspectionlotusagedecisioncode = 'R' insplotusagedecisionvaluation = 'R' )
      ( inspectionlot = '010000000003' ) ).
    environment->insert_test_data( i_data = rows ).

    SELECT FROM zqmv_i_inspectionlot
      FIELDS inspectionlot, insplothasusagedecision, insplotisrejected
      INTO TABLE @DATA(result).

    cl_abap_unit_assert=>assert_equals( act = lines( result )
                                        exp = 3 ).
  ENDMETHOD.

ENDCLASS.
