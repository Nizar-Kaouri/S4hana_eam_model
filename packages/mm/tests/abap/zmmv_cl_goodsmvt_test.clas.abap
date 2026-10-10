"! <p class="shorttext synchronized">ZMMV VDM - Goods movement CDS unit tests (draft)</p>
"! CDS test double tests. Never executed: no SAP system available.
"! TODO-VERIFY[M] TST-201: test data names (see MM-02x) and quantity case expressions in the test double
CLASS zmmv_cl_goodsmvt_test DEFINITION
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


CLASS zmmv_cl_goodsmvt_test IMPLEMENTATION.

  METHOD class_setup.
    environment = cl_cds_test_environment=>create( i_for_entity = 'ZMMV_R_GOODSMOVEMENT' ).
  ENDMETHOD.


  METHOD class_teardown.
    environment->destroy( ).
  ENDMETHOD.


  METHOD setup.
    environment->clear_doubles( ).
  ENDMETHOD.


  METHOD derived_values.
    DATA rows TYPE STANDARD TABLE OF zmmv_i_goodsmovement WITH EMPTY KEY.

    rows = VALUE #(
      ( materialdocumentyear = '2026' materialdocument = '4900000001' materialdocumentitem = '0001'
        debitcreditcode = 'S' quantityinbaseunit = 10 materialbaseunit = 'ST' )
      ( materialdocumentyear = '2026' materialdocument = '4900000002' materialdocumentitem = '0001'
        debitcreditcode = 'H' quantityinbaseunit = 4 materialbaseunit = 'ST' ) ).
    environment->insert_test_data( i_data = rows ).

    SELECT FROM zmmv_r_goodsmovement
      FIELDS SUM( receiptquantity ) AS receipts, SUM( issuequantity ) AS issues
      INTO TABLE @DATA(result).

    cl_abap_unit_assert=>assert_equals( act = result[ 1 ]-receipts
                                        exp = 10 ).
    cl_abap_unit_assert=>assert_equals( act = result[ 1 ]-issues
                                        exp = 4 ).
  ENDMETHOD.

ENDCLASS.
