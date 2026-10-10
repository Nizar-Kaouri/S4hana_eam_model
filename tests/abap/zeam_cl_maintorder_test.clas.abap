"! <p class="shorttext synchronized">ZEAM VDM - Maintenance Order CDS unit tests (draft)</p>
"! CDS test double tests for module "maintenance_order". Never executed: no SAP system.
"! TODO-VERIFY[M] TST-004: test data names (see MO-0xx, MO-O03, MO-C03) and test double for path expressions
CLASS zeam_cl_maintorder_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  FOR TESTING
  RISK LEVEL HARMLESS
  DURATION SHORT.

  PRIVATE SECTION.
    CLASS-DATA order_environment TYPE REF TO if_cds_test_environment.
    CLASS-DATA component_environment TYPE REF TO if_cds_test_environment.

    CLASS-METHODS class_setup.
    CLASS-METHODS class_teardown.

    METHODS setup.
    METHODS open_flag_from_teco_date FOR TESTING.
    METHODS open_quantity_never_negative FOR TESTING.
ENDCLASS.


CLASS zeam_cl_maintorder_test IMPLEMENTATION.

  METHOD class_setup.
    order_environment = cl_cds_test_environment=>create( i_for_entity = 'ZEAM_I_MAINTORDER' ).
    component_environment = cl_cds_test_environment=>create( i_for_entity = 'ZEAM_R_MAINTORDERCOMPONENT' ).
  ENDMETHOD.


  METHOD class_teardown.
    order_environment->destroy( ).
    component_environment->destroy( ).
  ENDMETHOD.


  METHOD setup.
    order_environment->clear_doubles( ).
    component_environment->clear_doubles( ).
  ENDMETHOD.


  METHOD open_flag_from_teco_date.
    DATA orders TYPE STANDARD TABLE OF i_maintenanceorder WITH EMPTY KEY.

    orders = VALUE #(
      ( maintenanceorder = '000004000001' technicalcompletiondate = '00000000' )
      ( maintenanceorder = '000004000002' technicalcompletiondate = '20260131' ) ).
    order_environment->insert_test_data( i_data = orders ).

    SELECT FROM zeam_i_maintorder
      FIELDS maintenanceorder, maintorderisopen
      ORDER BY maintenanceorder
      INTO TABLE @DATA(result).

    cl_abap_unit_assert=>assert_equals( act = result[ 1 ]-maintorderisopen
                                        exp = abap_true ).
    cl_abap_unit_assert=>assert_equals( act = result[ 2 ]-maintorderisopen
                                        exp = abap_false ).
  ENDMETHOD.


  METHOD open_quantity_never_negative.
    DATA components TYPE STANDARD TABLE OF zeam_i_maintordercomponent WITH EMPTY KEY.

    components = VALUE #( baseunit = 'ST'
      ( reservation = '0000100001' reservationitem = '0001' requirementquantityinbaseunit = 5 withdrawnquantity = 2 )
      ( reservation = '0000100001' reservationitem = '0002' requirementquantityinbaseunit = 1 withdrawnquantity = 3 ) ).
    component_environment->insert_test_data( i_data = components ).

    SELECT FROM zeam_r_maintordercomponent
      FIELDS reservationitem, openquantity
      ORDER BY reservationitem
      INTO TABLE @DATA(result).

    cl_abap_unit_assert=>assert_equals( act = result[ 1 ]-openquantity
                                        exp = 3 ).
    cl_abap_unit_assert=>assert_equals( act = result[ 2 ]-openquantity
                                        exp = 0 ).
  ENDMETHOD.

ENDCLASS.
