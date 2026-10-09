"! <p class="shorttext synchronized">ZEAM VDM - Equipment CDS unit tests (draft-unverified)</p>
"! CDS test double tests for module "equipment". Never executed: no SAP system available.
"! TODO-VERIFY[M] TST-001: test data names (see EQ-0xx); test double resolves path _Text in ZEAM_I_EquipmentVH
CLASS zeam_cl_equipment_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  FOR TESTING
  RISK LEVEL HARMLESS
  DURATION SHORT.

  PRIVATE SECTION.
    CONSTANTS c_open_end TYPE d VALUE '99991231'.

    CLASS-DATA basic_environment TYPE REF TO if_cds_test_environment.
    CLASS-DATA vh_environment TYPE REF TO if_cds_test_environment.
    CLASS-DATA cube_environment TYPE REF TO if_cds_test_environment.

    CLASS-METHODS class_setup.
    CLASS-METHODS class_teardown.

    METHODS setup.
    METHODS basic_only_current_segment FOR TESTING.
    METHODS vh_name_in_logon_language FOR TESTING.
    METHODS cube_counts_one_per_row FOR TESTING.
ENDCLASS.


CLASS zeam_cl_equipment_test IMPLEMENTATION.

  METHOD class_setup.
    basic_environment = cl_cds_test_environment=>create( i_for_entity = 'ZEAM_I_EQUIPMENT' ).
    vh_environment = cl_cds_test_environment=>create( i_for_entity = 'ZEAM_I_EQUIPMENTVH' ).
    cube_environment = cl_cds_test_environment=>create( i_for_entity = 'ZEAM_R_EQUIPMENT' ).
  ENDMETHOD.


  METHOD class_teardown.
    basic_environment->destroy( ).
    vh_environment->destroy( ).
    cube_environment->destroy( ).
  ENDMETHOD.


  METHOD setup.
    basic_environment->clear_doubles( ).
    vh_environment->clear_doubles( ).
    cube_environment->clear_doubles( ).
  ENDMETHOD.


  METHOD basic_only_current_segment.
    DATA equipments TYPE STANDARD TABLE OF i_equipment WITH EMPTY KEY.

    equipments = VALUE #(
      ( equipment = '000000000010000001' validityenddate = '20201231' maintenanceplant = '1010' )
      ( equipment = '000000000010000001' validityenddate = c_open_end maintenanceplant = '1020' )
      ( equipment = '000000000010000002' validityenddate = c_open_end maintenanceplant = '1010' ) ).
    basic_environment->insert_test_data( i_data = equipments ).

    SELECT FROM zeam_i_equipment
      FIELDS equipment, maintenanceplant
      ORDER BY equipment
      INTO TABLE @DATA(result).

    cl_abap_unit_assert=>assert_equals( act = lines( result )
                                        exp = 2 ).
    cl_abap_unit_assert=>assert_equals( act = result[ 1 ]-maintenanceplant
                                        exp = '1020' ).
  ENDMETHOD.


  METHOD vh_name_in_logon_language.
    DATA equipments TYPE STANDARD TABLE OF zeam_i_equipment WITH EMPTY KEY.
    DATA texts TYPE STANDARD TABLE OF zeam_i_equipmenttext WITH EMPTY KEY.
    DATA other_language TYPE sy-langu.

    other_language = COND #( WHEN sy-langu = 'D' THEN 'E' ELSE 'D' ).

    equipments = VALUE #( ( equipment = '000000000010000001' validityenddate = c_open_end ) ).
    texts = VALUE #(
      ( equipment = '000000000010000001' language = sy-langu equipmentname = 'Pump P-100' )
      ( equipment = '000000000010000001' language = other_language equipmentname = 'Other language' ) ).
    vh_environment->insert_test_data( i_data = equipments ).
    vh_environment->insert_test_data( i_data = texts ).

    SELECT FROM zeam_i_equipmentvh
      FIELDS equipment, equipmentname
      INTO TABLE @DATA(result).

    cl_abap_unit_assert=>assert_equals( act = lines( result )
                                        exp = 1 ).
    cl_abap_unit_assert=>assert_equals( act = result[ 1 ]-equipmentname
                                        exp = 'Pump P-100' ).
  ENDMETHOD.


  METHOD cube_counts_one_per_row.
    DATA equipments TYPE STANDARD TABLE OF zeam_i_equipment WITH EMPTY KEY.

    equipments = VALUE #(
      ( equipment = '000000000010000001' validityenddate = c_open_end maintenanceplant = '1010' )
      ( equipment = '000000000010000002' validityenddate = c_open_end maintenanceplant = '1010' )
      ( equipment = '000000000010000003' validityenddate = c_open_end maintenanceplant = '1020' ) ).
    cube_environment->insert_test_data( i_data = equipments ).

    SELECT FROM zeam_r_equipment
      FIELDS maintenanceplant, SUM( numberofequipments ) AS total
      GROUP BY maintenanceplant
      ORDER BY maintenanceplant
      INTO TABLE @DATA(result).

    cl_abap_unit_assert=>assert_equals( act = lines( result )
                                        exp = 2 ).
    cl_abap_unit_assert=>assert_equals( act = result[ 1 ]-total
                                        exp = 2 ).
  ENDMETHOD.

ENDCLASS.
