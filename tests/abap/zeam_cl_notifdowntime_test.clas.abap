"! <p class="shorttext synchronized">ZEAM VDM - Downtime report CDS unit tests (draft)</p>
"! CDS test double tests for module "rpt_downtime". Never executed: no SAP system.
"! TODO-VERIFY[M] TST-006: timestamp functions behave identically in the test double (same system time zone)
CLASS zeam_cl_notifdowntime_test DEFINITION
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
    METHODS downtime_across_midnight FOR TESTING.
    METHODS open_malfunction_no_downtime FOR TESTING.
ENDCLASS.


CLASS zeam_cl_notifdowntime_test IMPLEMENTATION.

  METHOD class_setup.
    environment = cl_cds_test_environment=>create( i_for_entity = 'ZEAM_I_NOTIFDOWNTIME' ).
  ENDMETHOD.


  METHOD class_teardown.
    environment->destroy( ).
  ENDMETHOD.


  METHOD setup.
    environment->clear_doubles( ).
  ENDMETHOD.


  METHOD downtime_across_midnight.
    DATA notifications TYPE STANDARD TABLE OF zeam_i_maintnotif WITH EMPTY KEY.

    notifications = VALUE #( ( maintenancenotification = '000010000001' maintenanceobjectisdown = abap_true
                               malfunctionstartdate = '20260301' malfunctionstarttime = '220000'
                               malfunctionenddate = '20260302' malfunctionendtime = '013000' ) ).
    environment->insert_test_data( i_data = notifications ).

    SELECT SINGLE FROM zeam_i_notifdowntime
      FIELDS downtimeinhours, malfunctionisclosed
      INTO @DATA(result).

    cl_abap_unit_assert=>assert_equals( act = result-downtimeinhours
                                        exp = '3.50' ).
    cl_abap_unit_assert=>assert_equals( act = result-malfunctionisclosed
                                        exp = abap_true ).
  ENDMETHOD.


  METHOD open_malfunction_no_downtime.
    DATA notifications TYPE STANDARD TABLE OF zeam_i_maintnotif WITH EMPTY KEY.

    notifications = VALUE #( ( maintenancenotification = '000010000002' maintenanceobjectisdown = abap_true
                               malfunctionstartdate = '20260301' malfunctionstarttime = '080000' ) ).
    environment->insert_test_data( i_data = notifications ).

    SELECT SINGLE FROM zeam_i_notifdowntime
      FIELDS downtimeinhours, malfunctionisclosed
      INTO @DATA(result).

    cl_abap_unit_assert=>assert_equals( act = result-downtimeinhours
                                        exp = 0 ).
    cl_abap_unit_assert=>assert_equals( act = result-malfunctionisclosed
                                        exp = abap_false ).
  ENDMETHOD.

ENDCLASS.
