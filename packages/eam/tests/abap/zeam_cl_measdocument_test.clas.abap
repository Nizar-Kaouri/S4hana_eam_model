"! <p class="shorttext synchronized">ZEAM VDM - Measurement Document CDS unit tests (draft)</p>
"! CDS test double tests for module "measurement_document". Never executed: no SAP system.
"! TODO-VERIFY[M] TST-005: test data names (see MD-0xx) and fltp_to_dec behaviour in the test double
CLASS zeam_cl_measdocument_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  FOR TESTING
  RISK LEVEL HARMLESS
  DURATION SHORT.

  PRIVATE SECTION.
    CLASS-DATA cube_environment TYPE REF TO if_cds_test_environment.

    CLASS-METHODS class_setup.
    CLASS-METHODS class_teardown.

    METHODS setup.
    METHODS cancelled_readings_excluded FOR TESTING.
ENDCLASS.


CLASS zeam_cl_measdocument_test IMPLEMENTATION.

  METHOD class_setup.
    cube_environment = cl_cds_test_environment=>create( i_for_entity = 'ZEAM_R_MEASDOCUMENT' ).
  ENDMETHOD.


  METHOD class_teardown.
    cube_environment->destroy( ).
  ENDMETHOD.


  METHOD setup.
    cube_environment->clear_doubles( ).
  ENDMETHOD.


  METHOD cancelled_readings_excluded.
    DATA documents TYPE STANDARD TABLE OF zeam_i_measdocument WITH EMPTY KEY.

    documents = VALUE #( measuringpoint = '000000000001'
      ( measurementdocument = '000000000101' measurementreading = '10' )
      ( measurementdocument = '000000000102' measurementreading = '30' )
      ( measurementdocument = '000000000103' measurementreading = '99' msmtdocumentiscancelled = abap_true ) ).
    cube_environment->insert_test_data( i_data = documents ).

    SELECT FROM zeam_r_measdocument
      FIELDS measuringpoint,
             SUM( numberofreadings ) AS readings,
             MAX( maximumreading ) AS maximum
      GROUP BY measuringpoint
      INTO TABLE @DATA(result).

    cl_abap_unit_assert=>assert_equals( act = result[ 1 ]-readings
                                        exp = 2 ).
    cl_abap_unit_assert=>assert_equals( act = result[ 1 ]-maximum
                                        exp = 30 ).
  ENDMETHOD.

ENDCLASS.
