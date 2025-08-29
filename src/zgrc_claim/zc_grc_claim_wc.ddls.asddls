
@Metadata.allowExtensions: true
@EndUserText.label: 'CLAIM WC'
@AccessControl.authorizationCheck: #CHECK
//@ObjectModel.query.implementedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
define root view entity ZC_GRC_CLAIM_WC
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
AreaIncidentOccurred,
AverageWeeklyWage,
BelowDeductibleClaim,
DateClaimantBorn,
@ObjectModel.text.element: ['BodyPart_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_BODY_PART_PL', element: 'Id' } }]
BodyPart,
_BodyPart_PL.Body_part as BodyPart_PL,
@ObjectModel.text.element: ['BUChargeable_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_BU_CHARGEABLE_PL', element: 'Id' } }]
Chargeable,
_BUChargeable_PL.BU_Chargeable as BUChargeable_PL,
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
@Semantics.currencyCode: true
          Currency,
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
@ObjectModel.text.element: ['ClaimMarital_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIMANT_MARITAL_PL' , element: 'Id' } }]
ClaimantMaritalStatus,
_ClaimMarital_PL as ClaimMarital_PL,
ClaimantName,
ClaimantPhone,
ClaimantPostalCode,
ClaimantSsn,
@ObjectModel.text.element: ['ClaimState']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIMANT_STATE_PL', element: 'Id' } }]
ClaimantState,
_ClaimantState_PL.Claimant_State as ClaimState,
CompensationRate,
@ObjectModel.text.element: ['ConcurrentClaim_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CONCURRENT_CLAIM_PL', element: 'Id' } }]
ConcurrentClaim,
_ConcurrentClaim_PL.Concurrent_Claim as ConcurrentClaim_PL,
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
DateHired,
DateLastWorked,
DateOpened,
DateReopened,
ReportedToInsurer,
DateReturnedToWork,
DayOfWeek,
DaysToConversion,
@ObjectModel.text.element: ['DCLIEmployee_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_DCLI_EMPLOYEE_PL', element: 'Id' } }]
DcliEmployee,
_DCLI_Employee_PL.DCLI_Employee as DCLIEmployee_PL,
DeductibleFromPolicy,
Department,
DescribeMedicalTreatment,
Diagnosis,
DateOfFirstDisability,
EmployeeJobTitle,
@ObjectModel.text.element: ['EquipInfraType']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_EQPINFRATYPE_DEPENDENCY', element: 'EquipmentInfraTypeID' },
      additionalBinding: [{ localElement: 'TypeOfPropertyDamaged',
      element: 'TypeofPropertyDamagedID',
      usage: #FILTER_AND_RESULT }],useForValidation: true }]
EquipmentInfrastructureType,
_EquipmentType_PL.Equipment_Type as EquipInfraType, 
FCode,
@ObjectModel.text.element: ['Fatality_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_FATALITY_PL', element: 'Id' } }]
Fatality,
_Fatality_PL.Fatality as Fatality_PL,
FileLocation,
HandlerBu,
HealthcareFacilityAddrline1,
HealthcareFacilityAddrline2,
HealthcareFacilityName,
@ObjectModel.text.element: ['Overnight_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_HOSPITALIZED_OVERNIGHT_PL', element: 'Id' } }]
HospitalizedOvernight,
_HospitalOVernight_PL.Hospitalized as Overnight_PL,
@ObjectModel.text.element: ['HSSELearning_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_HSSE_LEARNING_PL', element: 'Id' } }]
HsseLearningPacks,
_HSSELearning_PL.HSSE_Learning as HSSELearning_PL,
BuClaim,
@ObjectModel.text.element: ['InjuryDeath_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_INJURY_CAUSE_DEATH_PL', element: 'Id' } }]
InjuryCauseDeath,
_InjuryDeath_PL.Injured_Cause as InjuryDeath_PL,
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
@ObjectModel.text.element: ['LongTerm_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LONG_TERM_PL', element: 'Id' } }]
LongTerm,
_LongTerm_PL.Long_Term as LongTerm_PL,
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
AccidentPostalCode,
@ObjectModel.text.element: ['LossState_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LOSS_STATE_PROVINCE_PL', element: 'Id' } }]
AccidentState,
_LossState_PL.Loss_State_Province as LossState_PL,
@ObjectModel.text.element: ['LostTime_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LOST_TIME_INDICATOR_PL', element: 'Id' } }]
LostTimeIndicator,
_LostTime_PL.Loss_Time_Indicator as LostTime_PL,
StarsDeductible,
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
@ObjectModel.text.element: ['MescEmployee_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MESC_EMPLOYEE_PL', element: 'Id' } }]
MescEmployee,
_MescEmployee_PL.Medicare_Report as MescEmployee_PL,
NameTitleReportedTo,
@ObjectModel.text.element: ['NatureInjury_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_NATURE_INJURY_PL', element: 'Id' } }]
Nature,
_NatureInjury_PL.Nature_Injury as NatureInjury_PL,
@ObjectModel.text.element: ['DisabilityPeriod_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_DISABILITY_PERIOD_PL', element: 'Id' } }]
NewDisabilityPeriod,
_DisabilityPeriod_PL.Disability_Period as DisabilityPeriod_PL,
@ObjectModel.text.element: ['Occupation_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_OCCUPATION_PL', element: 'Id' } }]
Occupation,
_Occupation_PL.Occupation as Occupation_PL,
OccurrenceNumber,
@ObjectModel.text.element: ['OclClaim_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_OCU_CLAIM_PL', element: 'Id' } }]
OcuClaim,
_OCU_Claim_PL.Ocl_Claim as OclClaim_PL,
Owcp,
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
@ObjectModel.text.element: ['Preventable_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PREVENTABLE_PL', element: 'Id' } }]
Preventable,
_Preventable_PL.Preventable as Preventable_PL,
@ObjectModel.text.element: ['RedFlag_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_RED_FLAG_PL', element: 'Id' } }]
RedFlag,
_RedFlag_PL.Red_Flag as RedFlag_PL,
DateReportedToClient,
ResponseDate,
RetainedEarningCapacity,
ServedDate,
@ObjectModel.text.element: ['Severity_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SEVERITY_PL', element: 'Id' } }]
Severity,
_Severity_PL.Severity as Severity_PL,
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
SuitFiledDate,
AccidentTime,
TotalDeductible,
TrialDate,
@ObjectModel.text.element: ['PropertyDamage_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_PRDAMTYPE_DEPENDENCY', element: 'TypeofPropertyDamagedID' },
      additionalBinding: [{ localElement: 'ClaimRecType',
      element: 'RecordtypeId',
      usage: #FILTER_AND_RESULT }],useForValidation: true }]
TypeOfPropertyDamaged,
_PropertyDamaged_PL.Property_Damaged as PropertyDamage_PL,
WeeklyWages,
Createdat,
Lastchangedby,
Lastchangedat,
_claim_trn : redirected to composition child ZC_GRC_CLAIMTXN_WC,
_Matrix
}
where ClaimRecType = '500029';
