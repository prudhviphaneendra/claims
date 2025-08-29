@Metadata.allowExtensions: true
@EndUserText.label: 'Claim'
@AccessControl.authorizationCheck: #CHECK
//@ObjectModel.query.implementedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
define root view entity ZC_GRC_CLAIM_MARINE
provider contract transactional_query
as projection on ZR_TGRC_CLAIM
{
key ClaimUuid,
@ObjectModel.text.element: ['RecordType']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIM_RECTYPE_PL', element: 'Id' } }]
ClaimRecType,
_ClaimRecType_PL.Claim_RecType as RecordType,
X3rdPartyClaimsReceivedTtl,
X3rdPartyClaimsSettledTtl,
X3rdRecoveryObtainedFormula,
X3rdRecoveryPursuedFormula,
@ObjectModel.text.element: ['Activity_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_ACVT_DEPENDENCY', element: 'ActivityId' },
additionalBinding: [{ localElement: 'ClaimRecType',
      element: 'RecordtypeId',
      usage: #FILTER_AND_RESULT }],useForValidation: true }]
Activity,
_Activity_PL.Accident_Type as Activity_PL,
AdjusterClaim,
AdjusterEmail,
Asset,
@ObjectModel.text.element: ['BelowDeductible_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_BELOW_DEDUCTIBLE_PL', element: 'Id' } }]
BelowDeductible,
_BelowDeduct_PL.Below_Deductible as BelowDeductible_PL,
DateClaimantBorn,
@ObjectModel.text.element: ['BodyPart_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_BODY_PART_PL', element: 'Id' } }]
BodyPart,
_BodyPart_PL.Body_part as BodyPart_PL,
BuClaimsHandler,
CargoTypeCommodity,
ClaimName,
ClaimTurnaround,
ClaimantAddressLine1,
ClaimantAddressLine2,
ClaimantCity,
ClaimantPhone,
ClaimantPostalCode,
ClaimantSsn,
@ObjectModel.text.element: ['ClaimState']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIMANT_STATE_PL', element: 'Id' } }]
ClaimantState,
_ClaimantState_PL.Claimant_State as ClaimState,
CompensationTotal,
ContainerNumber,
ContainersDamagedDestroyed,
ContainersLostOverboard,
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
@Semantics.currencyCode: true
          Currency,
Createdb,
//@ObjectModel.text.element: ['CrewNationality_PL']
//@UI.textArrangement: #TEXT_ONLY
//@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CREW_NATIONALITY_PL', element: 'Id' } }]

