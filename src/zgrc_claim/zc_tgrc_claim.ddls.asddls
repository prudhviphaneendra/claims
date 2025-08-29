@Metadata.allowExtensions: true
@EndUserText.label: 'Claim'
@AccessControl.authorizationCheck: #CHECK
//@ObjectModel.query.implementedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
define root view entity ZC_TGRC_CLAIM
  provider contract transactional_query
  as projection on ZR_TGRC_CLAIM
{
  key     ClaimUuid,

          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 0.8

          //   @ObjectModel.text.element: #(textClaimRecType)
          @ObjectModel.text.element:  ['ClaimRecType_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIM_RECTYPE_PL', element: 'Id' } }]
          ClaimRecType,
          _ClaimRecType_PL.Claim_RecType               as ClaimRecType_PL,

        
       

          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 0.8
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_PICKLIST', element: 'Value' } ,

          additionalBinding: [{ element: 'ListId' ,
                                   localConstant: '100023', usage: #FILTER }]
                                   , distinctValues: true
                                   }]
          ClaimExternalId,

         
          X2ndWitness,

          X3rdPartyClaimSubmittedTo,
          X3rdPartyClaimsReceivedTtl,
          X3rdPartyClaimsSettledTtl,
          @ObjectModel.text.element:  ['Property_Damage']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_3P_DAMAGE_PL', element: 'Id' } }]
          X3rdPartyPropertyDamage,
          _3PDAMAGE_PL.Party_Damage                    as Property_Damage,
          @ObjectModel.text.element:  ['Property_Liability']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_3P_LIABILITY_PL', element: 'Id' } }]
          X3rdPartyLiability,
          _3PLIABILITY_PL.Party_Liability              as Property_Liability,
          X3rdPartyRecoveriesUsd,
          X3rdRecoveryObtainedFormula,
          X3rdRecoveryObtainedz,
          X3rdRecoveryPursuedFormula,
          X3rdRecoveryPursuedz,
          PropetyType,
          @ObjectModel.text.element:  ['Threshold']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_THRESHOLD_PL', element: 'Id' } }]
          AboveClaimThreshold,
          _Threshold_PL.Threshold                      as Threshold,
          AboveDeductibleClaim,       
          @ObjectModel.text.element:  ['Accident_Type']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_ACCIDENT_TYPE_PL', element: 'Id' } }]
          AccidentType,
          _AccidentType_PL.Accident_Type               as Accident_Type,    
          @ObjectModel.text.element:  ['Activity_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_ACTIVITY_PL', element: 'Id' } }]
          Activity,
          _Activity_PL.Accident_Type                   as Activity_PL,
          AdjusterBranch,
          AdjusterClaim,
          AdjusterEmail,
          AdjusterName,
          AdjusterPhone,
          AgreedActions,
          DestinationCountry,
          AllegedClaimedUnitS,
          InjuryDescription,
          AmountReceived,
          AmountSubmitted,
          AreaIncidentOccurred,
          ArrivalDate,
          Asset,
          AssetCategory,
          AssetName,
          AssetNameSrc,
          AssetType,
          AverageWeeklyWage,
          BL,
          BLNumber,
          @ObjectModel.text.element:  ['BelowDeductible_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_BELOW_DEDUCTIBLE_PL', element: 'Id' } }]
          BelowDeductible,
          _BelowDeduct_PL.Below_Deductible             as BelowDeductible_PL,
          BelowDeductibleClaim,
          BillOfLadingNumber,
          DateClaimantBorn,
          @ObjectModel.text.element:  ['BodyPart_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_BODY_PART_PL', element: 'Id' } }]
          BodyPart,
          _BodyPart_PL.Body_part                       as BodyPart_PL,
          Brand,
          BrandCiClaims,
          BreakBulkType,
          @ObjectModel.text.element:  ['BUChargeable_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_BU_CHARGEABLE_PL', element: 'Id' } }]
          Chargeable,
          _BUChargeable_PL.BU_Chargeable               as BUChargeable_PL,
          BuClaimsHandler,
          @ObjectModel.text.element:  ['BusinessUnit_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_BUSINESS_UNIT_PL', element: 'Id' } }]
          BusinessUnit2,
          _BusinessUnit_PL.Business_Unit               as BusinessUnit_PL,
          BusinessUnit,
          CargoTypeCommodity,
          @ObjectModel.text.element:  ['Carrier_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CARRIER_PL', element: 'Id' } }]
          Carrier,
          _Carrier_PL.Carrier                          as Carrier_PL,
          CarrierBlNumber,
          CaseDesc,
          CasualtyYearNo,
          @ObjectModel.text.element:  ['Cause_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CAUSE_PL', element: 'Id' } }]
          Cause,
          _Cause_PL.Cause                              as Cause_PL,
          CauseSrc,
          CertificateNumber,
          @ObjectModel.text.element:  ['Charge_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CHARGE_NAME_PL', element: 'Id' } }]
          ChargeName,
          _ChargeName_PL.Charge_Name                   as Charge_PL,
          Chassis,
          ChassisOwner,
          @ObjectModel.text.element:  ['Circumstances_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CIRCUMSTANCES_PL', element: 'Id' } }]
          Circumstances,
          _Circumstances_PL.Circumstances              as Circumstances_PL,
          @ObjectModel.text.element:  ['Citation_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CITATION_TYPE_PL', element: 'Id' } }]
          CitationType,
          _CitationType_PL.Citation                    as Citation_PL,
          ClaimAge,
          ClaimAmount,
          ClaimAssetType,
          ConfirmedByTtClub,
          StatusCount,
          ClaimCountry,
          ClaimDescriptionMaerskDamco,
          ClaimKey,
          @ObjectModel.text.element:  ['ClaimNature_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIM_NATURE_PL', element: 'Id' } }]
          ClaimNature,
          _ClaimNature_PL.Claim_Nature                 as ClaimNature_PL,
          ClaimName,
          @ObjectModel.text.element:  ['ClaimConfirm_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIM_REPORT_PL', element: 'Id' } }]
          ClaimConfirmedByInsurer,
          _ClaimConfirm_PL.Claim_Confirmed             as ClaimConfirm_PL,
          ClaimLocation1,
          ClaimTurnaround,
          ClaimantAddressLine1,
          ClaimantAddressLine2,
          ClaimantAge,
          ClaimantCity,
          @ObjectModel.text.element:  ['ClaimCountry_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIMANT_COUNTRY_PL', element: 'Id' } }]
          ClaimantCountry,
          _ClaimCountry.Claimant_Country               as ClaimCountry_PL,
          ClaimantFirstName,
          @ObjectModel.text.element:  ['ClaimGender']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIMANT_GENDER_PL', element: 'Id' } }]
          ClaimantGender,
          _ClaimGender.Claimant_Gender                 as ClaimGender,
          ClaimantLastName,
          ClaimantLengthService,
          @ObjectModel.text.element:  ['ClaimMarital_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIMANT_MARITAL_PL'  , element: 'Id' } }]
          ClaimantMaritalStatus,
          _ClaimMarital_PL                             as ClaimMarital_PL,
          ClaimantMaritalStatusSrc,
          ClaimantMiddleInitial,
          ClaimantMinor,
          ClaimantName,
          ClaimantNameEntry,
          ClaimantPhone,
          ClaimantPostalCode,
          Reference,
          ClaimantSsn,
          @ObjectModel.text.element:  ['ClaimState']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIMANT_STATE_PL', element: 'Id' } }]
          ClaimantState,
          _ClaimantState_PL.Claimant_State             as ClaimState,
          ClaimantWorkPhone,
          ClaimantSReferenceNumber,
          ClaimedAmountUsd,
          ClaimingParty,
          ClientReportLag,
          @ObjectModel.text.element:  ['CloseType_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLOSE_TYPE_PL', element: 'Id' } }]
          CloseType,
          _CloseType_PL.Close_Type                     as CloseType_PL,
          Commodity,
          @ObjectModel.text.element:  ['CompensationAct_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_COMPENSATION_ACT_PL', element: 'Id' } }]
          CompensationAct,
          _CompensationAct_PL.Compensation_Act         as CompensationAct_PL,
          CompensationRate,
          CompensationTotal,
          @ObjectModel.text.element:  ['ConcurrentClaim_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CONCURRENT_CLAIM_PL', element: 'Id' } }]
          ConcurrentClaim,
          _ConcurrentClaim_PL.Concurrent_Claim         as ConcurrentClaim_PL,
          @ObjectModel.text.element:  ['ConditionClass_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CONDITION_CLASS_PL', element: 'Id' } }]
          ConditionOfClassImposed,
          _ConditionClass_PL.Condition_Class           as ConditionClass_PL,
          ContainerNumber,
          XContainerNumber,
          ContainerOwner,
          ContainerPosition,
          @ObjectModel.text.element:  ['ContainerSize_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CONTAINER_SIZE_PL', element: 'Id' } }]
          ContainerSize,
          _ContainerSize_PL.Container_Size             as ContainerSize_PL,
          @ObjectModel.text.element:  ['ContainerType_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CONTAINER_TYPE_PL', element: 'Id' } }]
          ContainerType,
          _ContainerType_PL.Container_Type             as ContainerType_PL,
          ContainersDamagedDestroyed,
          ContainersLostOverboard,
          @ObjectModel.text.element:  ['Contingent_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CONTINGENT_LIABILITY_PL', element: 'Id' } }]
          ContingentLiability,
          _ContingentLiability_PL.Contingent_Liability as Contingent_PL,
          ControllingCountry,
          ControllingEntity,
          ControllingRegion,
          @ObjectModel.text.element:  ['Controverted_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CONTROVERTED_CLAIM_PL', element: 'Id' } }]
          Controverted,
          _Controverted_PL.Controverted_Claim          as Controverted_PL,
          CountyFiled,
          @ObjectModel.text.element:  ['Court_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_COURT_PL', element: 'Id' } }]
          Court,
          _Court_PL.Court                              as Court_PL,
          CoverageMajor,
          CoverageMajorDescription,
          CoverageMinor,
          Createdb,
          CreatedDateSrcC,
          @ObjectModel.text.element:  ['CrewNationality_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CREW_NATIONALITY_PL', element: 'Id' } }]
          CrewNationality,
          _CrewNationality_PL.Crew_Nationality         as CrewNationality_PL,
          Nationality,
          @ObjectModel.text.element:  ['CrewRank_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CREW_RANK_PL', element: 'Id' } }]
          CrewRank,
          _CrewRank_PL.Crew_Rank                       as CrewRank_PL,
          CrossReference,
          CurrencyGrmUsd,
          @Semantics.currencyCode: true
          Currency,
          CurrencyLookup,
          Customer,
          @ObjectModel.text.element:  ['DAAppointed_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_DA_APPOINTED_PL', element: 'Id' } }]
          DaAppointed,
          _DA_Appointed_PL.DA_Appointed                as DAAppointed_PL,
          DaAppointedDate,
          DaEmail,
          @ObjectModel.text.element:  ['DAFirm_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_DA_FIRM_PL', element: 'Id' } }]
          DaFirmName,
          _DA_Firm_PL.DA_Firm                          as DAFirm_PL,
          DaHourlyRate,
          DaName,
          DaPhone,
          @ObjectModel.text.element:  ['Damage_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_DAMAGE_PL', element: 'Id' } }]
          Damage,
          _DA_Damage_PL.Damage                         as Damage_PL,
          @ObjectModel.text.element:  ['DamageCaused_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_3P_CAUSED_DAMAGE_PL', element: 'Id' } }]
          DamageCausedBy3rdParty,
          _3PCAUSED_DAMAGE_PL.Caused_Damage            as DamageCaused_PL,
          DamageEstimate,
          DateClaimantDied,
          DateClosed,
          DateDataLoadInsert,
          DateDataLoadUpdate,
          DateHired,
          DateIndemnityReceived,
          DateLastWorked,
          DateLossOfTime,
          DtOfClaimReportToInsurer,
          DtOfClaimReportToMskdamco,
          DateOfLastActivity,
          DateOfSurvey,
          DateOfTimeBar3rdParty,
          DateOfTimeBarClaimant,
          DateOpened,
          DateReceived,
          DateReopened,
          ReportedToInsurer,
          DateReportedToTpa,
          DateReturnedToWork,
          DtRiskMgmtReviewComplete,
          SettlementDate,
          DateSubmitted,
          DateSubmittedToInsurer,
          DateSubrogationSubmitted,
          DateSuitFiled,
          DayOfWeek,
          DayOfWeekSrc,
          DaysOffWorkTotal,
          DaysToConversion,
          DaysToDecision,
          DaysToReply,
          @ObjectModel.text.element:  ['DCLIEmployee_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_DCLI_EMPLOYEE_PL', element: 'Id' } }]
          DcliEmployee,
          _DCLI_Employee_PL.DCLI_Employee              as DCLIEmployee_PL,
          DecisionMade,
          Deductible,
          DeductibleFromPolicy,
          DeductibleTotal,
          DeferredRepairs,
          DemandAmount,
          Department,
          DescribeMedicalTreatment,
          @ObjectModel.text.element:  ['Description_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_DESCRIPTION_PL', element: 'Id' } }]
          Description,
          _Description_PL.Description                  as Description_PL,
          DescriptionOfEvent,
          Diagnosis,
          DateOfFirstDisability,
          LocationGrm,
          @ObjectModel.text.element:  ['UsualWork_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_USUAL_WORK_PL', element: 'Id' } }]
          DoingUsualWork,
          _UsualWork_PL.Usual_Work                     as UsualWork_PL,
          DriverAddress,
          DriverBirthDate,
          DriverCity,
          DriverName,
          DriverPhone,
          DriverPostalCode,
          DriverSs,
          @ObjectModel.text.element:  ['DriverState_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_DRIVER_STATE_PL', element: 'Id' } }]
          DriverState,
          _DriverState_PL.Driver_State                 as DriverState_PL,
          DriversAge,
          OriginCountry,
          @ObjectModel.text.element:  ['EligibleBenefits_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_ELIGIBLE_BENEFITS_PL', element: 'Id' } }]
          SettlingAbvLglliabilityAmt,
          _EligibleBenefits_PL.Eligible_Benefits       as EligibleBenefits_PL,
          EmployeeJobTitle,
          @ObjectModel.text.element:  ['EmployerPremises_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_EMPLOYER_PREMISES_PL', element: 'Id' } }]
          EmployerPremises,
          _EmployerPremises_PL.Employer_Premises       as EmployerPremises_PL,
          EquipmentId,
          EquipmentOperator,
          @ObjectModel.text.element:  ['EquipmentType_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_EQUIPMENT_TYPE_PL', element: 'Id' } }]
          EquipmentType,
          _EquipmentType_PL.Equipment_Type             as EquipmentType_PL,
          EquipmentInfrastructureType,
          EstimateTotalFormula,
          EstimateTotal,
          @ObjectModel.text.element:  ['EventType_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_EVENT_TYPE_PL', element: 'Id' } }]
          EventType,
          _EventType_PL.Event_Type                     as EventType_PL,
          ExactLocation,
          @ObjectModel.text.element:  ['Expectaion_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_EXPECTATION_PL', element: 'Id' } }]
          ExptForTtClubToConfirm,
          _Expectation_PL.Expectation                  as Expectaion_PL,
          ExpectedSettlementAmountUsd,
          ExpenseIncurredCurr2,
          ExpenseIncurredCurr1,
          ExpenseOutstandingCurr2,
          ExpenseOutstandingCurr1,
          ExpensePaidCurr2,
          ExpensePaidCurr1,
          ExpertInvolved,
          ExpirationDate,
          FCode,
          @ObjectModel.text.element:  ['Fatality_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_FATALITY_PL', element: 'Id' } }]
          Fatality,
          _Fatality_PL.Fatality                        as Fatality_PL,
          FcrNumber,
          FederalCourt,
          FeesOutstandingTotal,
          FeesPaidTotal,
          FileLocation,
          @ObjectModel.text.element:  ['PlaceReceipt_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PLACE_RECEIPT_PL', element: 'Id' } }]
          Port,
          _Place_Receipt_PL.Place_Receipt              as PlaceReceipt_PL,
          FinalSettlementTargetDate,
          FitForDutyDate,
          @ObjectModel.text.element:  ['FitnessDuty_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_FITNESS_DUTY_PL', element: 'Id' } }]
          FitnessForDuty,
          _FitnessDuty_PL.Fitness_Duty                 as FitnessDuty_PL,
          Flag,
          @ObjectModel.text.element:  ['FleetMangaer_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_FLEET_MANAGER_PL', element: 'Id' } }]
          FleetGroup,
          _FleetManager_PL.Fleet_Manager               as FleetMangaer_PL,
          FormerAdjusterClaim,
          Gap,
          GensetNumber,
          @ObjectModel.text.element:  ['GLBCLMOwner_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GLBCLM_OWNER_PL', element: 'Id' } }]
          GlbclmOwner,
          _GLBMOwner_PL.GLBCLM_Owner                   as GLBCLMOwner_PL,
          GrmClaimsHandler,
          GrossIncurredCurr2,
          GrossIncurredCurr1,
          GrossOutstandingCurr2,
          GrossOutstandingCurr1,
          GrossPaidCurr2,
          GrossPaidCurr1,
          GrossRegisteredTonnage,
          HandlerBu,
          HandlerSrcDel,
          HandlingCountry,
          HandlingEntity,
          HandlingRegion,
          HealthcareFacilityAddrline1,
          HealthcareFacilityAddrline2,
          HealthcareFacilityCity,
          HealthcareFacilityName,
          HealthcareFacilityPostalcode,
          @ObjectModel.text.element:  ['HealthState_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_HEALTHCARE_STATE_PL', element: 'Id' } }]
          HealthcareFacilityState,
          _HealthState_PL.HealthCare_State             as HealthState_PL,
          HierarchyNodeAp,
          HighwayDirection,
          @ObjectModel.text.element:  ['Overnight_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_HOSPITALIZED_OVERNIGHT_PL', element: 'Id' } }]
          HospitalizedOvernight,
          _HospitalOVernight_PL.Hospitalized           as Overnight_PL,
          @ObjectModel.text.element:  ['HSCode_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_HS_CODE_PL', element: 'Id' } }]
          HsCode,
          _HSCode_PL.HS_Code                           as HSCode_PL,
          @ObjectModel.text.element:  ['HSSELearning_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_HSSE_LEARNING_PL', element: 'Id' } }]
          HsseLearningPacks,
          _HSSELearning_PL.HSSE_Learning               as HSSELearning_PL,
          ImoNumber,
          @ObjectModel.text.element:  ['InLitigation_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_IN_LITIGATION_PL', element: 'Id' } }]
          InLitigation,
          _InLitigation_PL.In_Litigation               as InLitigation_PL,
          IncidentMonth,
          IncidentQuarter,
          BuClaim,
          IncidentToClaimDate,
          IncidentYear,
          IndemnityIncurredCurr2,
          IndemnityIncurredCurr1,
          IndemnityOutstandingCurr2,
          IndemnityOutstandingCurr1,
          IndemnityPaidCurr2,
          IndemnityPaidCurr1,
          InfrastructureDesc,
          InitialEstimate,
          @ObjectModel.text.element:  ['Injured_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_INJURED_PL', element: 'Id' } }]
          Injured,
          _Injured_PL.Injured                          as Injured_PL,
          @ObjectModel.text.element:  ['InjuryDeath_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_INJURY_CAUSE_DEATH_PL', element: 'Id' } }]
          InjuryCauseDeath,
          _InjuryDeath_PL.Injured_Cause                as InjuryDeath_PL,
          @ObjectModel.text.element:  ['InjuryType_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_INJURY_TYPE_PL', element: 'Id' } }]
          InjuryType,
          _InjuryType_PL.Injured_Type                  as InjuryType_PL,
          @ObjectModel.text.element:  ['InsurenceCarrier_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_INSURANCE_CARRIER_PL', element: 'Id' } }]
          TpaCarrier,
          _InsuranceCarrier_PL                         as InsurenceCarrier_PL,
          @ObjectModel.text.element:  ['InsuredSurvey_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_INSURANCE_SURVEY_PL', element: 'Id' } }]
          InsuranceSurvey,
          _InsuranceSurvey_PL.Insurance_Survey         as InsuredSurvey_PL,
          InsuranceSurveyDt,
          InsuredName,
          Insurer,
          InsurerClaim,
          InsurerProvisionUsdDamco,
          InsurerReferenceNumber,
          InvoiceNumberSap,
          IpsCenterProvisionCurrency,
          IpsCenterProvisionUsdDamco,
          IpsCenterProvisionUsd,
          LastCloseDate,
          LastSubmitDate,
          LegalLiabilityAmountUsd,
          //                    @ObjectModel.text.element:  ['LegalStatus_PL']
          //          @UI.textArrangement: #TEXT_ONLY
          //          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LEGAL_STATUS_PL', element: 'Id' } }]
          //          LegalStatusPicklist,
          //          _LegalStatus_PL.Legal_Status as LegalStatus_PL,
          @ObjectModel.text.element:  ['LightCond_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LIGHT_CONDITIONS_PL', element: 'Id' } }]
          LightConditions,
          _LightConditions_PL.Light_Conditions         as LightCond_PL,
          LimitationFund,
          LimitationFundCurrency,
          @ObjectModel.text.element:  ['Litigation_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LITIGATION_PL', element: 'Id' } }]
          Litigation,
          _Litigation_PL.Litigation                    as Litigation_PL,
          @ObjectModel.text.element:  ['LitigationStatus_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LITIGATION_STATUS_PL', element: 'Id' } }]
          LitigationStatusGrm,
          _LitigationStatus_PL.Litigation_Status       as LitigationStatus_PL,
          @ObjectModel.text.element:  ['LegalStatus_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LEGAL_STATUS_PL', element: 'Id' } }]
          LegalStatus,
          _LegalStatus_PL.Legal_Status                 as LegalStatus_PL,
          LossJuristiction,
          LocalProvisionDamco,
          LocalProvisionCurrency,
          HierarchyNode,
          ClaimLocation,
          LocationLookup,
          LocationName,
          LocationSubBusinessUnit,
          @ObjectModel.text.element:  ['LongTerm_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LONG_TERM_PL', element: 'Id' } }]
          LongTerm,
          _LongTerm_PL.Long_Term                       as LongTerm_PL,
          AccidentAddressLine2,
          AccidentAddressLine1,
          AccidentCity,
          @ObjectModel.text.element:  ['LossCountry_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LOSS_COUNTRY_PL', element: 'Id' } }]
          LossCountry,
          _LossCountry_PL.Loss_Country                 as LossCountry_PL,
          AccidentCountry,
          DateOfLoss,
          AccidentDescription,
          @ObjectModel.text.element:  ['LossJurisdiction_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LOSS_JURISDICTION_PL', element: 'Id' } }]
          LossJurisdiction,
          _LossJurisdiction_PL.Loss_Jurisdiction       as LossJurisdiction_PL,
          AccidentPostalCode,
          @ObjectModel.text.element:  ['LossState_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LOSS_STATE_PROVINCE_PL', element: 'Id' } }]
          AccidentState,
          _LossState_PL.Loss_State_Province            as LossState_PL,
          LostDays,
          @ObjectModel.text.element:  ['LostTime_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LOST_TIME_INDICATOR_PL', element: 'Id' } }]
          LostTimeIndicator,
          _LostTime_PL.Loss_Time_Indicator             as LostTime_PL,
          LostWagesEarningCapacity,
          LouSecurityAmount,
          LouSecurityCurrency,
          @ObjectModel.text.element:  ['MaerskComp_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MAERSK_COMPANY_PL', element: 'Id' } }]
          MaerskCompany,
          _MaerskComp_PL.Maersk_Company                as MaerskComp_PL,
          MaerskDamcoBlNumber,
          @ObjectModel.text.element:  ['MainActivity_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MAIN_ACTIVITY_PL', element: 'Id' } }]
          MainActivity,
          _MainActivity_PL.Main_Activity               as MainActivity_PL,
          @ObjectModel.text.element:  ['MainCasuality_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MAIN_CASUALTY_PL', element: 'Id' } }]
          MainCasualty,
          _MainCasualty_PL.Main_Casualty               as MainCasuality_PL,
          @ObjectModel.text.element:  ['MainCause_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MAIN_CAUSE_PL', element: 'Id' } }]
          MainCause,
          _MainCause_PL.Main_Cause                     as MainCause_PL,
          @ObjectModel.text.element:  ['MainEvent_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MAIN_EVENT_PL', element: 'Id' } }]
          MainEvent,
          _MainEvent_PL.Main_Event                     as MainEvent_PL,
          StarsDeductible,
          MediationDate,
          MedicalBiIncurred,
          MedicalBiPaid,
          MedicalIncurredCurr2,
          MedicalIncurredCurr1,
          MedicalOutstandingCurr2,
          MedicalOutstandingCurr1,
          MedicalPaidCurr2,
          MedicalPaidCurr1,
          @ObjectModel.text.element:  ['MedicalTreat_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MEDICAL_TREATMENT_PL', element: 'Id' } }]
          MedicalTreatmentOnboard,
          _MedicalTreatment_PL.Medical_Treatment       as MedicalTreat_PL,
          @ObjectModel.text.element:  ['MedicareLien_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MEDICARE_LIEN_PL', element: 'Id' } }]
          MedicareLien,
          _MedicareLien_PL                             as MedicareLien_PL,
          @ObjectModel.text.element:  ['MedicareReport_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MEDICARE_REPORT_PL', element: 'Id' } }]
          MedicareReportable,
          _MedicareReport_PL.Medicare_Report           as MedicareReport_PL,
          @ObjectModel.text.element:  ['MescEmployee_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MESC_EMPLOYEE_PL', element: 'Id' } }]
          MescEmployee,
          _MescEmployee_PL.Medicare_Report             as MescEmployee_PL,
          MiasShare,
          MiasShareManual,
          VoidDate,
          ModeOfTransport,
          NameOfWatercraft,
          NameTitleReportedTo,
          @ObjectModel.text.element:  ['NatureInjury_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_NATURE_INJURY_PL', element: 'Id' } }]
          Nature,
          _NatureInjury_PL.Nature_Injury               as NatureInjury_PL,
          NearestLandmark,
          NetIncurredCurr2,
          NetIncurredCurr1,
          NetOutstandingCurr2,
          NetOutstandingCurr1,
          NetPaidCurr2,
          NetPaidCurr1,
          NetRetention,
          NetRtntEur,
          NetRtntUsd,
          @ObjectModel.text.element:  ['DisabilityPeriod_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_DISABILITY_PERIOD_PL', element: 'Id' } }]
          NewDisabilityPeriod,
          _DisabilityPeriod_PL.Disability_Period       as DisabilityPeriod_PL,
          NotifiedDate,
          @ObjectModel.text.element:  ['Occupation_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_OCCUPATION_PL', element: 'Id' } }]
          Occupation,
          _Occupation_PL.Occupation                    as Occupation_PL,
          Occurrence,
          OccurrenceNumber,
          OccurrenceType,
          @ObjectModel.text.element:  ['OCL_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_OCL_PL', element: 'Id' } }]
          Ocl,
          _OCL_PL.Ocl                                  as OCL_PL,
          @ObjectModel.text.element:  ['OclClaim_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_OCU_CLAIM_PL', element: 'Id' } }]
          OcuClaim,
          _OCU_Claim_PL.Ocl_Claim                      as OclClaim_PL,


          OffBsCentreCurrency,


          OffBsCountriesCurrency,



          @ObjectModel.text.element:  ['OffsiteTreat_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_OFFSITE_TREATMENT_PL', element: 'Id' } }]
          OffsiteMedicalTreatmentDel,

          _OffsiteTreatment_PL.Offsite_Treatment       as OffsiteTreat_PL,


          OldDamcoReferenceNumber,



          @ObjectModel.text.element:  ['OSHARecord_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_OSHA_RECORDABLE_PL', element: 'Id' } }]
          OshaRecordable,
          _OSHARecord_PL.OSHA_Recordable               as OSHARecord_PL,


          OtherCarriers,

          @ObjectModel.text.element:  ['OtherVehicles_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_OTHER_VEHICLES_PL', element: 'Id' } }]
          OtherVehicles,
          _OtherVehicles_PL.Other_Vehicles             as OtherVehicles_PL,

          Owcp,


          PIAad,



          PIClubNew,




          @ObjectModel.text.element:  ['PIClub_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PI_CLUB_PL', element: 'Id' } }]
          PIClubNames,
          _PIClub_PL.PI_Club                           as PIClub_PL,


          @ObjectModel.text.element:  ['PaAppointed_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PA_APPOINTED_PL', element: 'Id' } }]
          PaAppointed,

          _PA_Appointed_PL.PA_Appointed                as PaAppointed_PL,

        
        
          PaAppointedDate,
         


          PaEmail,



          PaFirmName,



          PaName,




          PaPhone,



          SettledLegalCost,



          PaidSettledLegalCostsUsd,



          PaidSettledAmountUsd,



          @ObjectModel.text.element:  ['PartGeneral_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PART_GENERAL_PL', element: 'Id' } }]
          PartGeneralDelDel,

          _PartGeneral_PL.Part_General                 as PartGeneral_PL,


          @ObjectModel.text.element:  ['PermanentRepairs_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PERMANENT_REPAIRS_PL', element: 'Id' } }]
          PermanentRepairs,
          _PermanentRepairs_PL.Permanent_Repairs       as PermanentRepairs_PL,


          PersonName,



          @ObjectModel.text.element:  ['PhysicalFile_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PHYSICAL_FILE_PL', element: 'Id' } }]
          PhysicalFile,
          _PhysicalFile_PL.Physical_File               as PhysicalFile_PL,


          PhysicianName,



          PlannedRepairDate,



          PoliceDeptName,



          PoliceReport,



          PolicyEffectiveDate,



          PolicyExpirationDateDel,


          PolicyName,



          PolicyLookup,



          PolicyNumberNew,



          PolicyNumber,


          PolicySectionLookup,



          PolicyYearNew,


          PolicyYear,



          FinalDestination,



          PortOfDischarge,



          PortOfOrigin,



          PortOfLoading,



          PortOfReceipt,


          PermanentPortOfRepair,



          TemporaryPortOfRepair,



          PortSInvolved,


          @ObjectModel.text.element:  ['Preventable_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PREVENTABLE_PL', element: 'Id' } }]
          Preventable,
          _Preventable_PL.Preventable                  as Preventable_PL,


          PropertyLookup,



          Recommendation,



          RecommendationComments,



          RecordTypeCustom,


          RecoveryFrom3rdPartyCurr2,



          RecoveryFrom3rdPartyCurr1,



          RecoveryReceived,


          RecoveryFromInsuranceCurr2,



          RecoveryFromInsuranceCurr1,



          RecoveryOwner,



          @ObjectModel.text.element:  ['RecoveryPursued_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_RECOVERY_PURSUED_PL', element: 'Id' } }]
          RecoveryPursued,
          _RecoveryPursued_PL.Recovery_Pursued         as RecoveryPursued_PL,



          @ObjectModel.text.element:  ['RecoveryStatus_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_RECOVERY_STATUS_PL', element: 'Id' } }]
          RecoveryStatus,
          _RecoveryStatus_PL.Recovery_Status           as RecoveryStatus_PL,


          @ObjectModel.text.element:  ['RedFlag_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_RED_FLAG_PL', element: 'Id' } }]
          RedFlag,
          _RedFlag_PL.Red_Flag                         as RedFlag_PL,

          RegionSrc,
          PermanentRepairCompleteDate,
          TemporaryRepairCompleteDate,
          PermanentRepairDescription,
          TemporaryRepairDescription,
          PermanentRepairStartDate,
          TemporaryRepairStartDate,


          @ObjectModel.text.element:  ['PortRepairs_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PORT_REPAIRS_PL', element: 'Id' } }]
          RepairsCompletedInPort,
          _PortRepairs_PL.Port_Repairs                 as PortRepairs_PL,


          @ObjectModel.text.element:  ['Repatriation_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_REPATRIATION_PL', element: 'Id' } }]
          VsaPartner,
          _Repatriation_PL.Repatriation                as Repatriation_PL,


          ReplyDate,



          DateReportedToClient,



          ReportedToBroker,



          ReportingDepartment,



          ResponseDate,



          X3rdPartyName,



          @ObjectModel.text.element:  ['Responsible3PC_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_RESPONSIBLE_3PC_PL', element: 'Id' } }]
          Responsible3rdPartyCode,
          _Responsible3PC_PL.Responsible               as Responsible3PC_PL,


          @ObjectModel.text.element:  ['Responsible_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_RESPONSIBLE_PC_PL', element: 'Id' } }]
          ResponsiblePartyCode,
          _ResponsiblePC_PL.Responsible                as Responsible_PL,


          RestrictedDays,


          RetainedEarningCapacity,



          @ObjectModel.text.element:  ['RootCause_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_ROOT_CAUSE_PL', element: 'Id' } }]
          RootCause,
          _RootCause_PL.Root_Cause                     as RootCause_PL,



          @ObjectModel.text.element:  ['RouteCause_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_ROUTE_CODE_PL', element: 'Id' } }]
          ZzzCauseCode,
          _RootCause_PL.Root_Cause                     as RouteCause_PL,


          @ObjectModel.text.element:  ['Salvage_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SALVAGE_PL', element: 'Id' } }]
          Salvage,
          _Salvage_PL.Salvage                          as Salvage_PL,



          Savings,



          Seal,



          ServedDate,



          SettlementAmount,



          @ObjectModel.text.element:  ['SettleStatus_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SETTLEMENT_STATUS_PL', element: 'Id' } }]
          SettlementStatus,
          _SettlementStatus_PL.Settlement_Status       as SettleStatus_PL,


          @ObjectModel.text.element:  ['Severity_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SEVERITY_PL', element: 'Id' } }]
          Severity,
          _Severity_PL.Severity                        as Severity_PL,


          ShippersInstructions,


          Shift,



          PolicyExpirationDate,


          SurveyDate,



          PropertyType,



          @ObjectModel.text.element:  ['SourceGen_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SOURCE_GENERAL_PL', element: 'Id' } }]
          SourceGeneralDel,
          _SourceGeneral_PL.Source_General             as SourceGen_PL,


          @ObjectModel.text.element:  ['Specification_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SPECIFICATION_PL', element: 'Id' } }]
          Specification,
          _Specification_PL.Specification              as Specification_PL,


          @ObjectModel.text.element:  ['StateFiled_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_STATE_FILED_PL', element: 'Id' } }]
          StateFiled,
          _StateFiled_PL.State_Filed                   as StateFiled_PL,


          @ObjectModel.text.element:  ['StateFund_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_STATE_FUND_RECOV_PL', element: 'Id' } }]
          StateFundRecovIndicatorDel,
          _StateFundRecov_PL.State_Fund_Recovery       as StateFund_PL,


          @ObjectModel.text.element:  ['StateEmployment_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_STATE_EMPLOYMENT_PL', element: 'Id' } }]
          StateOfEmploymentDel,
          _StateEmployment_PL.State_Employment         as StateEmployment_PL,


          @ObjectModel.text.element:  ['StateJurisdiction_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_STATE_JURISDICTION_PL', element: 'Id' } }]
          StateOfJurisdiction,
          _StateJurisdiction_PL.State_Jurisdiction     as StateJurisdiction_PL,



          Status,


          StatusClosedCount,

          StatusDetail,


          StatusOpenCount,



          @ObjectModel.text.element:  ['SubType_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SUB_TYPE_PL', element: 'Id' } }]
          SubType,
          _SubType_PL.Sub_Type                         as SubType_PL,
      _SubmitTPA_PL.Submit_TPA                     as SubmitTPA_PL,


          @ObjectModel.text.element:  ['SubmitTPA_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SUBMIT_TPA_PL', element: 'Id' } }]
          SubmitToTpa,
         
         



          @ObjectModel.text.element:  ['SubmitReimburse_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SUBMIT_REIMBURSE_PL', element: 'Id' } }]
          SubmittedForReimb,
          _SubmitReimburse_PL.Submit_Reimburse         as SubmitReimburse_PL,


          @ObjectModel.text.element:  ['Submit3P_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SUBMIT_3P_PL', element: 'Id' } }]
          SubmittedTo3rdParty,
          _Submit3P_PL.Submit_3P                       as Submit3P_PL,


          @ObjectModel.text.element:  ['Subrogation_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SUBROGATION_PL', element: 'Id' } }]
          SubrogationGrm,
          _Subrogation_PL.Subrogation                  as Subrogation_PL,


          Subrogation,



          SubrogationAmountReceived,



          SubrogationAmountSubmitted,



          @ObjectModel.text.element:  ['SubrogationInd_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SUBROGATION_IND_PL', element: 'Id' } }]
          SubrogationIndicatorDel,
          _SubrogationInd_PL.Subrogation_Indicator     as SubrogationInd_PL,


          SubrogationSubmittedTo,



          SuitFiledDate,

          Superintendent,



          SupervisorName,



          @ObjectModel.text.element:  ['SurveyReport_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SURVEY_REPORT_PL', element: 'Id' } }]
          SurveyReportYN,
          _SurveyReport_PL.Survey_Report               as SurveyReport_PL,


          @ObjectModel.text.element:  ['SurveyRequest_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SURVEY_REQUEST_PL', element: 'Id' } }]
          SurveyRequested,
          _SurveyRequest_PL.Survey_Request             as SurveyRequest_PL,
          //SurveyedAt,


          SurveyorName,



          TakeoverIndicator,



          @ObjectModel.text.element:  ['TempRepairs_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_TEMPORARY_REPAIRS_PL', element: 'Id' } }]
          TemporaryRepairs,

          _Temp_Repairs_PL.Temporary_Request           as TempRepairs_PL,
          //TerminalsLoad,


          ThirdPartyInsuranceCoDel,



          ThirdPartyPolicyNumberDel,



          TimbarDateSubrogation,



          TimeBar,



          AccidentTime,



          TimebarDateCDel,



          TimebarDateApmmVsInsurance,



          TimebarDateClaimantVsApmm,



          TimebarDateSubrogation,



          TotalDeductible,



          TotalDeductibleCurr2,


          TotalDeductibleCurr1,



          TtlNoDamageBoxesPkgWeig,



          TotalMiasShare,



          TotalRepairCostDel,



          TotalRepairCostRaw,



          TotalRepairCostTotal,



          TpaCarrierAccountCode,


          TpaCarrierLookupDel,



          TpaDate,



          TpaPaid,



          TpaReportLag,



          TpaReserve,



          @ObjectModel.text.element:  ['TradeUnion_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_TRADE_UNION_PL', element: 'Id' } }]
          TradeUnion,
          _TradeUnion_PL.Trade_Union                   as TradeUnion_PL,


          @ObjectModel.text.element:  ['EmergencyRoom_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_EMERGENCY_ROOM_PL', element: 'Id' } }]
          TreatedInEmergencyRoomDel,
          _EmergencyRoom_PL.Emergency_Room             as EmergencyRoom_PL,


          TrialDate,



          TruckingCompanyAddress,



          TruckingCompanyCity,



          TruckingCompanyContact,



          TruckingCompanyName,



          TruckingCompanyPhone,



          TruckingCompanyZip,



          @ObjectModel.text.element:  ['TruckState_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_TRUCKING_CO_STATE_PL', element: 'Id' } }]
          TruckingCompanyState,
          _TruckingState_PL.Trucking_Co_State          as TruckState_PL,


          @ObjectModel.text.element:  ['PropertyDamage_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PROPERTY_DAMAGED_PL', element: 'Id' } }]
          TypeOfPropertyDamaged,
          _PropertyDamaged_PL.Property_Damaged         as PropertyDamage_PL,


          TypeOfWatercraftDamaged,



          UnderwritersReserveTotal,



          @ObjectModel.text.element:  ['Uninsured_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_UNINSURED_PL', element: 'Id' } }]
          UninsuredUnderinsured,
          _Uninsured_PL.Uninsured                      as Uninsured_PL,


          VehicleInspectionDate,



          VehicleLeaseDateDel,


          @ObjectModel.text.element:  ['VehicleLeased_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_VEHICLE_LEASED_PL', element: 'Id' } }]
          VehicleLeased,
          _VehicleLeased_PL.Vehicle_Leased             as VehicleLeased_PL,



          VehicleMake,



          ClaimantVehicleMake,



          VehicleModel,



          ClaimantVehicleModel,



          VehicleOwner,



          VehicleOwnerName,



          VehicleYear,



          ClaimantVehicleYear,



          @ObjectModel.text.element:  ['VesselDiversion_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_VESSEL_DIVERSION_PL', element: 'Id' } }]
          Probability,
          _VesselDiversion_PL.Vessel_Diversion         as VesselDiversion_PL,


          Vessel,


          VesselName,



          @ObjectModel.text.element:  ['VesselOperator_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_VESSEL_OPERATOR_PL', element: 'Id' } }]

          VesselOperator,
          _VesselOperator_PL.Vessel_Operator           as VesselOperator_PL,



          VesselOwnerName,



          VesselAircraft,


          Voyage,




          VoyageNumber,
          @ObjectModel.text.element:  ['Weather_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_WEATHER_PL', element: 'Id' } }]

          Weather,
          _Weather_PL.Weather                          as Weather_PL,
          WeeklyWages,
          WhoOwnsProperty,
          @ObjectModel.text.element:  ['WorkRelated_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_WORK_RELATED_PL', element: 'Id' } }]

          WorkRelatedDel,
          _WorkRelated_PL.Work_Related                 as WorkRelated_PL,
          WorkRestrictionsDel,
          YearOfLoss,
          YearlyWagesDel,
          Createdby,
          Createdat,
          Lastchangedby,
          Lastchangedat,
          _claim_trn : redirected to composition child ZC_TGRC_CLAIM_TRN,
          _3PDAMAGE_PL,
          _3PLIABILITY_PL,
          _Threshold_PL,
          _AccidentType_PL,
          _Activity_PL,
          _Alcohol_PL,
          _BelowDeduct_PL,
          _BodyPart_PL,
          _BUChargeable_PL,
          _BusinessUnit_PL,
          _Carrier_PL,
          _Cause_PL,
          _ChargeName_PL,
          _Circumstances_PL,
          _CitationType_PL,
          _ClaimConfirm_PL,
          _ClaimNature_PL,
          _ClaimReport_PL,
          _ClaimCountry,
          _ClaimGender,
          _ClaimMarital_PL,
          _ClaimantState_PL,
          _CloseType_PL,
          _CompensationAct_PL,
          _ConcurrentClaim_PL,
          _ConditionClass_PL,
          _ContainerSize_PL,
          _ContainerType_PL,
          _ContingentLiability_PL,
          _Controverted_PL,
          _Court_PL,
          _CrewNationality_PL,
          _CrewRank_PL,
          _DA_Appointed_PL,
          _DA_Firm_PL,
          _DA_Damage_PL,
          _3PCAUSED_DAMAGE_PL,
          _DCLI_Employee_PL,
          _Description_PL,
          _UsualWork_PL,
          _DriverState_PL,
          _EligibleBenefits_PL,
          _EmployerPremises_PL,
          _EquipmentType_PL,
          _EventType_PL,
          _Expectation_PL,
          _Fatality_PL,
          _Place_Receipt_PL,
          _FitnessDuty_PL,
          _FleetManager_PL,
          _GLBMOwner_PL,
          _HealthState_PL,
          _HospitalOVernight_PL,
          _HSCode_PL,
          _HSSELearning_PL,
          _InLitigation_PL,
          _Injured_PL,
          _InjuryDeath_PL,
          _InjuryType_PL,
          _InsuranceCarrier_PL,
          _InsuranceSurvey_PL,
          _LegalStatus_PL,
          _LightConditions_PL,
          _Litigation_PL,
          _LitigationStatus_PL,
          _LongTerm_PL,
          _LossCountry_PL,
          _LossJurisdiction_PL,
          _LossState_PL,
          _LostTime_PL,
          _MaerskComp_PL,
          _MainActivity_PL,
          _MainCasualty_PL,
          _MainCause_PL,
          _MainEvent_PL,
          _MedicalTreatment_PL,
          _MedicareLien_PL,
          _MedicareReport_PL,
          _MescEmployee_PL,
          _NatureInjury_PL,
          _DisabilityPeriod_PL,
          _Occupation_PL,
          _OCL_PL,
          _OCU_Claim_PL,
          _OffsiteTreatment_PL,
          _OSHARecord_PL,
          _OtherVehicles_PL,
          _PIClub_PL,
          _PA_Appointed_PL,
          _PartGeneral_PL,
          _PermanentRepairs_PL,
          _PhysicalFile_PL,
          _Preventable_PL,
          _RecoveryPursued_PL,
          _RecoveryStatus_PL,
          _RedFlag_PL,
          _PortRepairs_PL,
          _Repatriation_PL,
          _Responsible3PC_PL,
          _ResponsiblePC_PL,
          _RootCause_PL,
          _RouteCode_PL,
          _Salvage_PL,
          _SettlementStatus_PL,
          _Severity_PL,
          _SourceGeneral_PL,
          _Specification_PL,
          _StateFiled_PL,
          _StateFundRecov_PL,
          _StateEmployment_PL,
          _StateJurisdiction_PL,
          _SubType_PL,
          _SubmitTPA_PL,
          _SubmitReimburse_PL,
          _Submit3P_PL,
          _Subrogation_PL,
          _SubrogationInd_PL,
          _SurveyReport_PL,
          _SurveyRequest_PL,
          _Temp_Repairs_PL,
          _TradeUnion_PL,
          _EmergencyRoom_PL,
          _TruckingState_PL,
          _PropertyDamaged_PL,
          _Uninsured_PL,
          _VehicleLeased_PL,
          _VesselDiversion_PL,
          _VesselOperator_PL,
          _Weather_PL,
          _WorkRelated_PL,
          _ClaimRecType_PL


}
