REPORT zpsx_ps_table_export.

" ModuPorter full-row  Project System source/target export helper; SAP activation unverified.
" Create this report in SE38. Read helpers/README.md before execution.
" Read-only, current-client, table-name allowlist, explicit table authorization.
PARAMETERS p_table TYPE tabname OBLIGATORY.
PARAMETERS p_field TYPE fieldname.
PARAMETERS p_keys TYPE rlgrap-filename.
PARAMETERS p_file TYPE rlgrap-filename OBLIGATORY.
PARAMETERS p_max TYPE i DEFAULT 10000.

DATA lt_fields TYPE STANDARD TABLE OF dfies.
DATA ls_field TYPE dfies.
DATA lr_rows TYPE REF TO data.
DATA lt_keys TYPE STANDARD TABLE OF string.
DATA lt_csv TYPE STANDARD TABLE OF string.
DATA lt_schema TYPE STANDARD TABLE OF string.
DATA lv_key TYPE string.
DATA lv_where TYPE string.
DATA lv_value TYPE string.
DATA lv_line TYPE string.
DATA lv_count TYPE i.
DATA lv_limit TYPE i.
DATA lv_filename TYPE string.
DATA lv_allowed TYPE abap_bool.
FIELD-SYMBOLS <rows> TYPE STANDARD TABLE.
FIELD-SYMBOLS <row> TYPE any.
FIELD-SYMBOLS <cell> TYPE any.

