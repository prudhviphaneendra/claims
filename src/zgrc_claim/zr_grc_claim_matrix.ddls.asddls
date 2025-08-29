@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for ZTGRC_CLAIM_MTRX'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
@UI.presentationVariant: [{ sortOrder: [{ by: 'SortOrder', direction: #ASC  }] }]
define root view entity ZR_GRC_CLAIM_MATRIX as select from ztgrc_claim_mtrx
association to ZR_TGRC_CLAIM as _Claim
on $projection.ClaimUuid = _Claim.ClaimUuid
{
    key claim_uuid as ClaimUuid,
  
       @UI.lineItem: [{ position:10, label: 'Category', criticality: 'CategoryCriticality', criticalityRepresentation: #WITHOUT_ICON }]
    key category as Category,
    @Semantics.amount.currencyCode: 'CurrencyCode'
       @UI.lineItem: [{ position:20, label: 'Paid Calculation' }]
     paid  as Paid,
       @UI.lineItem: [{ position:30, label: 'Outstanding Calculation' }]
    @Semantics.amount.currencyCode: 'CurrencyCode'
    outstanding  as Outstanding,
       @UI.lineItem: [{ position:40, label: 'Incurred Calculation' }]
    @Semantics.amount.currencyCode: 'CurrencyCode'
    incurred as Incurred,
    currency_code as CurrencyCode,
    @UI.lineItem: [{ position:50, label: 'Sort' }]
    @UI.hidden: true
    cast( 
       case category
          when 'BI/Medical' then 1
          when 'PD/Indemnity' then 2
          when 'Expense' then 3
          when 'Total' then 4
          when 'Insurance Payment' then 5         
          when 'Insurance Reserve' then 6
          when  'Recovery 3rd Party' then 7
          when 'Net Total' then 8
         else 99
         end as abap.int4 ) as SortOrder,
    case category
          when 'Insurance Payment' then 1
          when 'Insurance Reserve' then 1
          when 'Recovery 3rd Party' then 1
         else 0
         end as CategoryCriticality,
         _Claim
}

