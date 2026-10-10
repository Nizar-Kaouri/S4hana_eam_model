"! <p class="shorttext synchronized">ZEAM VDM - Notification CDS unit tests (draft)</p>
"! CDS test double tests for module "maintenance_notification". Never executed: no SAP system.
"! TODO-VERIFY[M] TST-003: test data names (see NT-0xx) and processing phase codes (NT-005)
CLASS zeam_cl_maintnotif_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  FOR TESTING
  RISK LEVEL HARMLESS
  DURATION SHORT.

  PRIVATE SECTION.
    CLASS-DATA basic_environment TYPE REF TO if_cds_test_environment.
    CLASS-DATA cube_environment TYPE REF TO if_cds_test_environment.

    CLASS-METHODS class_setup.
    CLASS-METHODS class_teardown.

    METHODS setup.
    METHODS open_flag_from_phase FOR TESTING.
    METHODS cube_counts_breakdowns FOR TESTING.
ENDCLASS.


CLASS zeam_cl_maintnotif_test IMPLEMENTATION.

  METHOD class_setup.
    basic_environment = cl_cds_test_environment=>create( i_for_entity = 'ZEAM_I_MAINTNOTIF' ).
    cube_environment = cl_cds_test_environment=>create( i_for_entity = 'ZEAM_R_MAINTNOTIF' ).
  ENDMETHOD.


  METHOD class_teardown.
    basic_environment->destroy( ).
    cube_environment->destroy( ).
  ENDMETHOD.


  METHOD setup.
    basic_environment->clear_doubles( ).
    cube_environment->clear_doubles( ).
  ENDMETHOD.


  METHOD open_flag_from_phase.
    DATA notifications TYPE STANDARD TABLE OF i_maintenancenotification WITH EMPTY KEY.

    notifications = VALUE #(
      ( maintenancenotification = '000010000001' notifprocessingphase = '1' )
      ( maintenancenotification = '000010000002' notifprocessingphase = '3' )
      ( maintenancenotification = '000010000003' notifprocessingphase = '4' ) ).
    basic_environment->insert_test_data( i_data = notifications ).

    SELECT FROM zeam_i_maintnotif
      FIELDS maintenancenotification, maintnotifisopen
      ORDER BY maintenancenotification
      INTO TABLE @DATA(result).

    cl_abap_unit_assert=>assert_equals( act = lines( result )
                                        exp = 3 ).
    cl_abap_unit_assert=>assert_equals( act = result[ 2 ]-maintnotifisopen
                                        exp = abap_true ).
    cl_abap_unit_assert=>assert_equals( act = result[ 3 ]-maintnotifisopen
                                        exp = abap_false ).
  ENDMETHOD.


  METHOD cube_counts_breakdowns.
    DATA notifications TYPE STANDARD TABLE OF zeam_i_maintnotif WITH EMPTY KEY.

    notifications = VALUE #( maintenanceplanningplant = '1010'
      ( maintenancenotification = '000010000001' maintenanceobjectisdown = abap_true )
      ( maintenancenotification = '000010000002' maintenanceobjectisdown = abap_false )
      ( maintenancenotification = '000010000003' maintenanceobjectisdown = abap_true ) ).
    cube_environment->insert_test_data( i_data = notifications ).

    SELECT FROM zeam_r_maintnotif
      FIELDS maintenanceplanningplant,
             SUM( numberofnotifications ) AS total,
             SUM( numberofbreakdownnotifs ) AS breakdowns
      GROUP BY maintenanceplanningplant
      INTO TABLE @DATA(result).

    cl_abap_unit_assert=>assert_equals( act = result[ 1 ]-total
                                        exp = 3 ).
    cl_abap_unit_assert=>assert_equals( act = result[ 1 ]-breakdowns
                                        exp = 2 ).
  ENDMETHOD.

ENDCLASS.
