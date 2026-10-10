# Migration sequence

> Status: **draft-unverified** · tested release: none (draft, customer staging on NetWeaver 7.40 SP08+ assumed). Nothing below has been run on a system.

Load order derived from `sequence_after`. Objects on the same level can be loaded in parallel; objects that refer to other objects load after them.

| Level | Modules | Consumption views read by the load program |
|---|---|---|
| 1 | [`collections_profile`](mapping/collections_profile.md), [`credit_profile`](mapping/credit_profile.md), [`dispute_case`](mapping/dispute_case.md) | `ZFCX_C_CollectProfileMig`, `ZFCX_C_CollectSegmentMig`, `ZFCX_C_CreditProfileMig`, `ZFCX_C_CreditRelationMig`, `ZFCX_C_DisputeCaseMig`, `ZFCX_C_DisputeItemMig`, `ZFCX_C_CaseAttributeMig`, `ZFCX_C_CaseAttachmentMig` |
| 2 | [`collection_activity`](mapping/collection_activity.md), [`credit_segment`](mapping/credit_segment.md), [`promise_to_pay`](mapping/promise_to_pay.md) | `ZFCX_C_CollectContactMig`, `ZFCX_C_CollectTaskMig`, `ZFCX_C_CreditSegmentMig`, `ZFCX_C_PaymentPromiseMig`, `ZFCX_C_PromiseItemMig` |
| 3 | [`credit_exposure`](mapping/credit_exposure.md) | `ZFCX_C_CreditExposureMig` |
