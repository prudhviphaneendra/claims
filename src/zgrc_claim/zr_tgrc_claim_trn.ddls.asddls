@AccessControl.authorizationCheck: #NOT_REQUIRED
@Metadata.allowExtensions: true
@EndUserText.label: 'Claim Transaction'
define view entity ZR_TGRC_CLAIM_TRN
  as select from ztgrc_claim_trn as CLAIM_TRN
  association to parent ZR_TGRC_CLAIM as _Claim   on $projection.ClaimUuid = _Claim.ClaimUuid
  association [0..1] to ZR_CLAIMTRN_RECTYPE_PL   as _ClaimTrn_RecType_PL   on $projection.ClaimTrnRecType = _ClaimTrn_RecType_PL.Id
  association [0..1] to ZR_CLAIMTRN_CATEGORY_PL   as _ClaimTrn_Category_PL   on $projection.Category = _ClaimTrn_Category_PL.Id
{
 
  key claim_uuid as ClaimUuid,
  key claim_trn_uuid as ClaimTrnUuid,
  claim_trn_external_id as ClaimTrnExternalId,
  claim_trn_rec_type as ClaimTrnRecType,
  adjustment as Adjustment,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  amount as Amount,
  bank_account_number as BankAccountNumber,
  category as Category,
  check_number as CheckNumber,
  check_status as CheckStatus,
  coverage_major as CoverageMajor,
  @Consumption.valueHelpDefinition: [ {
    entity.name: 'I_CurrencyStdVH', 
    entity.element: 'Currency', 
    useForValidation: true
  } ]
  currency_code as CurrencyCode,
  currency_lookup as CurrencyLookup,
  date_check_cleared as DateCheckCleared,
  date_check_issued as DateCheckIssued,
  date_check_status as DateCheckStatus,
  date_of_invoice as DateOfInvoice,
  date_pay_service_begin as DatePayServiceBegin,
  date_pay_service_end as DatePayServiceEnd,
  disability_code as DisabilityCode,
  expense_paid as ExpensePaid,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  expense_paid_delta as ExpensePaidDelta,
  expense_recovery as ExpenseRecovery,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  expense_recovery_delta as ExpenseRecoveryDelta,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  expense_reserve_delta as ExpenseReserveDelta,
  expense_reserve as ExpenseReserve,
  indemnity_pd_paid as IndemnityPdPaid,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  indemnity_pd_paid_delta as IndemnityPdPaidDelta,
  indemnity_pd_recovery as IndemnityPdRecovery,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  indemnity_pd_recovery_delta as IndemnityPdRecoveryDelta,
  indemnity_pd_reserve as IndemnityPdReserve,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  indemnity_pd_reserve_delta as IndemnityPdReserveDelta,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  invoice_amount as InvoiceAmount,
  invoice_number as InvoiceNumber,
  medical_bi_paid as MedicalBiPaid,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  medical_bi_paid_delta as MedicalBiPaidDelta,
  medical_bi_recovery as MedicalBiRecovery,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  medical_bi_recovery_delta as MedicalBiRecoveryDelta,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  medical_bi_reserve_delta as MedicalBiReserveDelta,
  medical_bi_reserve as MedicalBiReserve,
  pay_comment as PayComment,
  payee_lookup as PayeeLookup,
  payee_address_line_2 as PayeeAddressLine2,
  payee_address_line1 as PayeeAddressLine1,
  payee_city as PayeeCity,
  payee_contact as PayeeContact,
  payee_country as PayeeCountry,
  payee as Payee,
  payee_postal_code as PayeePostalCode,
  payee_state as PayeeState,
  payee_type as PayeeType,
  payment_status as PaymentStatus,
  quick_load as QuickLoad,
  recovery_received_other2 as RecoveryReceivedOther2,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  recovery_received_other2_delta as RecoveryReceivedOther2Delta,
  recovery_received_other as RecoveryReceivedOther,
  @Semantics.amount.currencyCode: 'CurrencyCode'
  recovery_received_other_delta as RecoveryReceivedOtherDelta,
  tax_id as TaxId,
  total_reserve as TotalReserve,
  trankey as Trankey,
  transaction_code as TransactionCode,
  transaction_date as TransactionDate,
  transaction_sequence as TransactionSequence,
  transaction_status as TransactionStatus,
  type as Type,
  @Semantics.user.createdBy: true
  createdby as Createdby,
  @Semantics.systemDateTime.createdAt: true
  createdat as Createdat,
  @Semantics.user.localInstanceLastChangedBy: true
  lastchangedby as Lastchangedby,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  lastchangedat as Lastchangedat,
  _Claim,
  _ClaimTrn_RecType_PL,
  _ClaimTrn_Category_PL
  
}
