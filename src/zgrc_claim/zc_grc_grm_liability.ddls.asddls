@Metadata.allowExtensions: true
@EndUserText.label: 'Claim'
@AccessControl.authorizationCheck: #CHECK
//@ObjectModel.query.implementedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
define root view entity ZC_GRC_GRM_LIABILITY
provider contract transactional_query
as projection on ZR_TGRC_CLAIM
{
key ClaimUuid,
@ObjectModel.text.element: ['RecordType']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIM_RECTYPE_PL', element: 'Id' } }]
ClaimRecType,
_ClaimRecType_PL.Claim_RecType as RecordType,
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
BreakBulkType,
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
Commodity,
ContainerNumber,
@ObjectModel.text.element: ['ContainerSize_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CONTAINER_SIZE_PL', element: 'Id' } }]
ContainerSize,
_ContainerSize_PL.Container_Size as ContainerSize_PL,
@ObjectModel.text.element: ['ContainerType_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CONTAINER_TYPE_PL', element: 'Id' } }]
ContainerType,
_ContainerType_PL.Container_Type as ContainerType_PL,
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
@ObjectModel.text.element: ['DAAppointed_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_DA_APPOINTED_PL', element: 'Id' } }]
DaAppointed,
_DA_Appointed_PL.DA_Appointed as DAAppointed_PL,
DaEmail,
@ObjectModel.text.element: ['DAFirm_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_DA_FIRM_PL', element: 'Id' } }]
DaFirmName,
_DA_Firm_PL.DA_Firm as DAFirm_PL,
DaName,
DaPhone,
@ObjectModel.text.element: ['DamageCaused_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_3P_CAUSED_DAMAGE_PL', element: 'Id' } }]
DamageCausedBy3rdParty,
_3PCAUSED_DAMAGE_PL.Caused_Damage as DamageCaused_PL,
DateClosed,
DateOpened,
ReportedToInsurer,
DateSubmitted,
DateSubrogationSubmitted,
DeductibleFromPolicy,
DemandAmount,
FormerAdjusterClaim,
GrmClaimsHandler,
InitialEstimate,
@ObjectModel.text.element: ['InsuredSurvey_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_INSURANCE_SURVEY_PL', element: 'Id' } }]
InsuranceSurvey,
_InsuranceSurvey_PL.Insurance_Survey as InsuredSurvey_PL,
InsuredName,
Insurer,
@ObjectModel.text.element: ['LitigationStatus_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LITIGATION_STATUS_PL', element: 'Id' } }]
LitigationStatusGrm,
_LitigationStatus_PL.Litigation_Status as LitigationStatus_PL,
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
@ObjectModel.text.element: ['MedicareLien_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MEDICARE_LIEN_PL', element: 'Id' } }]
MedicareLien,
_MedicareLien_PL as MedicareLien_PL,
@ObjectModel.text.element: ['MedicareReport_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MEDICARE_REPORT_PL', element: 'Id' } }]
MedicareReportable,
_MedicareReport_PL.Medicare_Report as MedicareReport_PL,
MiasShare,
MiasShareManual,
Occurrence,
OccurrenceType,
@ObjectModel.text.element: ['PaAppointed_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PA_APPOINTED_PL', element: 'Id' } }]
PaAppointed,
_PA_Appointed_PL.PA_Appointed as PaAppointed_PL,
PaEmail,
PaFirmName,
PaName,
PaPhone,
PersonName,
PlannedRepairDate,
PolicyName,
PolicyNumberNew,
PolicySectionLookup,
PolicyYearNew,
PermanentRepairCompleteDate,
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
SubrogationSubmittedTo,
@ObjectModel.text.element: ['SurveyReport_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SURVEY_REPORT_PL', element: 'Id' } }]
SurveyReportYN,
_SurveyReport_PL.Survey_Report as SurveyReport_PL,
TimbarDateSubrogation,
TimebarDateApmmVsInsurance,
TimebarDateClaimantVsApmm,
TotalDeductible,
TotalMiasShare,
TruckingCompanyName,
VesselOwnerName,
Createdat,
Lastchangedby,
Lastchangedat,
_claim_trn : redirected to composition child ZC_GRC_CLAIMTXN_GRM_LIABILITY,
_Matrix
}
where ClaimRecType = '500031';
