@Metadata.allowExtensions: true
@EndUserText.label: 'GRM Property'
@AccessControl.authorizationCheck: #CHECK
//@ObjectModel.query.implementedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
define root view entity ZC_GRC_CLAIMS_GRM_PROPERTY
provider contract transactional_query
as projection on ZR_TGRC_CLAIM
{
key ClaimUuid,
ClaimRecType,
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
CoverageMajor,
CoverageMinor,
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
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MAIN_CASUALTY_PL', element: 'Id' } }]
MainCasualty,
_MainCasualty_PL.Main_Casualty as MainCasuality_PL,
@ObjectModel.text.element: ['MainCause_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MAIN_CAUSE_PL', element: 'Id' } }]
MainCause,
_MainCause_PL.Main_Cause as MainCause_PL,
@ObjectModel.text.element: ['MainEvent_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MAIN_EVENT_PL', element: 'Id' } }]
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
_claim_trn : redirected to composition child ZC_GRC_GRMTXN_PROPERTY,
_Matrix
}
where ClaimRecType = '500032';
