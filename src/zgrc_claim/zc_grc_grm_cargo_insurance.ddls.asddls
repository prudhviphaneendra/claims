@Metadata.allowExtensions: true
@EndUserText.label: 'GRM Cargo Insurance'
@AccessControl.authorizationCheck: #CHECK
//@ObjectModel.query.implementedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
define root view entity ZC_GRC_GRM_CARGO_INSURANCE
provider contract transactional_query
as projection on ZR_TGRC_CLAIM
{
key ClaimUuid,
@ObjectModel.text.element: ['RecordType']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIM_RECTYPE_PL', element: 'Id' } }]
ClaimRecType,
_ClaimRecType_PL.Claim_RecType as RecordType,
@Semantics.currencyCode: true
Currency,
AboveDeductibleClaim,
AllegedClaimedUnitS,
BelowDeductibleClaim,
BillOfLadingNumber,
BrandCiClaims,
@ObjectModel.text.element: ['Cause_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CAUSE_PL', element: 'Id' } }]
Cause,
_Cause_PL.Cause as Cause_PL,
CertificateNumber,
@ObjectModel.text.element: ['Charge_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CHARGE_NAME_PL', element: 'Id' } }]
ChargeName,
_ChargeName_PL.Charge_Name as Charge_PL,
ClaimCountry,
ClaimName,
ContainerNumber,
@ObjectModel.text.element: ['CoverageMajor_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_CMAJORTYPE_DEPENDENCY', element: 'CoverageMajorID' },
      additionalBinding: [{ localElement: 'ClaimRecType',
      element: 'recordtypeid',
      usage: #FILTER_AND_RESULT }],useForValidation: true }]
CoverageMajor,
_CoverageMajor_PL.Coverage_Major as CoverageMajor_PL,
@ObjectModel.text.element: ['CoverageMinor_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_CMINORTYPE_DEPENDENCY', element: 'CoverageMinorID' },
      additionalBinding: [{ localElement: 'CoverageMajor',
      element: 'CoverageMajorID',
      usage: #FILTER_AND_RESULT }],useForValidation: true }]
CoverageMinor,
_CoverageMinor_PL.Coverage_Minor as CoverageMinor_PL,
Createdb,
CrossReference,
CurrencyGrmUsd,
DateClosed,
DateOpened,
DeductibleFromPolicy,
@ObjectModel.text.element: ['PlaceReceipt_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PLACE_RECEIPT_PL', element: 'Id' } }]
Port,
_Place_Receipt_PL.Place_Receipt as PlaceReceipt_PL,
GrmClaimsHandler,
@ObjectModel.text.element: ['HSCode_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_HS_CODE_PL', element: 'Id' } }]
HsCode,
_HSCode_PL.HS_Code as HSCode_PL,
IpsCenterProvisionUsd,
LimitationFundCurrency,
LossJuristiction,
@ObjectModel.text.element: ['LossCountry_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LOSS_COUNTRY_PL', element: 'Id' } }]
LossCountry,
_LossCountry_PL.Loss_Country as LossCountry_PL,
DateOfLoss,
AccidentDescription,
LouSecurityAmount,
@ObjectModel.text.element: ['MainCause_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_MAINCAUSE_DEPENDENCY', element: 'MainCauseID' },
      additionalBinding: [{ localElement: 'MainEvent',
      element: 'MainEventID',      
      usage: #FILTER_AND_RESULT }],useForValidation: true }]
MainCause,
_MainCause_PL.Main_Cause as MainCause_PL,
@ObjectModel.text.element: ['MainEvent_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_MAINEVENT_DEPENDENCY', element: 'MainEventID' },
      additionalBinding: [{ localElement: 'CoverageMinor',
      element: 'CoverageMinorID',
      usage: #FILTER_AND_RESULT }],useForValidation: true }]
MainEvent,
_MainEvent_PL.Main_Event as MainEvent_PL,
StarsDeductible,
MiasShare,
MiasShareManual,
ModeOfTransport,
Occurrence,
OccurrenceType,
FinalDestination,
PortOfOrigin,
PortOfReceipt,
DateReportedToClient,
SettlementAmount,
ShippersInstructions,
Status,
TotalDeductible,
TtlNoDamageBoxesPkgWeig,
TotalMiasShare,
Voyage,
Createdat,
Lastchangedby,
Lastchangedat,
_claim_trn : redirected to composition child ZC_GRC_GRMTXN_CARGO_INSURANCE,
_Matrix
}
where ClaimRecType = '500030';
