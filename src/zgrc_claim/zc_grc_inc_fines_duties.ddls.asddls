@Metadata.allowExtensions: true
@EndUserText.label: 'Incident Only Fines & Duties'
@AccessControl.authorizationCheck: #CHECK
//@ObjectModel.query.implementedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
define root view entity ZC_GRC_INC_FINES_DUTIES
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
@ObjectModel.text.element: ['Threshold']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_THRESHOLD_PL', element: 'Id' } }]
AboveClaimThreshold,
_Threshold_PL.Threshold as Threshold,
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
ArrivalDate,
BL,
BreakBulkType,
@ObjectModel.text.element: ['Cause_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CAUSE_PL', element: 'Id' } }]
Cause,
_Cause_PL.Cause as Cause_PL,
Chassis,
ChassisOwner,
@ObjectModel.text.element: ['Circumstances_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CIRCUMSTANCES_PL', element: 'Id' } }]
Circumstances,
_Circumstances_PL.Circumstances as Circumstances_PL,
ClaimName,
ClaimantAddressLine1,
ClaimantAddressLine2,
ClaimantCity,
@ObjectModel.text.element: ['ClaimCountry_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIMANT_COUNTRY_PL', element: 'Id' } }]
ClaimantCountry,
_ClaimCountry.Claimant_Country as ClaimCountry_PL,
ClaimantName,
ClaimantPhone,
Reference,
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
Commodity,
@ObjectModel.text.element: ['ConditionClass_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CONDITION_CLASS_PL', element: 'Id' } }]
ConditionOfClassImposed,
_ConditionClass_PL.Condition_Class as ConditionClass_PL,
ContainerNumber,
ContainerOwner,
ContainerPosition,
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
DateOfSurvey,
DateOpened,
DateReceived,
DateReopened,
ReportedToInsurer,
SettlementDate,
DateSubmitted,
DateSubmittedToInsurer,
DayOfWeek,
DaysToDecision,
DaysToReply,
DecisionMade,
DeferredRepairs,
DemandAmount,
EquipmentOperator,
@ObjectModel.text.element: ['EquipmentType_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_EQUIPMENT_TYPE_PL', element: 'Id' } }]
EquipmentType,
_EquipmentType_PL.Equipment_Type as EquipmentType_PL,
FileLocation,
HandlerBu,
@ObjectModel.text.element: ['HSSELearning_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_HSSE_LEARNING_PL', element: 'Id' } }]
HsseLearningPacks,
_HSSELearning_PL.HSSE_Learning as HSSELearning_PL,
BuClaim,
@ObjectModel.text.element: ['InsurenceCarrier_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_INSURANCE_CARRIER_PL', element: 'Id' } }]
TpaCarrier,
_InsuranceCarrier_PL as InsurenceCarrier_PL,
InsurerClaim,
LastCloseDate,
@ObjectModel.text.element: ['LitigationStatus_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LITIGATION_STATUS_PL', element: 'Id' } }]
LitigationStatusGrm,
_LitigationStatus_PL.Litigation_Status as LitigationStatus_PL,
HierarchyNode,
DateOfLoss,
AccidentDescription,
MediationDate,
NotifiedDate,
OccurrenceNumber,
@ObjectModel.text.element: ['PaAppointed_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PA_APPOINTED_PL', element: 'Id' } }]
PaAppointed,
_PA_Appointed_PL.PA_Appointed as PaAppointed_PL,
PaAppointedDate,
PaFirmName,
PaName,
@ObjectModel.text.element: ['PermanentRepairs_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PERMANENT_REPAIRS_PL', element: 'Id' } }]
PermanentRepairs,
_PermanentRepairs_PL.Permanent_Repairs as PermanentRepairs_PL,
@ObjectModel.text.element: ['PhysicalFile_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PHYSICAL_FILE_PL', element: 'Id' } }]
PhysicalFile,
_PhysicalFile_PL.Physical_File as PhysicalFile_PL,
PolicyName,
PolicyNumberNew,
PolicySectionLookup,
PortOfDischarge,
PortOfLoading,
PermanentPortOfRepair,
PermanentRepairCompleteDate,
PermanentRepairDescription,
PermanentRepairStartDate,
@ObjectModel.text.element: ['PortRepairs_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PORT_REPAIRS_PL', element: 'Id' } }]
RepairsCompletedInPort,
_PortRepairs_PL.Port_Repairs as PortRepairs_PL,
ReplyDate,
DateReportedToClient,
ReportingDepartment,
ResponseDate,
Savings,
Seal,
ServedDate,
SettlementAmount,
Shift,
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
@ObjectModel.text.element: ['SurveyRequest_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SURVEY_REQUEST_PL', element: 'Id' } }]
SurveyRequested,
_SurveyRequest_PL.Survey_Request as SurveyRequest_PL,
//SurveyedAt,
SurveyorName,
@ObjectModel.text.element: ['TempRepairs_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_TEMPORARY_REPAIRS_PL', element: 'Id' } }]
TemporaryRepairs,
_Temp_Repairs_PL.Temporary_Request as TempRepairs_PL,
TimebarDateCDel,
TrialDate,
Vessel,
@ObjectModel.text.element: ['VesselOperator_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_VESSEL_OPERATOR_PL', element: 'Id' } }]
VesselOperator,
_VesselOperator_PL.Vessel_Operator as VesselOperator_PL,
VesselOwnerName,
Voyage,
Createdat,
Lastchangedby,
Lastchangedat,
_claim_trn : redirected to composition child ZC_GRC_INCTXN_FINES_DUTIES,
_Matrix
}
where ClaimRecType = '500022';