CrewNationality,
//<_CrewNationality_PL.Crew_Nationality as CrewNationality_PL,>
@ObjectModel.text.element: ['CrewRank_PL']
@UI.textArrangement: #TEXT_ONLY
//@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CREW_RANK_PL', element: 'Id' } }]
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_CREWRANK_DEPENDENCY', element: 'CrewRankID' },
      additionalBinding: [{ localElement: 'MainEvent',
      element: 'MainEventID',
      
      usage: #FILTER_AND_RESULT }],useForValidation: true }]
CrewRank,
_CrewRank_PL.Crew_Rank as CrewRank_PL,
DateClosed,
DateOpened,
DeductibleTotal,
OriginCountry,
@ObjectModel.text.element: ['EligibleBenefits_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_ELIGIBLE_BENEFITS_PL', element: 'Id' } }]
SettlingAbvLglliabilityAmt,
_EligibleBenefits_PL.Eligible_Benefits as EligibleBenefits_PL,
EstimateTotalFormula,
@ObjectModel.text.element: ['EventType_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_MAINEVENT_DEPENDENCY', element: 'MainEventID' },
      additionalBinding: [{ localElement: 'MainEvent',
      element: 'MainEventID',    
      usage: #FILTER_AND_RESULT }],useForValidation: true }]
EventType,
_EventType_PL.Event_Type as EventType_PL,
FeesOutstandingTotal,
FeesPaidTotal,
FitForDutyDate,
@ObjectModel.text.element: ['FitnessDuty_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_FITNESS_DUTY_PL', element: 'Id' } }]
FitnessForDuty,
_FitnessDuty_PL.Fitness_Duty as FitnessDuty_PL,
@ObjectModel.text.element: ['FleetMangaer_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_FLEET_MANAGER_PL', element: 'Id' } }]
FleetGroup,
_FleetManager_PL.Fleet_Manager as FleetMangaer_PL,
GrmClaimsHandler,
HierarchyNodeAp,
ImoNumber,
InsurerClaim,
LimitationFund,
@ObjectModel.text.element: ['Litigation_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LITIGATION_PL', element: 'Id' } }]
Litigation,
_Litigation_PL.Litigation as Litigation_PL,
@ObjectModel.text.element: ['LitigationStatus_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LITIGATION_STATUS_PL', element: 'Id' } }]
LitigationStatusGrm,
_LitigationStatus_PL.Litigation_Status as LitigationStatus_PL,
ClaimLocation,
DateOfLoss,
AccidentDescription,
@ObjectModel.text.element: ['LossJurisdiction_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LOSS_JURISDICTION_PL', element: 'Id' } }]
LossJurisdiction,
_LossJurisdiction_PL.Loss_Jurisdiction as LossJurisdiction_PL,
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
@ObjectModel.text.element: ['MedicalTreat_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MEDICAL_TREATMENT_PL', element: 'Id' } }]
MedicalTreatmentOnboard,
_MedicalTreatment_PL.Medical_Treatment as MedicalTreat_PL,
VoidDate,
@ObjectModel.text.element: ['NatureInjury_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_NATURE_INJURY_PL', element: 'Id' } }]
Nature,
_NatureInjury_PL.Nature_Injury as NatureInjury_PL,
Occurrence,
OccurrenceType,
@ObjectModel.text.element: ['OCL_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_OCL_PL', element: 'Id' } }]
Ocl,
_OCL_PL.Ocl as OCL_PL,
@ObjectModel.text.element: ['OffsiteTreat_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_OFFSITE_TREATMENT_PL', element: 'Id' } }]
OffsiteMedicalTreatmentDel,
_OffsiteTreatment_PL.Offsite_Treatment as OffsiteTreat_PL,
PIClubNew,
PersonName,
PlannedRepairDate,
PolicyName,
PolicyYearNew,
PortSInvolved,
PermanentRepairCompleteDate,
@ObjectModel.text.element: ['Repatriation_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_REPATRIATION_PL', element: 'Id' } }]
VsaPartner,
_Repatriation_PL.Repatriation as Repatriation_PL,
@ObjectModel.text.element: ['Responsible_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_RESPONSIBLE_PC_PL', element: 'Id' } }]
ResponsiblePartyCode,
_ResponsiblePC_PL.Responsible as Responsible_PL,
@ObjectModel.text.element: ['Salvage_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SALVAGE_PL', element: 'Id' } }]
Salvage,
_Salvage_PL.Salvage as Salvage_PL,
@ObjectModel.text.element: ['SettleStatus_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SETTLEMENT_STATUS_PL', element: 'Id' } }]
SettlementStatus,
_SettlementStatus_PL.Settlement_Status as SettleStatus_PL,
PolicyExpirationDate,
SurveyDate,
Status,
StatusDetail,
Superintendent,
@ObjectModel.text.element: ['SurveyReport_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SURVEY_REPORT_PL', element: 'Id' } }]
SurveyReportYN,
_SurveyReport_PL.Survey_Report as SurveyReport_PL,
TimeBar,
TotalRepairCostRaw,
TotalRepairCostTotal,
@ObjectModel.text.element: ['TradeUnion_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_TRADE_UNION_PL', element: 'Id' } }]
TradeUnion,
_TradeUnion_PL.Trade_Union as TradeUnion_PL,
UnderwritersReserveTotal,
@ObjectModel.text.element: ['VesselDiversion_PL']
@UI.textArrangement: #TEXT_ONLY
@Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_VESSEL_DIVERSION_PL', element: 'Id' } }]
Probability,
_VesselDiversion_PL.Vessel_Diversion as VesselDiversion_PL,
Vessel,
Createdat,
Lastchangedby,
Lastchangedat,
_claim_trn : redirected to composition child ZC_GRC_CLAIMTXN_MARINE,
_Matrix
}
where ClaimRecType = '500046';
