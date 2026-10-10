REPORT zwmx_ewm_src_stage_load.
" ModuPorter customer staging import only; SAP activation/runtime unverified.
" Input: validated headerless UTF-8 stage.tsv from migration_stage.py.
" Default simulation performs validation without database writes.
PARAMETERS p_table TYPE tabname OBLIGATORY.
PARAMETERS p_file TYPE rlgrap-filename OBLIGATORY.
PARAMETERS p_test AS CHECKBOX DEFAULT 'X'.
DATA lt_lines TYPE STANDARD TABLE OF string.
DATA lt_values TYPE STANDARD TABLE OF string.
DATA lt_fields TYPE STANDARD TABLE OF dfies.
DATA ls_field TYPE dfies.
DATA lv_line TYPE string.
DATA lv_value TYPE string.
DATA lv_file TYPE string.
DATA lv_tab TYPE c LENGTH 1.
DATA lv_allowed TYPE abap_bool.
DATA lv_fields TYPE i.
DATA lv_terminal TYPE i.
DATA lv_index TYPE i.
DATA lv_count TYPE i.
DATA lr_rows TYPE REF TO data.
FIELD-SYMBOLS <rows> TYPE STANDARD TABLE.
FIELD-SYMBOLS <row> TYPE any.
FIELD-SYMBOLS <cell> TYPE any.
START-OF-SELECTION.
  TRANSLATE p_table TO UPPER CASE.
  CASE p_table.
    WHEN 'ZWMX_WMS001'
      OR 'ZWMX_WMS002'
      OR 'ZWMX_WMS003'
      OR 'ZWMX_WMS004'
      OR 'ZWMX_WMS005'
      OR 'ZWMX_WMS006'
      OR 'ZWMX_WMS007'
      OR 'ZWMX_WMS008'
      OR 'ZWMX_WMS009'
      OR 'ZWMX_WMS010'
      OR 'ZWMX_WMS011'
      OR 'ZWMX_WMS012'
      OR 'ZWMX_WMS013'
      OR 'ZWMX_WMS014'
      OR 'ZWMX_WMS015'
      OR 'ZWMX_WMS016'.
      lv_allowed = abap_true.
  ENDCASE.
  IF lv_allowed <> abap_true.
    MESSAGE 'Only delivered customer staging tables are allowed' TYPE 'E'.
  ENDIF.
  AUTHORITY-CHECK OBJECT 'S_TABU_NAM'
    ID 'TABLE' FIELD p_table ID 'ACTVT' FIELD '02'.
  IF sy-subrc <> 0.
    MESSAGE 'Change authorization for staging table required' TYPE 'E'.
  ENDIF.
  CALL FUNCTION 'DDIF_FIELDINFO_GET'
    EXPORTING tabname = p_table langu = sy-langu
    TABLES dfies_tab = lt_fields EXCEPTIONS OTHERS = 1.
  IF sy-subrc <> 0 OR lt_fields IS INITIAL.
    MESSAGE 'Staging DDIC unavailable' TYPE 'E'.
  ENDIF.
  LOOP AT lt_fields INTO ls_field.
    IF ls_field-fieldname = 'MANDT'.
      IF ls_field-datatype <> 'CLNT'.
        MESSAGE 'Expected typed client field' TYPE 'E'.
      ENDIF.
    ELSE.
      IF ls_field-datatype <> 'CHAR' OR ls_field-fieldname(1) <> 'F'.
        MESSAGE 'Unexpected staging field definition' TYPE 'E'.
      ENDIF.
      ADD 1 TO lv_fields.
    ENDIF.
  ENDLOOP.
  lv_file = p_file.
  CALL FUNCTION 'GUI_UPLOAD'
    EXPORTING filename = lv_file filetype = 'ASC' codepage = '4110'
    TABLES data_tab = lt_lines EXCEPTIONS OTHERS = 1.
  IF sy-subrc <> 0 OR lt_lines IS INITIAL.
    MESSAGE 'Cannot read nonempty validated staging TSV' TYPE 'E'.
  ENDIF.
  IF lines( lt_lines ) > 1000000.
    MESSAGE 'Staging import row limit exceeded' TYPE 'E'.
  ENDIF.
  lv_tab = cl_abap_char_utilities=>horizontal_tab.
  CREATE DATA lr_rows TYPE STANDARD TABLE OF (p_table).
  ASSIGN lr_rows->* TO <rows>.
  LOOP AT lt_lines INTO lv_line.
    CLEAR lt_values.
    SPLIT lv_line AT lv_tab INTO TABLE lt_values.
    IF lines( lt_values ) <> lv_fields + 1.
      MESSAGE 'TSV column count mismatch; no data written' TYPE 'E'.
    ENDIF.
    lv_terminal = lv_fields + 1.
    READ TABLE lt_values INTO lv_value INDEX lv_terminal.
    IF sy-subrc <> 0 OR lv_value <> '#MODUPORTER_END#'.
      MESSAGE 'Invalid TSV terminal marker' TYPE 'E'.
    ENDIF.
    APPEND INITIAL LINE TO <rows> ASSIGNING <row>.
    ASSIGN COMPONENT 'MANDT' OF STRUCTURE <row> TO <cell>.
    IF sy-subrc <> 0.
      MESSAGE 'Staging client field missing' TYPE 'E'.
    ENDIF.
    <cell> = sy-mandt.
    CLEAR lv_index.
    LOOP AT lt_fields INTO ls_field.
      IF ls_field-fieldname = 'MANDT'.
        CONTINUE.
      ENDIF.
      ADD 1 TO lv_index.
      READ TABLE lt_values INTO lv_value INDEX lv_index.
      IF sy-subrc <> 0 OR strlen( lv_value ) > ls_field-leng.
        MESSAGE 'Invalid staging value length' TYPE 'E'.
      ENDIF.
      IF ls_field-keyflag = 'X' AND lv_value IS INITIAL.
        MESSAGE 'Empty staging key prohibited' TYPE 'E'.
      ENDIF.
      ASSIGN COMPONENT ls_field-fieldname OF STRUCTURE <row> TO <cell>.
      IF sy-subrc <> 0.
        MESSAGE 'Staging schema/runtime mismatch' TYPE 'E'.
      ENDIF.
      <cell> = lv_value.
    ENDLOOP.
  ENDLOOP.
  lv_count = lines( <rows> ).
  IF p_test = abap_true.
    WRITE: / lv_count, 'rows validated; simulation only'.
    RETURN.
  ENDIF.
  TRY.
      INSERT (p_table) FROM TABLE <rows>.
      IF sy-subrc <> 0 OR sy-dbcnt <> lv_count.
        ROLLBACK WORK.
        MESSAGE 'Staging insert failed; rolled back' TYPE 'E'.
      ENDIF.
    CATCH cx_sy_open_sql_db.
      ROLLBACK WORK.
      MESSAGE 'Duplicate or database failure; rolled back' TYPE 'E'.
  ENDTRY.
  COMMIT WORK AND WAIT.
  WRITE: / lv_count, 'rows inserted into customer staging only'.
