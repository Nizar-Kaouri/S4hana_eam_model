"! <p class="shorttext synchronized">ZEAM VDM - Functional Location CDS unit tests (draft)</p>
"! CDS test double tests for module "functional_location". Never executed: no SAP system available.
"! TODO-VERIFY[M] TST-002: test data names (see FL-0xx); test double resolves path _Text in ZEAM_B_FuncLocVH
CLASS zeam_cl_funcloc_test DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC
  FOR TESTING
  RISK LEVEL HARMLESS
  DURATION SHORT.

  PRIVATE SECTION.
    CLASS-DATA vh_environment TYPE REF TO if_cds_test_environment.
    CLASS-DATA cube_environment TYPE REF TO if_cds_test_environment.

    CLASS-METHODS class_setup.
    CLASS-METHODS class_teardown.

    METHODS setup.
    METHODS vh_name_in_logon_language FOR TESTING.
    METHODS cube_counts_one_per_row FOR TESTING.
ENDCLASS.


CLASS zeam_cl_funcloc_test IMPLEMENTATION.

  METHOD class_setup.
    vh_environment = cl_cds_test_environment=>create( i_for_entity = 'ZEAM_B_FUNCLOCVH' ).
    cube_environment = cl_cds_test_environment=>create( i_for_entity = 'ZEAM_I_FUNCLOC' ).
  ENDMETHOD.


  METHOD class_teardown.
    vh_environment->destroy( ).
    cube_environment->destroy( ).
  ENDMETHOD.


  METHOD setup.
    vh_environment->clear_doubles( ).
    cube_environment->clear_doubles( ).
  ENDMETHOD.


  METHOD vh_name_in_logon_language.
    DATA locations TYPE STANDARD TABLE OF zeam_b_funcloc WITH EMPTY KEY.
    DATA texts TYPE STANDARD TABLE OF zeam_b_funcloctext WITH EMPTY KEY.
    DATA other_language TYPE sy-langu.

    other_language = COND #( WHEN sy-langu = 'D' THEN 'E' ELSE 'D' ).

    locations = VALUE #( ( functionallocation = 'FL-1000' functionallocationlabelname = '1000-PUMPS' ) ).
    texts = VALUE #(
      ( functionallocation = 'FL-1000' language = sy-langu functionallocationname = 'Pump station' )
      ( functionallocation = 'FL-1000' language = other_language functionallocationname = 'Other language' ) ).
    vh_environment->insert_test_data( i_data = locations ).
    vh_environment->insert_test_data( i_data = texts ).

    SELECT FROM zeam_b_funclocvh
      FIELDS functionallocation, functionallocationname
      INTO TABLE @DATA(result).

    cl_abap_unit_assert=>assert_equals( act = lines( result )
                                        exp = 1 ).
    cl_abap_unit_assert=>assert_equals( act = result[ 1 ]-functionallocationname
                                        exp = 'Pump station' ).
  ENDMETHOD.


  METHOD cube_counts_one_per_row.
    DATA locations TYPE STANDARD TABLE OF zeam_b_funcloc WITH EMPTY KEY.

    locations = VALUE #(
      ( functionallocation = 'FL-1000' maintenanceplant = '1010' )
      ( functionallocation = 'FL-1001' maintenanceplant = '1010' )
      ( functionallocation = 'FL-2000' maintenanceplant = '1020' ) ).
    cube_environment->insert_test_data( i_data = locations ).

    SELECT FROM zeam_i_funcloc
      FIELDS maintenanceplant, SUM( numberoffunctionallocations ) AS total
      GROUP BY maintenanceplant
      ORDER BY maintenanceplant
      INTO TABLE @DATA(result).

    cl_abap_unit_assert=>assert_equals( act = lines( result )
                                        exp = 2 ).
    cl_abap_unit_assert=>assert_equals( act = result[ 1 ]-total
                                        exp = 2 ).
  ENDMETHOD.

ENDCLASS.
