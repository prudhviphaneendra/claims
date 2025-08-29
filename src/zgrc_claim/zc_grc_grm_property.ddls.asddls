@Metadata.allowExtensions: true
@EndUserText.label: 'GRM Property'
@AccessControl.authorizationCheck: #CHECK
//@ObjectModel.query.implementedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
define root view entity ZC_GRC_GRM_PROPERTY
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
AdjusterClaim,
AdjusterEmail,
AdjusterName,
AdjusterPhone,
Asset,
AssetCategory,
AssetNameSrc,
BelowDeductibleClaim,
Brand,
BuClaimsHandler,
@ObjectModel.text.element: ['Circumstances_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CIRCUMSTANCES_PL', element: 'Id' } }]
Circumstances,
_Circumstances_PL.Circumstances as Circumstances_PL,
ClaimCountry,
ClaimName,
ClaimLocation1,
ClaimTurnaround,
@ObjectModel.text.element: ['CloseType_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLOSE_TYPE_PL', element: 'Id' } }]
CloseType,
_CloseType_PL.Close_Type as CloseType_PL,
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
@ObjectModel.text.element: ['DamageCaused_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_3P_CAUSED_DAMAGE_PL', element: 'Id' } }]
DamageCausedBy3rdParty,
_3PCAUSED_DAMAGE_PL.Caused_Damage as DamageCaused_PL,
DateClosed,
DateOpened,
ReportedToInsurer,
DateSubrogationSubmitted,
DeductibleFromPolicy,
DemandAmount,
FinalSettlementTargetDate,
FormerAdjusterClaim,
GrmClaimsHandler,
InitialEstimate,
InsuredName,
Insurer,
@ObjectModel.text.element: ['LossCountry_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LOSS_COUNTRY_PL', element: 'Id' } }]
LossCountry,
_LossCountry_PL.Loss_Country as LossCountry_PL,
DateOfLoss,
AccidentDescription,
@ObjectModel.text.element: ['MainCasuality_PL']
@UI.textArrangement: #TEXT_ONLY
//@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MAIN_CASUALTY_PL', element: 'Id' } }]
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_MAINCASUALTY_DEPENDENCY', element: 'MainCasualityID' },
      additionalBinding: [{ localElement: 'MainEvent',
      element: 'MainEventID',      
      usage: #FILTER_AND_RESULT }],useForValidation: true }]
MainCasualty,
_MainCasualty_PL.Main_Casualty as MainCasuality_PL,
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
Occurrence,
OccurrenceType,
PersonName,
PlannedRepairDate,
PolicyName,
PolicyNumberNew,
PolicyYearNew,
PermanentRepairCompleteDate,
DateReportedToClient,
@ObjectModel.text.element: ['Responsible3PC_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_RESPONSIBLE_3PC_PL', element: 'Id' } }]
Responsible3rdPartyCode,
_Responsible3PC_PL.Responsible as Responsible3PC_PL,
Savings,
SettlementAmount,
PropertyType,
Status,
@ObjectModel.text.element: ['Subrogation_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SUBROGATION_PL', element: 'Id' } }]
SubrogationGrm,
_Subrogation_PL.Subrogation as Subrogation_PL,
SubrogationAmountReceived,
SubrogationAmountSubmitted,
SubrogationSubmittedTo,
@ObjectModel.text.element: ['SurveyReport_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SURVEY_REPORT_PL', element: 'Id' } }]
SurveyReportYN,
_SurveyReport_PL.Survey_Report as SurveyReport_PL,
TimebarDateApmmVsInsurance,
TimebarDateClaimantVsApmm,
TotalDeductible,
TotalMiasShare,
Createdat,
Lastchangedby,
Lastchangedat,
//_claim_trn : redirected to composition child ZC_GRC_GRMTXN_PROPERTY,
_Matrix

}
where ClaimRecType = '500032';