START-OF-SELECTION.
  TRANSLATE p_table TO UPPER CASE.
  TRANSLATE p_field TO UPPER CASE.
  " Additional structures are exported with all their DDIC fields and real keys.
  CASE p_table.
    WHEN 'COEP' OR 'PRHI' OR 'PROJ' OR 'PRPS'.
      lv_allowed = abap_true.
  ENDCASE.
  IF lv_allowed <> abap_true OR p_max < 1 OR p_max > 1000000.
    MESSAGE 'Unsupported table or row limit (1..1000000)' TYPE 'E'.
  ENDIF.
  AUTHORITY-CHECK OBJECT 'S_TABU_NAM'
    ID 'TABLE' FIELD p_table ID 'ACTVT' FIELD '03'.
  IF sy-subrc <> 0.
    MESSAGE 'Display authorization for this table is required' TYPE 'E'.
  ENDIF.
  CALL FUNCTION 'DDIF_FIELDINFO_GET'
    EXPORTING tabname = p_table langu = sy-langu
    TABLES dfies_tab = lt_fields
    EXCEPTIONS not_found = 1 internal_error = 2 OTHERS = 3.
  IF sy-subrc <> 0 OR lt_fields IS INITIAL.
    MESSAGE 'Source table is unavailable in this release' TYPE 'E'.
  ENDIF.
  IF ( p_keys IS INITIAL AND p_field IS NOT INITIAL )
    OR ( p_keys IS NOT INITIAL AND p_field IS INITIAL ).
    MESSAGE 'Filter field and key file must be provided together' TYPE 'E'.
  ENDIF.
  IF p_keys IS NOT INITIAL.
    READ TABLE lt_fields INTO ls_field WITH KEY fieldname = p_field.
    IF sy-subrc <> 0 OR ls_field-datatype <> 'CHAR'.
      IF sy-subrc <> 0 OR ls_field-datatype <> 'NUMC'.
        MESSAGE 'Filter field must exist and be CHAR or NUMC' TYPE 'E'.
      ENDIF.
    ENDIF.
    lv_filename = p_keys.
    CALL FUNCTION 'GUI_UPLOAD'
      EXPORTING filename = lv_filename filetype = 'ASC' codepage = '4110'
      TABLES data_tab = lt_keys
      EXCEPTIONS OTHERS = 1.
    IF sy-subrc <> 0 OR lt_keys IS INITIAL.
      MESSAGE 'Cannot read nonempty UTF-8 key file' TYPE 'E'.
    ENDIF.
    SORT lt_keys.
    DELETE ADJACENT DUPLICATES FROM lt_keys.
    LOOP AT lt_keys INTO lv_key.
      IF lv_key IS INITIAL.
        MESSAGE 'Key file contains an empty key' TYPE 'E'.
      ENDIF.
      IF strlen( lv_key ) > ls_field-leng.
        MESSAGE 'Filter key exceeds DDIC field length' TYPE 'E'.
      ENDIF.
      REPLACE ALL OCCURRENCES OF '''' IN lv_key WITH ''''''.
      IF lv_where IS NOT INITIAL.
        CONCATENATE lv_where ' OR ' INTO lv_where RESPECTING BLANKS.
      ENDIF.
      CONCATENATE lv_where p_field ' = ''' lv_key '''' INTO lv_where RESPECTING BLANKS.
    ENDLOOP.
  ENDIF.
  CREATE DATA lr_rows TYPE STANDARD TABLE OF (p_table).
  ASSIGN lr_rows->* TO <rows>.
  lv_limit = p_max + 1.
  TRY.
      SELECT * FROM (p_table) INTO TABLE <rows>
        UP TO lv_limit ROWS WHERE (lv_where).
    CATCH cx_sy_dynamic_osql_error.
      MESSAGE 'Dynamic selection failed; inspect DDIC and filter contract' TYPE 'E'.
  ENDTRY.
  DESCRIBE TABLE <rows> LINES lv_count.
  IF lv_count > p_max.
    MESSAGE 'Row limit exceeded: no incomplete export was written' TYPE 'E'.
  ENDIF.
  APPEND 'FIELDNAME,KEYFLAG,DATATYPE,LENGTH,DECIMALS' TO lt_schema.
  LOOP AT lt_fields INTO ls_field.
    IF ls_field-fieldname(1) = '.'.
      CONTINUE.
    ENDIF.
    IF lv_line IS NOT INITIAL.
      CONCATENATE lv_line ',' INTO lv_line.
    ENDIF.
    CONCATENATE lv_line ls_field-fieldname INTO lv_line.
    lv_value = |{ ls_field-fieldname },{ ls_field-keyflag },{ ls_field-datatype },{ ls_field-leng },{ ls_field-decimals }|.
    APPEND lv_value TO lt_schema.
  ENDLOOP.
  APPEND lv_line TO lt_csv.
  LOOP AT <rows> ASSIGNING <row>.
    CLEAR lv_line.
    LOOP AT lt_fields INTO ls_field.
      IF ls_field-fieldname(1) = '.'.
        CONTINUE.
      ENDIF.
      ASSIGN COMPONENT ls_field-fieldname OF STRUCTURE <row> TO <cell>.
      IF sy-subrc <> 0.
        MESSAGE 'DDIC/runtime field mismatch: export stopped' TYPE 'E'.
      ENDIF.
      lv_value = <cell>.
      REPLACE ALL OCCURRENCES OF '"' IN lv_value WITH '""'.
      IF lv_line IS NOT INITIAL.
        CONCATENATE lv_line ',' INTO lv_line.
      ENDIF.
      CONCATENATE lv_line '"' lv_value '"' INTO lv_line RESPECTING BLANKS.
    ENDLOOP.
    APPEND lv_line TO lt_csv.
  ENDLOOP.
  lv_filename = p_file.
  CALL FUNCTION 'GUI_DOWNLOAD'
    EXPORTING filename = lv_filename filetype = 'ASC' codepage = '4110'
    TABLES data_tab = lt_csv
    EXCEPTIONS OTHERS = 1.
  IF sy-subrc <> 0.
    MESSAGE 'CSV download failed' TYPE 'E'.
  ENDIF.
  CONCATENATE lv_filename '.fields.csv' INTO lv_filename.
  CALL FUNCTION 'GUI_DOWNLOAD'
    EXPORTING filename = lv_filename filetype = 'ASC' codepage = '4110'
    TABLES data_tab = lt_schema
    EXCEPTIONS OTHERS = 1.
  IF sy-subrc <> 0.
    MESSAGE 'DDIC schema download failed; export is not a complete delivery' TYPE 'E'.
  ENDIF.
  WRITE: / p_table, sy-mandt, lv_count, 'rows exported with DDIC field catalogue'.
