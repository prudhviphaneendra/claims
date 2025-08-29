@Metadata.allowExtensions: true
@EndUserText.label: 'Incident Only Pollution'
@AccessControl.authorizationCheck: #CHECK
//@ObjectModel.query.implementedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
define root view entity ZC_GRC_INCIDENT_POLLUTION
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
@ObjectModel.text.element: ['Property_Damage']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_3P_DAMAGE_PL', element: 'Id' } }]
X3rdPartyPropertyDamage,
_3PDAMAGE_PL.Party_Damage as Property_Damage,
PropetyType,
@ObjectModel.text.element: ['Accident_Type']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_ACCTYPE_DEPEND', element: 'accidenttypeid' },
      additionalBinding: [{ localElement: 'ClaimRecType',
      element: 'RecordtypeId',
      usage: #FILTER_AND_RESULT }],useForValidation: true }]
AccidentType,
_AccidentType_PL.Accident_Type as Accident_Type,
AdjusterEmail,
AdjusterName,
AdjusterPhone,
AmountReceived,
AmountSubmitted,
AreaIncidentOccurred,
DateClaimantBorn,
@ObjectModel.text.element: ['Cause_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CAUSE_PL', element: 'Id' } }]
Cause,
_Cause_PL.Cause as Cause_PL,
@ObjectModel.text.element: ['Circumstances_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CIRCUMSTANCES_PL', element: 'Id' } }]
Circumstances,
_Circumstances_PL.Circumstances as Circumstances_PL,
ClaimName,
ClaimantAddressLine1,
ClaimantAddressLine2,
ClaimantAge,
ClaimantCity,
@ObjectModel.text.element: ['ClaimCountry_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIMANT_COUNTRY_PL', element: 'Id' } }]
ClaimantCountry,
_ClaimCountry.Claimant_Country as ClaimCountry_PL,
@ObjectModel.text.element: ['ClaimGender']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIMANT_GENDER_PL', element: 'Id' } }]
ClaimantGender,
_ClaimGender.Claimant_Gender as ClaimGender,
ClaimantName,
ClaimantPhone,
ClaimantPostalCode,
ClaimantSsn,
@ObjectModel.text.element: ['ClaimState']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIMANT_STATE_PL', element: 'Id' } }]
ClaimantState,
_ClaimantState_PL.Claimant_State as ClaimState,
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
@ObjectModel.text.element: ['DAAppointed_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_DA_APPOINTED_PL', element: 'Id' } }]
DaAppointed,
_DA_Appointed_PL.DA_Appointed as DAAppointed_PL,
DaAppointedDate,
DaEmail,
@ObjectModel.text.element: ['DAFirm_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_DA_FIRM_PL', element: 'Id' } }]
DaFirmName,
_DA_Firm_PL.DA_Firm as DAFirm_PL,
DaHourlyRate,
DaName,
DaPhone,
DateClosed,
DateIndemnityReceived,
DateOpened,
DateReceived,
DateReopened,
ReportedToInsurer,
SettlementDate,
DateSubmitted,
DateSubmittedToInsurer,
DayOfWeek,
DecisionMade,
DemandAmount,
EquipmentOperator,
@ObjectModel.text.element: ['EquipmentType_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_EQUIPMENT_TYPE_PL', element: 'Id' } }]
EquipmentType,
_EquipmentType_PL.Equipment_Type as EquipmentType_PL,
@ObjectModel.text.element: ['Fatality_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_FATALITY_PL', element: 'Id' } }]
Fatality,
_Fatality_PL.Fatality as Fatality_PL,
FileLocation,
HandlerBu,
@ObjectModel.text.element: ['HSSELearning_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_HSSE_LEARNING_PL', element: 'Id' } }]
HsseLearningPacks,
_HSSELearning_PL.HSSE_Learning as HSSELearning_PL,
BuClaim,
@ObjectModel.text.element: ['InjuryType_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_INJURY_TYPE_PL', element: 'Id' } }]
InjuryType,
_InjuryType_PL.Injured_Type as InjuryType_PL,
@ObjectModel.text.element: ['InsurenceCarrier_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_INSURANCE_CARRIER_PL', element: 'Id' } }]
TpaCarrier,
_InsuranceCarrier_PL as InsurenceCarrier_PL,
@ObjectModel.text.element: ['InsuredSurvey_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_INSURANCE_SURVEY_PL', element: 'Id' } }]
InsuranceSurvey,
_InsuranceSurvey_PL.Insurance_Survey as InsuredSurvey_PL,
InsurerClaim,
LastCloseDate,
@ObjectModel.text.element: ['LitigationStatus_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LITIGATION_STATUS_PL', element: 'Id' } }]
LitigationStatusGrm,
_LitigationStatus_PL.Litigation_Status as LitigationStatus_PL,
HierarchyNode,
AccidentAddressLine2,
AccidentAddressLine1,
AccidentCity,
@ObjectModel.text.element: ['LossCountry_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LOSS_COUNTRY_PL', element: 'Id' } }]
LossCountry,
_LossCountry_PL.Loss_Country as LossCountry_PL,
DateOfLoss,
AccidentDescription,
@ObjectModel.text.element: ['LossState_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LOSS_STATE_PROVINCE_PL', element: 'Id' } }]
AccidentState,
_LossState_PL.Loss_State_Province as LossState_PL,
MediationDate,
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
OccurrenceNumber,
@ObjectModel.text.element: ['PaAppointed_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PA_APPOINTED_PL', element: 'Id' } }]
PaAppointed,
_PA_Appointed_PL.PA_Appointed as PaAppointed_PL,
PaAppointedDate,
PaFirmName,
PaName,
@ObjectModel.text.element: ['PhysicalFile_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PHYSICAL_FILE_PL', element: 'Id' } }]
PhysicalFile,
_PhysicalFile_PL.Physical_File as PhysicalFile_PL,
PolicyName,
PolicyNumberNew,
PolicySectionLookup,
DateReportedToClient,
ReportingDepartment,
ResponseDate,
Savings,
ServedDate,
SettlementAmount,
Status,
@ObjectModel.text.element: ['SubType_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_SUBTYPE_DEPENDENCY', element: 'subtypeid' },
      additionalBinding: [{ localElement: 'AccidentType',
      element: 'accidenttypeid',
      usage: #FILTER_AND_RESULT }],useForValidation: true }]
SubType,
_SubType_PL.Sub_Type as SubType_PL,
_SubmitTPA_PL.Submit_TPA as SubmitTPA_PL,
@ObjectModel.text.element: ['SubmitReimburse_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SUBMIT_REIMBURSE_PL', element: 'Id' } }]
SubmittedForReimb,
_SubmitReimburse_PL.Submit_Reimburse as SubmitReimburse_PL,
@ObjectModel.text.element: ['Submit3P_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SUBMIT_3P_PL', element: 'Id' } }]
SubmittedTo3rdParty,
_Submit3P_PL.Submit_3P as Submit3P_PL,
@ObjectModel.text.element: ['Subrogation_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SUBROGATION_PL', element: 'Id' } }]
SubrogationGrm,
_Subrogation_PL.Subrogation as Subrogation_PL,
SuitFiledDate,
AccidentTime,
TimebarDateCDel,
TrialDate,
TruckingCompanyAddress,
TruckingCompanyCity,
TruckingCompanyContact,
TruckingCompanyName,
TruckingCompanyPhone,
TruckingCompanyZip,
@ObjectModel.text.element: ['TruckState_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_TRUCKING_CO_STATE_PL', element: 'Id' } }]
TruckingCompanyState,
_TruckingState_PL.Trucking_Co_State as TruckState_PL,
WhoOwnsProperty,
Createdat,
Lastchangedby,
Lastchangedat,
_claim_trn : redirected to composition child ZC_GRC_INCIDENTTXN_POLLUTION,
_Matrix
}
where ClaimRecType = '500042';
