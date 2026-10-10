# Full row export helper

Create the supplied report manually in SE38. It is outside the abapGit src folder. It reads allowed current-client tables, verifies S_TABU_NAM display authorization, exports UTF-8 CSV and adjacent DDIC fields/key metadata, and refuses truncated publication. Use internal CHAR/NUMC keys with the optional filter. Confirm numeric, currency, unit, date, cluster-table and frontend behavior on SAP. It does not post data. Allowed tables: MAPL, PLAS, PLKO, PLMK, PLPO, QALS, QAMR, QAMV, QASE, QAVE, QMEL, QMFE, QMMA, QMSM, QMUR.
