@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection for CLAIM TXN - AL'
//@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
define view entity ZC_GRC_CLAIMSTXN_FINES_DUTIES as projection on ZR_TGRC_CLAIM_TRN
{
  key ClaimUuid,
  key ClaimTrnUuid,
      ClaimTrnExternalId,
      @ObjectModel.text.element:  ['RecordType']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIMTRN_RECTYPE_PL', element: 'Id' } }]
      ClaimTrnRecType,
      _ClaimTrn_RecType_PL.Record_Type as RecordType,
        @UI.hidden: #(HideAdjustment)
 Adjustment,
   @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideAdjustment :abap_boolean, 
   
      @UI.hidden: #(HideAmount)
      Amount,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideAmount :abap_boolean, 
   
    @UI.hidden: #(HideBankAccountNumber)
      BankAccountNumber,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideBankAccountNumber :abap_boolean, 
   
   @UI.hidden: #(HideCategory)
       @ObjectModel.text.element:  ['TrnCategory']
      @UI.textArrangement: #TEXT_ONLY
      @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIMTRN_CATEGORY_PL', element: 'Id' } }]
      Category,
      _ClaimTrn_Category_PL.Category as TrnCategory,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideCategory :abap_boolean, 
   
   @UI.hidden: #(HideCheckNumber)
      CheckNumber,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideCheckNumber :abap_boolean, 
   
    @UI.hidden: #(HideCheckStatus)
      CheckStatus,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideCheckStatus :abap_boolean, 
   
   @UI.hidden: #(HideCoverageMajor)
      CoverageMajor,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideCoverageMajor :abap_boolean, 
   
    @UI.hidden: #(HideCurrencyCode)
      @Semantics.currencyCode: true
      CurrencyCode,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideCurrencyCode :abap_boolean, 
   
    @UI.hidden: #(HideCurrencyLookup)
      CurrencyLookup,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideCurrencyLookup :abap_boolean, 
   
    @UI.hidden: #(HideDateCheckCleared)
      DateCheckCleared,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideDateCheckCleared :abap_boolean, 
   
   @UI.hidden: #(HideDateCheckIssued)
      DateCheckIssued,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideDateCheckIssued :abap_boolean, 
   
    @UI.hidden: #(HideDateCheckStatus)
      DateCheckStatus,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideDateCheckStatus :abap_boolean, 
   
   @UI.hidden: #(HideDateOfInvoice)
      DateOfInvoice,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideDateOfInvoice :abap_boolean, 
   
   @UI.hidden: #(HideDatePayServiceBegin)
      DatePayServiceBegin,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideDatePayServiceBegin :abap_boolean, 
   
    @UI.hidden: #(HideDatePayServiceEnd)
      DatePayServiceEnd,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideDatePayServiceEnd :abap_boolean, 
   
    @UI.hidden: #(HideDisabilityCode)
      DisabilityCode,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideDisabilityCode :abap_boolean, 
   
    @UI.hidden: #(HideExpensePaid)
      ExpensePaid,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideExpensePaid :abap_boolean, 
   
   @UI.hidden: #(HideExpensePaidDelta)
      ExpensePaidDelta,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideExpensePaidDelta :abap_boolean, 
   
   @UI.hidden: #(HideExpenseRecovery)
      ExpenseRecovery,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideExpenseRecovery :abap_boolean, 
   
   @UI.hidden: #(HideExpenseRecoveryDelta)
      ExpenseRecoveryDelta,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideExpenseRecoveryDelta :abap_boolean, 
   
   @UI.hidden: #(HideExpenseReserveDelta)
      ExpenseReserveDelta,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideExpenseReserveDelta :abap_boolean, 
   
   @UI.hidden: #(HideExpenseReserve)
      ExpenseReserve,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideExpenseReserve :abap_boolean, 
   
   @UI.hidden: #(HideIndemnityPdPaid)
      IndemnityPdPaid,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideIndemnityPdPaid :abap_boolean, 
   
   @UI.hidden: #(HideIndemnityPdPaidDelta)
      IndemnityPdPaidDelta,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideIndemnityPdPaidDelta :abap_boolean, 
   
    @UI.hidden: #(HideIndemnityPdRecovery)
      IndemnityPdRecovery,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideIndemnityPdRecovery :abap_boolean, 
   
   @UI.hidden: #(HideIndemnityPdRecoveryDelta)
      IndemnityPdRecoveryDelta,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideIndemnityPdRecoveryDelta :abap_boolean, 
   
   @UI.hidden: #(HideIndemnityPdReserve)
      IndemnityPdReserve,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideIndemnityPdReserve :abap_boolean, 
   
    @UI.hidden: #(HideIndemnityPdReserveDelta)
      IndemnityPdReserveDelta,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideIndemnityPdReserveDelta :abap_boolean, 
   
   @UI.hidden: #(HideInvoiceAmount)
      InvoiceAmount,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideInvoiceAmount :abap_boolean, 
   
    @UI.hidden: #(HideInvoiceNumber)
      InvoiceNumber,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideInvoiceNumber :abap_boolean, 
   
   @UI.hidden: #(HideMedicalBiPaid)
      MedicalBiPaid,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideMedicalBiPaid :abap_boolean, 
   
    @UI.hidden: #(HideMedicalBiPaidDelta)
      MedicalBiPaidDelta,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideMedicalBiPaidDelta :abap_boolean, 
   
    @UI.hidden: #(HideMedicalBiRecovery)
      MedicalBiRecovery,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideMedicalBiRecovery :abap_boolean, 
   
    @UI.hidden: #(HideMedicalBiRecoveryDelta)
      MedicalBiRecoveryDelta,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideMedicalBiRecoveryDelta :abap_boolean, 
   
    @UI.hidden: #(HideMedicalBiReserveDelta)
      MedicalBiReserveDelta,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideMedicalBiReserveDelta :abap_boolean, 
   
   @UI.hidden: #(HideMedicalBiReserve)
      MedicalBiReserve,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideMedicalBiReserve :abap_boolean, 
   
    @UI.hidden: #(HidePayComment)
      PayComment,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HidePayComment :abap_boolean, 
   
    @UI.hidden: #(HidePayeeLookup)
      PayeeLookup,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HidePayeeLookup :abap_boolean, 
   
    @UI.hidden: #(HidePayeeAddressLine2)
      PayeeAddressLine2,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HidePayeeAddressLine2 :abap_boolean, 
   
   @UI.hidden: #(HidePayeeAddressLine1)
      PayeeAddressLine1,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HidePayeeAddressLine1 :abap_boolean, 
   
   @UI.hidden: #(HidePayeeCity)
      PayeeCity,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HidePayeeCity :abap_boolean, 
   
   @UI.hidden: #(HidePayeeContact)
      PayeeContact,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HidePayeeContact :abap_boolean, 
   
   @UI.hidden: #(HidePayeeCountry)
      PayeeCountry,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HidePayeeCountry :abap_boolean, 
   
   @UI.hidden: #(HidePayee)
      Payee,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HidePayee :abap_boolean, 
   
    @UI.hidden: #(HidePayeePostalCode)
      PayeePostalCode,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HidePayeePostalCode :abap_boolean, 
   
   @UI.hidden: #(HidePayeeState)
      PayeeState,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HidePayeeState :abap_boolean, 
   
   @UI.hidden: #(HidePayeeType)
      PayeeType,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HidePayeeType :abap_boolean, 
   
    @UI.hidden: #(HidePaymentStatus)
      PaymentStatus,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HidePaymentStatus :abap_boolean, 
   
    @UI.hidden: #(HideQuickLoad)
      QuickLoad,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideQuickLoad :abap_boolean, 
   
   @UI.hidden: #(HideRecoveryReceivedOther2)
      RecoveryReceivedOther2,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideRecoveryReceivedOther2 :abap_boolean, 
   
    @UI.hidden: #(HideRecoveryReceivedOther2Delta)
      RecoveryReceivedOther2Delta,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideRecoveryReceivedOther2Delta :abap_boolean, 
   
   @UI.hidden: #(HideRecoveryReceivedOther)
      RecoveryReceivedOther,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideRecoveryReceivedOther :abap_boolean, 
   
   @UI.hidden: #(HideRecoveryReceivedOtherDelta)
      RecoveryReceivedOtherDelta,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideRecoveryReceivedOtherDelta :abap_boolean, 
   
    @UI.hidden: #(HideTaxId)
      TaxId,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideTaxId :abap_boolean, 
   
   @UI.hidden: #(HideTotalReserve)
      TotalReserve,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideTotalReserve :abap_boolean, 
   
    @UI.hidden: #(HideTrankey)
      Trankey,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideTrankey :abap_boolean, 
   
   @UI.hidden: #(HideTransactionCode)
      TransactionCode,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideTransactionCode :abap_boolean, 
   
   @UI.hidden: #(HideTransactionDate)
      TransactionDate,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideTransactionDate :abap_boolean, 
   
    @UI.hidden: #(HideTransactionSequence)
      TransactionSequence,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideTransactionSequence :abap_boolean, 
   
   @UI.hidden: #(HideTransactionStatus)
      TransactionStatus,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideTransactionStatus :abap_boolean, 
   
   @UI.hidden: #(HideType)
      Type,
       @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
   virtual HideType :abap_boolean, 
   
      Createdby,
      Createdat,
      Lastchangedby,
      Lastchangedat,
      _Claim : redirected to parent ZC_GRC_CLAIMS_FINES_DUTIES,
      _ClaimTrn_RecType_PL,
      _ClaimTrn_Category_PL

}
