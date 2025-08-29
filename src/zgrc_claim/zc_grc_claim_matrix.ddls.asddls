@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Projection View for Claim Matrix'
@Metadata.ignorePropagatedAnnotations: true
@Metadata.allowExtensions: true
@UI.presentationVariant: [{ sortOrder: [{ by: 'SortOrder', direction: #ASC  }] }]
define root view entity ZC_GRC_CLAIM_MATRIX
  provider contract transactional_query as projection on ZR_GRC_CLAIM_MATRIX
{
    key ClaimUuid,
    key Category,
    Paid,
    Outstanding,
    Incurred,
    @Semantics.currencyCode: true
    CurrencyCode,
    SortOrder,
     _Claim 
}
