REPORT zqmx_qm_text_export.

" ModuPorter READ_TEXT payload helper; SAP activation release.
" Input: UTF-8 TSV, no header, object/name/id/language; selected cohort only.
PARAMETERS p_keys TYPE rlgrap-filename OBLIGATORY.
PARAMETERS p_file TYPE rlgrap-filename OBLIGATORY.
PARAMETERS p_max TYPE i DEFAULT 10000.
TYPES: BEGIN OF ty_key,
         text_object TYPE thead-tdobject,
         text_name TYPE thead-tdname,
         text_id TYPE thead-tdid,
         language TYPE thead-tdspras,
       END OF ty_key.
DATA lt_keys TYPE STANDARD TABLE OF ty_key.
DATA ls_key TYPE ty_key.
DATA lt_lines TYPE STANDARD TABLE OF tline.
DATA ls_line TYPE tline.
DATA lt_csv TYPE STANDARD TABLE OF string.
DATA lv_filename TYPE string.
DATA lv_prefix TYPE string.
DATA lv_text TYPE string.
DATA lv_number TYPE i.
DATA lv_errors TYPE i.
DATA lv_count TYPE i.
DATA lv_format TYPE string.

START-OF-SELECTION.
  AUTHORITY-CHECK OBJECT 'S_TABU_NAM'
    ID 'TABLE' FIELD 'STXH' ID 'ACTVT' FIELD '03'.
  IF sy-subrc <> 0.
    MESSAGE 'Display authorization for STXH is required' TYPE 'E'.
  ENDIF.
  lv_filename = p_keys.
  CALL FUNCTION 'GUI_UPLOAD'
    EXPORTING filename = lv_filename filetype = 'ASC'
      has_field_separator = 'X' codepage = '4110'
    TABLES data_tab = lt_keys
    EXCEPTIONS OTHERS = 1.
  IF sy-subrc <> 0 OR lt_keys IS INITIAL.
    MESSAGE 'Cannot read nonempty selected-text key file' TYPE 'E'.
  ENDIF.
  DESCRIBE TABLE lt_keys LINES lv_count.
  IF p_max < 1 OR p_max > 1000000 OR lv_count > p_max.
    MESSAGE 'Text key count exceeds the agreed limit' TYPE 'E'.
  ENDIF.
  SORT lt_keys BY text_object text_name text_id language.
  DELETE ADJACENT DUPLICATES FROM lt_keys.
  APPEND 'TextObject,TextName,TextID,Language,LineNumber,Format,Text' TO lt_csv.
  LOOP AT lt_keys INTO ls_key.
    IF ls_key-text_object IS INITIAL OR ls_key-text_name IS INITIAL
      OR ls_key-text_id IS INITIAL OR ls_key-language IS INITIAL.
      MESSAGE 'Every text key component must be populated' TYPE 'E'.
    ENDIF.
    CLEAR lt_lines.
    CALL FUNCTION 'READ_TEXT'
      EXPORTING object = ls_key-text_object name = ls_key-text_name
        id = ls_key-text_id language = ls_key-language
      TABLES lines = lt_lines
      EXCEPTIONS id = 1 language = 2 name = 3 not_found = 4
        object = 5 reference_check = 6 wrong_access_to_archive = 7 OTHERS = 8.
    IF sy-subrc <> 0.
      lv_errors = lv_errors + 1.
      WRITE: / 'READ_TEXT failed:', ls_key, sy-subrc.
      CONTINUE.
    ENDIF.
    lv_text = ls_key-text_object.
    REPLACE ALL OCCURRENCES OF '"' IN lv_text WITH '""'.
    lv_prefix = '"' && lv_text && '",'.
    lv_text = ls_key-text_name.
    REPLACE ALL OCCURRENCES OF '"' IN lv_text WITH '""'.
    lv_prefix = lv_prefix && '"' && lv_text && '",'.
    lv_text = ls_key-text_id.
    REPLACE ALL OCCURRENCES OF '"' IN lv_text WITH '""'.
    lv_prefix = lv_prefix && '"' && lv_text && '",'.
    lv_text = ls_key-language.
    REPLACE ALL OCCURRENCES OF '"' IN lv_text WITH '""'.
    lv_prefix = lv_prefix && '"' && lv_text && '"'.
    IF lt_lines IS INITIAL.
      lv_text = lv_prefix && ',0,"",""'.
      APPEND lv_text TO lt_csv.
    ENDIF.
    CLEAR lv_number.
    LOOP AT lt_lines INTO ls_line.
      lv_number = lv_number + 1.
      lv_text = ls_line-tdline.
      REPLACE ALL OCCURRENCES OF '"' IN lv_text WITH '""'.
      lv_format = ls_line-tdformat.
      REPLACE ALL OCCURRENCES OF '"' IN lv_format WITH '""'.
      lv_text = |{ lv_prefix },{ lv_number },"{ lv_format }","{ lv_text }"|.
      APPEND lv_text TO lt_csv.
    ENDLOOP.
  ENDLOOP.
  IF lv_errors > 0.
    MESSAGE 'Text retrieval failed for some keys: no partial payload was written' TYPE 'E'.
  ENDIF.
  lv_filename = p_file.
  CALL FUNCTION 'GUI_DOWNLOAD'
    EXPORTING filename = lv_filename filetype = 'ASC' codepage = '4110'
    TABLES data_tab = lt_csv
    EXCEPTIONS OTHERS = 1.
  IF sy-subrc <> 0.
    MESSAGE 'Text payload download failed' TYPE 'E'.
  ENDIF.
  WRITE: / 'Selected text payload exported; validate formats and Unicode on target'.
