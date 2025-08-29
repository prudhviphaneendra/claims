@Metadata.allowExtensions: true
@EndUserText.label: 'Claims Property'
@AccessControl.authorizationCheck: #CHECK
//@ObjectModel.query.implementedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
define root view entity ZC_GRC_CLAIMS_PROPERTY
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
AboveDeductibleClaim,
@ObjectModel.text.element: ['Accident_Type']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_ACCTYPE_DEPEND', element: 'accidenttypeid' },
      additionalBinding: [{ localElement: 'ClaimRecType',
      element: 'RecordtypeId',
      usage: #FILTER_AND_RESULT }],useForValidation: true }]
AccidentType,
_AccidentType_PL.Accident_Type as Accident_Type,
AdjusterClaim,
AdjusterEmail,
AdjusterName,
AdjusterPhone,
AmountReceived,
AmountSubmitted,
AreaIncidentOccurred,
Asset,
AssetCategory,
AssetNameSrc,
BelowDeductibleClaim,
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
ClaimantName,
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
DamageEstimate,
DateClosed,
DateIndemnityReceived,
DateOpened,
DateReceived,
DateReopened,
ReportedToInsurer,
DateSubmitted,
DateSubmittedToInsurer,
DayOfWeek,
DaysToConversion,
DeductibleFromPolicy,
EquipmentId,
EquipmentOperator,
@ObjectModel.text.element: ['EquipInfraType']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_EQPINFRATYPE_DEPENDENCY', element: 'EquipmentInfraTypeID' },
      additionalBinding: [{ localElement: 'TypeOfPropertyDamaged',
      element: 'TypeofPropertyDamagedID',
      usage: #FILTER_AND_RESULT }],useForValidation: true }]
EquipmentInfrastructureType,
_EquipmentType_PL.Equipment_Type as EquipInfraType, 
FileLocation,
FinalSettlementTargetDate,
HandlerBu,
@ObjectModel.text.element: ['HSSELearning_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_HSSE_LEARNING_PL', element: 'Id' } }]
HsseLearningPacks,
_HSSELearning_PL.HSSE_Learning as HSSELearning_PL,
BuClaim,
IncidentToClaimDate,
InfrastructureDesc,
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
InsuranceSurveyDt,
InsurerClaim,
LastCloseDate,
HierarchyNode,
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
StarsDeductible,
OccurrenceNumber,
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
DateReportedToClient,
ReportingDepartment,
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
TimebarDateCDel,
TotalDeductible,
@ObjectModel.text.element: ['PropertyDamage_PL']
@UI.textArrangement: #TEXT_ONLY
//@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PROPERTY_DAMAGED_PL', element: 'Id' } }]
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_PRDAMTYPE_DEPENDENCY', element: 'TypeofPropertyDamagedID' },
      additionalBinding: [{ localElement: 'ClaimRecType',
      element: 'RecordtypeId',
      usage: #FILTER_AND_RESULT }],useForValidation: true }]
TypeOfPropertyDamaged,
_PropertyDamaged_PL.Property_Damaged as PropertyDamage_PL,
Createdat,
Lastchangedby,
Lastchangedat,
_claim_trn : redirected to composition child ZC_GRC_CLAIMTXN_PROPERTY,
_Matrix
}
where ClaimRecType = '500028';
