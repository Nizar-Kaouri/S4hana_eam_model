# Full row export helper

Create the supplied report manually in SE38. It is outside the abapGit src folder. It reads allowed current-client tables, verifies S_TABU_NAM display authorization, exports UTF-8 CSV and adjacent DDIC fields/key metadata, and refuses truncated publication. Use internal CHAR/NUMC keys with the optional filter. Confirm numeric, currency, unit, date, cluster-table and frontend behavior on SAP. It does not post data. Allowed tables: BKPF, BSAD, BSAK, BSAS, BSEG, BSID, BSIK, BSIS, KNA1, KNB1, KNVV, LFA1, LFB1, LFM1, SKA1, SKAT, SKB1.
