# Migration sequence

> Status: **draft-unverified** · tested release: none (native DDIC and SAP activation pending). Nothing below has been run on a system.

This groups the supplied native extraction drafts only. Pending dependencies remain listed in module metadata and mappings; this is not a complete business load plan. No load program is supplied.

| Level | Modules | Supplied native consumption views |
|---|---|---|
| 1 | [`collection_activity`](mapping/collection_activity.md), [`credit_profile`](mapping/credit_profile.md), [`dispute_case`](mapping/dispute_case.md), [`promise_to_pay`](mapping/promise_to_pay.md) | `ZFCX_C_CollectContactMig`, `ZFCX_C_CreditProfileMig`, `ZFCX_C_DisputeCaseMig`, `ZFCX_C_CaseAttributeMig`, `ZFCX_C_PaymentPromiseMig` |
| 2 | [`credit_segment`](mapping/credit_segment.md) | `ZFCX_C_CreditSegmentMig` |
