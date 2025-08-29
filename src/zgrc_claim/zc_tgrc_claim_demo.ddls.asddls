@Metadata.allowExtensions: true
@EndUserText.label: 'Claim'
@AccessControl.authorizationCheck: #CHECK
//@ObjectModel.query.implementedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
define root view entity ZC_TGRC_CLAIM_DEMO
  provider contract transactional_query
  as projection on ZR_TGRC_CLAIM
{
  key     ClaimUuid,

          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 0.8

          @ObjectModel.text.element:  ['ClaimRecType_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIM_RECTYPE_PL', element: 'Id' } }]
          ClaimRecType,
          _ClaimRecType_PL.Claim_RecType               as ClaimRecType_PL,

          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
          @Search.defaultSearchElement: true
          @Search.fuzzinessThreshold: 0.8
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GRC_PICKLIST', element: 'Value' } ,

          additionalBinding: [{ element: 'ListId' ,
                                   localConstant: '100023', usage: #FILTER }]
                                   , distinctValues: true
                                   }]
          ClaimExternalId,

//          @UI.hidden :#(HideX2ndWitness)
          X2ndWitness,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideX2ndWitness                :abap_boolean,

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
//          @UI.hidden :#(HideAccidentType)
          @ObjectModel.text.element:  ['Accident_Type']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_ACCIDENT_TYPE_PL', element: 'Id' } }]
          AccidentType,
          _AccidentType_PL.Accident_Type               as Accident_Type,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          @UI.hidden : true
          
//  virtual HideAccidentType               :abap_boolean,

//          @UI.hidden :#(HideActivity)
          @ObjectModel.text.element:  ['Activity_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_ACTIVITY_PL', element: 'Id' } }]
          Activity,
          _Activity_PL.Accident_Type                   as Activity_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          @UI.hidden : true
//  virtual HideActivity                   :abap_boolean,

//          @UI.hidden :#(HideAdjusterBranch)
          AdjusterBranch,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          @UI.hidden : true
//  virtual HideAdjusterBranch             :abap_boolean,

//          @UI.hidden :#(HideAdjusterClaim)
          AdjusterClaim,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          @UI.hidden : true
//  virtual HideAdjusterClaim              :abap_boolean,

//          @UI.hidden :#(HideAdjusterEmail)
          AdjusterEmail,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          @UI.hidden : true
//  virtual HideAdjusterEmail              :abap_boolean,

//          @UI.hidden :#(HideAdjusterName)
          AdjusterName,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          @UI.hidden : true
//  virtual HideAdjusterName               :abap_boolean,

//          @UI.hidden :#(HideAdjusterPhone)
          AdjusterPhone,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          @UI.hidden : true
//  virtual HideAdjusterPhone              :abap_boolean,

//          @UI.hidden :#(HideAgreedActions)
          AgreedActions,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          @UI.hidden : true
//  virtual HideAgreedActions              :abap_boolean,

//          @UI.hidden :#(HideDestinationCountry)
          DestinationCountry,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          @UI.hidden : true
//  virtual HideDestinationCountry         :abap_boolean,

//          @UI.hidden :#(HideAllegedClaimedUnitS)
          AllegedClaimedUnitS,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          @UI.hidden : true
//  virtual HideAllegedClaimedUnitS        :abap_boolean,

//          @UI.hidden :#(HideInjuryDescription)
          InjuryDescription,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          @UI.hidden : true
//  virtual HideInjuryDescription          :abap_boolean,

//          @UI.hidden :#(HideAmountReceived)
          AmountReceived,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          @UI.hidden : true
//  virtual HideAmountReceived             :abap_boolean,

//          @UI.hidden :#(HideAmountSubmitted)
          AmountSubmitted,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          @UI.hidden : true
//  virtual HideAmountSubmitted            :abap_boolean,

//          @UI.hidden :#(HideAreaIncidentOccurred)
          AreaIncidentOccurred,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          @UI.hidden : true
//  virtual HideAreaIncidentOccurred       :abap_boolean,

//          @UI.hidden :#(HideArrivalDate)
          ArrivalDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          @UI.hidden : true
//  virtual HideArrivalDate                :abap_boolean,

//          @UI.hidden :#(HideAsset)
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_ASSET_LOOKUP', element: 'Asset_Name' } }]   
          Asset,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          @UI.hidden : true
//  virtual HideAsset                      :abap_boolean,

//          @UI.hidden :#(HideAssetCategory)
          AssetCategory,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideAssetCategory              :abap_boolean,
  

//          @UI.hidden :#(HideAssetName)   
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_ASSET_LOOKUP', element: 'Asset_Name' } }]
          AssetName,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideAssetName                  :abap_boolean,

//          @UI.hidden :#(HideAssetNameSrc)
          AssetNameSrc,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideAssetNameSrc                  :abap_boolean,

//          @UI.hidden :#(HideAssetType)
          AssetType,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideAssetType                  :abap_boolean,

//          @UI.hidden :#(HideAverageWeeklyWage)
          AverageWeeklyWage,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideAverageWeeklyWage          :abap_boolean,

//          @UI.hidden :#(HideBL)
          BL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideBL                         :abap_boolean,

//          @UI.hidden :#(HideBLNumber)
          BLNumber,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideBLNumber                   :abap_boolean,

//          @UI.hidden :#(HideBelowDeductible)
          @ObjectModel.text.element:  ['BelowDeductible_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_BELOW_DEDUCTIBLE_PL', element: 'Id' } }]
          BelowDeductible,
          _BelowDeduct_PL.Below_Deductible             as BelowDeductible_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideBelowDeductible            :abap_boolean,

//          @UI.hidden :#(HideBelowDeductibleClaim)
          BelowDeductibleClaim,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideBelowDeductibleClaim       :abap_boolean,
  

//          @UI.hidden :#(HideBillOfLadingNumber)
          BillOfLadingNumber,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideBillOfLadingNumber         :abap_boolean,

//          @UI.hidden :#(HideDateClaimantBorn)
          DateClaimantBorn,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateClaimantBorn           :abap_boolean,

//          @UI.hidden :#(HideBodyPart)
          @ObjectModel.text.element:  ['BodyPart_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_BODY_PART_PL', element: 'Id' } }]
          BodyPart,
          _BodyPart_PL.Body_part                       as BodyPart_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideBodyPart                   :abap_boolean,

//          @UI.hidden :#(HideBrand)
          Brand,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideBrand                      :abap_boolean,

//          @UI.hidden :#(HideBrandCiClaims)
          BrandCiClaims,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideBrandCiClaims              :abap_boolean,

//          @UI.hidden :#(HideBreakBulkType)
          BreakBulkType,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideBreakBulkType              :abap_boolean,

//          @UI.hidden :#(HideChargeable)
          @ObjectModel.text.element:  ['BUChargeable_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_BU_CHARGEABLE_PL', element: 'Id' } }]
          Chargeable,
          _BUChargeable_PL.BU_Chargeable               as BUChargeable_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideChargeable                 :abap_boolean,

//          @UI.hidden :#(HideBuClaimsHandler)
          BuClaimsHandler,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideBuClaimsHandler            :abap_boolean,

//          @UI.hidden :#(HideBusinessUnit2)
          @ObjectModel.text.element:  ['BusinessUnit_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_BUSINESS_UNIT_PL', element: 'Id' } }]
          BusinessUnit2,
          _BusinessUnit_PL.Business_Unit               as BusinessUnit_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideBusinessUnit2              :abap_boolean,

//          @UI.hidden :#(HideBusinessUnit)
          BusinessUnit,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideBusinessUnit               :abap_boolean,

// @UI.hidden :#(HideCargoTypeCommodity)
          CargoTypeCommodity,
//           @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//            @UI.hidden : true
//  virtual HideCargoTypeCommodity               :abap_boolean,
  
//           @UI.hidden :#(HideCarrier)
          @ObjectModel.text.element:  ['Carrier_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CARRIER_PL', element: 'Id' } }]
          Carrier,
          _Carrier_PL.Carrier                          as Carrier_PL,
//              @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//               @UI.hidden : true
//  virtual HideCarrier               :abap_boolean,
  
//   @UI.hidden :#(HideCarrierBlNumber)
          CarrierBlNumber,     
//           @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//            @UI.hidden : true
//  virtual HideCarrierBlNumber               :abap_boolean,
  
//     @UI.hidden :#(HideCaseDesc)
          CaseDesc,
//           @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//            @UI.hidden : true
//  virtual HideCaseDesc               :abap_boolean,
  
//  @UI.hidden :#(HideCasualtyYearNo)
          CasualtyYearNo,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideCasualtyYearNo               :abap_boolean,
  
//  @UI.hidden :#(HideCausec)
          @ObjectModel.text.element:  ['Cause_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CAUSE_PL', element: 'Id' } }]
          Cause,
          _Cause_PL.Cause                              as Cause_PL,
//           @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//            @UI.hidden : true
//  virtual HideCausec               :abap_boolean,
          
//          @UI.hidden :#(HideCauseSrc)
          CauseSrc,
//           @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//            @UI.hidden : true
//  virtual HideCauseSrc               :abap_boolean,
          
//          @UI.hidden :#(HideCertificateNumber)
          CertificateNumber,
//            @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//             @UI.hidden : true
//  virtual HideCertificateNumber               :abap_boolean,
  
//   @UI.hidden :#(HideChargeName)
          @ObjectModel.text.element:  ['Charge_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CHARGE_NAME_PL', element: 'Id' } }]
          ChargeName,
          _ChargeName_PL.Charge_Name                   as Charge_PL,
//            @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//             @UI.hidden : true
//  virtual HideChargeName               :abap_boolean,
  
//   @UI.hidden :#(HideChassis)
          Chassis,
//            @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//             @UI.hidden : true
//  virtual HideChassis               :abap_boolean,
  
//    @UI.hidden :#(HideChassisOwner)
          ChassisOwner,
//             @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//              @UI.hidden : true
//  virtual HideChassisOwner               :abap_boolean,
  
//   @UI.hidden :#(HideCircumstances)
          @ObjectModel.text.element:  ['Circumstances_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CIRCUMSTANCES_PL', element: 'Id' } }]
          Circumstances,
          _Circumstances_PL.Circumstances              as Circumstances_PL,
//           @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//            @UI.hidden : true
//  virtual HideCircumstances               :abap_boolean,
          
//           @UI.hidden :#(HideCitationType)
          @ObjectModel.text.element:  ['Citation_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CITATION_TYPE_PL', element: 'Id' } }]
          CitationType,
          _CitationType_PL.Citation                    as Citation_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideCitationType               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimAge)
          ClaimAge,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimAge               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimAmount)
          ClaimAmount,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimAmount               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimAssetType)
          ClaimAssetType,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimAssetType               :abap_boolean,
          
          
//           @UI.hidden :#(HideConfirmedByTtClub)
          ConfirmedByTtClub,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideConfirmedByTtClub               :abap_boolean,
          
          
//           @UI.hidden :#(HideStatusCount)
          StatusCount,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideStatusCount               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimCountry)
          ClaimCountry,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimCountry               :abap_boolean,
          
          ClaimDescriptionMaerskDamco,
               
//           @UI.hidden :#(HideClaimKey)
          ClaimKey,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimKey               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimNature)
          @ObjectModel.text.element:  ['ClaimNature_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIM_NATURE_PL', element: 'Id' } }]
          ClaimNature,
          _ClaimNature_PL.Claim_Nature                 as ClaimNature_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimNature               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimName)
          ClaimName,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimName               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimConfirmedByInsurer)
          @ObjectModel.text.element:  ['ClaimConfirm_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIM_REPORT_PL', element: 'Id' } }]
          ClaimConfirmedByInsurer,
          _ClaimConfirm_PL.Claim_Confirmed             as ClaimConfirm_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimConfirmedByInsurer               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimLocation1)
          ClaimLocation1,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimLocation1               :abap_boolean,
//          
          
//           @UI.hidden :#(HideClaimTurnaround)
          ClaimTurnaround,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimTurnaround               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimantAddressLine1)
          ClaimantAddressLine1,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimantAddressLine1               :abap_boolean,
//          
          
//           @UI.hidden :#(HideClaimantAddressLine2)
          ClaimantAddressLine2,
    //          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
    //           @UI.hidden : true
    //  virtual HideClaimantAddressLine2               :abap_boolean,
    //          
          
//           @UI.hidden :#(HideClaimantAge)
          ClaimantAge,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimantAge               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimantCity)
          ClaimantCity,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimantCity               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimantCountry)
          @ObjectModel.text.element:  ['ClaimCountry_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIMANT_COUNTRY_PL', element: 'Id' } }]
          ClaimantCountry,
          _ClaimCountry.Claimant_Country               as ClaimCountry_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimantCountry               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimantFirstName)
          ClaimantFirstName,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimantFirstName               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimantGender)
          @ObjectModel.text.element:  ['ClaimGender']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIMANT_GENDER_PL', element: 'Id' } }]
          ClaimantGender,
          _ClaimGender.Claimant_Gender                 as ClaimGender,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimantGender               :abap_boolean,
//          
          
//           @UI.hidden :#(HideClaimantLastName)
          ClaimantLastName,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimantLastName               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimantLengthService)
          ClaimantLengthService,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimantLengthService               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimantMaritalStatus)
          @ObjectModel.text.element:  ['ClaimMarital_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIMANT_MARITAL_PL'  , element: 'Id' } }]
          ClaimantMaritalStatus,
          _ClaimMarital_PL                             as ClaimMarital_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimantMaritalStatus               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimantMaritalStatusSrc)
          ClaimantMaritalStatusSrc,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimantMaritalStatusSrc               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimantMiddleInitial)
          ClaimantMiddleInitial,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimantMiddleInitial               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimantMinor)
          ClaimantMinor,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimantMinor               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimantName)
          ClaimantName,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimantName               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimantNameEntry)
          ClaimantNameEntry,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimantNameEntry               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimantPhone)
          ClaimantPhone,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimantPhone               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimantPostalCode)
          ClaimantPostalCode,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimantPostalCode               :abap_boolean,
          
          
//           @UI.hidden :#(HideReference)
          Reference,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideReference               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimantSsn)
          ClaimantSsn,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimantSsn               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimantState)
          @ObjectModel.text.element:  ['ClaimState']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLAIMANT_STATE_PL', element: 'Id' } }]
          ClaimantState,
          _ClaimantState_PL.Claimant_State             as ClaimState,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimantState               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimantWorkPhone)
          ClaimantWorkPhone,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimantWorkPhone               :abap_boolean,
//          
          
//           @UI.hidden :#(HideClaimantSReferenceNumber)
          ClaimantSReferenceNumber,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimantSReferenceNumber               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimedAmountUsd)
          ClaimedAmountUsd,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimedAmountUsd               :abap_boolean,
          
          
//           @UI.hidden :#(HideClaimingParty)
          ClaimingParty,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimingParty               :abap_boolean,
          
          
//           @UI.hidden :#(HideClientReportLag)
          ClientReportLag,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClientReportLag               :abap_boolean,
          
          
//           @UI.hidden :#(HideCloseType)
          @ObjectModel.text.element:  ['CloseType_PL']
          @UI.textArrangement: #TEXT_ONLY
          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CLOSE_TYPE_PL', element: 'Id' } }]
          CloseType,
          _CloseType_PL.Close_Type                     as CloseType_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideCloseType               :abap_boolean,
          
          
//           @UI.hidden :#(HideCommodity)
          Commodity,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideCommodity               :abap_boolean,
//          
//          
//           @UI.hidden :#(HideCompensationAct)
//          @ObjectModel.text.element:  ['CompensationAct_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_COMPENSATION_ACT_PL', element: 'Id' } }]
//          CompensationAct,
//          _CompensationAct_PL.Compensation_Act         as CompensationAct_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideCompensationAct               :abap_boolean,
//          
//          
//           @UI.hidden :#(HideCompensationRate)
//          CompensationRate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideCompensationRate               :abap_boolean,
//          
//          
//           @UI.hidden :#(HideCompensationTotal)
//          CompensationTotal,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideCompensationTotal               :abap_boolean,
//          
//          
//           @UI.hidden :#(HideConcurrentClaim)
//          @ObjectModel.text.element:  ['ConcurrentClaim_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CONCURRENT_CLAIM_PL', element: 'Id' } }]
//          ConcurrentClaim,
//          _ConcurrentClaim_PL.Concurrent_Claim         as ConcurrentClaim_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideConcurrentClaim               :abap_boolean,
//          
//          @ObjectModel.text.element:  ['ConditionClass_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CONDITION_CLASS_PL', element: 'Id' } }]
//          ConditionOfClassImposed,
//          _ConditionClass_PL.Condition_Class           as ConditionClass_PL,
//          ContainerNumber,
//          XContainerNumber,
//          ContainerOwner,
//          ContainerPosition,
//          @ObjectModel.text.element:  ['ContainerSize_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CONTAINER_SIZE_PL', element: 'Id' } }]
//          ContainerSize,
//          _ContainerSize_PL.Container_Size             as ContainerSize_PL,
//          @ObjectModel.text.element:  ['ContainerType_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CONTAINER_TYPE_PL', element: 'Id' } }]
//          ContainerType,
//          _ContainerType_PL.Container_Type             as ContainerType_PL,
//          ContainersDamagedDestroyed,
//          ContainersLostOverboard,
//          @ObjectModel.text.element:  ['Contingent_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CONTINGENT_LIABILITY_PL', element: 'Id' } }]
//          ContingentLiability,
//          _ContingentLiability_PL.Contingent_Liability as Contingent_PL,
//          ControllingCountry,
//
//          @UI.hidden :#(HideControllingEntity)
//          ControllingEntity,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideControllingEntity          :abap_boolean,
//
//          @UI.hidden :#(HideControllingRegion)
//          ControllingRegion,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideControllingRegion               :abap_boolean,
//
//          @UI.hidden :#(HideControverted)
//          @ObjectModel.text.element:  ['Controverted_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CONTROVERTED_CLAIM_PL', element: 'Id' } }]
//          Controverted,
//          _Controverted_PL.Controverted_Claim          as Controverted_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideControverted               :abap_boolean,
//
//          @UI.hidden :#(HideCountyFiled)
//          CountyFiled,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideCountyFiled                :abap_boolean,
//
//
//          @UI.hidden :#(HideCourt)
//          @ObjectModel.text.element:  ['Court_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_COURT_PL', element: 'Id' } }]
//          Court,
//          _Court_PL.Court                              as Court_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideCourt                      :abap_boolean,
//
//          @UI.hidden :#(HideCoverageMajor)
//          CoverageMajor,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideCoverageMajor              :abap_boolean,
//          CoverageMajorDescription,
//
//          @UI.hidden :#(HideCoverageMinor)
//          CoverageMinor,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideCoverageMinor              :abap_boolean,
//          Createdb,
//
//          @UI.hidden :#(HideCreatedDateSrcC)
//          CreatedDateSrcC,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideCreatedDateSrcC            :abap_boolean,
//
//          @UI.hidden :#(HideCrewNationality)
//          @ObjectModel.text.element:  ['CrewNationality_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CREW_NATIONALITY_PL', element: 'Id' } }]
//          CrewNationality,
//          _CrewNationality_PL.Crew_Nationality         as CrewNationality_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideCrewNationality            :abap_boolean,
//
//          @UI.hidden :#(HideNationality)
//          Nationality,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideNationality                :abap_boolean,
//
//          @UI.hidden :#(HideCrewRank)
//          @ObjectModel.text.element:  ['CrewRank_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_CREW_RANK_PL', element: 'Id' } }]
//          CrewRank,
//          _CrewRank_PL.Crew_Rank                       as CrewRank_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideCrewRank                   :abap_boolean,
//
//          @UI.hidden :#(HideCrossReference)
//          CrossReference,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideCrossReference             :abap_boolean,
//
//          @UI.hidden :#(HideCurrencyGrmUsd)
//          CurrencyGrmUsd,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideCurrencyGrmUsd             :abap_boolean,
//
//          @UI.hidden :#(HideCurrency)
          @Semantics.currencyCode: true
          Currency,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideCurrency                   :abap_boolean,
//
//          @UI.hidden :#(HideCurrencyLookup)
//          CurrencyLookup,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideCurrencyLookup             :abap_boolean,
//
//          @UI.hidden :#(HideCustomer)
//          Customer,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideCustomer                   :abap_boolean,
//
//          @UI.hidden :#(HideDaAppointed)
//          @ObjectModel.text.element:  ['DAAppointed_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_DA_APPOINTED_PL', element: 'Id' } }]
//          DaAppointed,
//          _DA_Appointed_PL.DA_Appointed                as DAAppointed_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDaAppointed                :abap_boolean,
//
//          @UI.hidden :#(HideDaAppointedDate)
//          DaAppointedDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDaAppointedDate            :abap_boolean,
//
//          @UI.hidden :#(HideDaEmail)
//          DaEmail,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDaEmail                    :abap_boolean,
//
//          @UI.hidden :#(HideDaFirmName)
//          @ObjectModel.text.element:  ['DAFirm_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_DA_FIRM_PL', element: 'Id' } }]
//          DaFirmName,
//          _DA_Firm_PL.DA_Firm                          as DAFirm_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDaFirmName                 :abap_boolean,
//
//          @UI.hidden :#(HideDaHourlyRate)
//          DaHourlyRate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDaHourlyRate               :abap_boolean,
//
//          @UI.hidden :#(HideDaName)
//          DaName,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDaName                     :abap_boolean,
//
//          @UI.hidden :#(HideDaPhone)
//          DaPhone,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDaPhone                    :abap_boolean,
//
//          @UI.hidden :#(HideDamage)
//          @ObjectModel.text.element:  ['Damage_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_DAMAGE_PL', element: 'Id' } }]
//          Damage,
//          _DA_Damage_PL.Damage                         as Damage_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDamage                     :abap_boolean,
//
//          @UI.hidden :#(HideDamageCausedBy3rdParty)
//          @ObjectModel.text.element:  ['DamageCaused_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_3P_CAUSED_DAMAGE_PL', element: 'Id' } }]
//          DamageCausedBy3rdParty,
//          _3PCAUSED_DAMAGE_PL.Caused_Damage            as DamageCaused_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDamageCausedBy3rdParty     :abap_boolean,
//
//          @UI.hidden :#(HideDamageEstimate)
//          DamageEstimate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDamageEstimate             :abap_boolean,
//
//          @UI.hidden :#(HideDateClaimantDied)
//          DateClaimantDied,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateClaimantDied           :abap_boolean,
//
//          @UI.hidden :#(HideDateClosed)
//          DateClosed,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateClosed                 :abap_boolean,
//
//          @UI.hidden :#(HideDateDataLoadInsert)
//          DateDataLoadInsert,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateDataLoadInsert         :abap_boolean,
//
//          @UI.hidden :#(HideDateDataLoadUpdate)
//          DateDataLoadUpdate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateDataLoadUpdate         :abap_boolean,
//
//          @UI.hidden :#(HideDateHired)
//          DateHired,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateHired                  :abap_boolean,
//
//          @UI.hidden :#(HideDateIndemnityReceived)
//          DateIndemnityReceived,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateIndemnityReceived      :abap_boolean,
//
//          @UI.hidden :#(HideDateLastWorked)
//          DateLastWorked,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateLastWorked             :abap_boolean,
//
//          @UI.hidden :#(HideDateLossOfTime)
//          DateLossOfTime,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateLossOfTime             :abap_boolean,
//
//          DtOfClaimReportToInsurer,
//          DtOfClaimReportToMskdamco,
//
//          @UI.hidden :#(HideDateOfLastActivity)
//          DateOfLastActivity,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateOfLastActivity         :abap_boolean,
//
//          @UI.hidden :#(HideDateOfSurvey)
//          DateOfSurvey,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateOfSurvey               :abap_boolean,
//
//          @UI.hidden :#(HideDateOfTimeBar3rdParty)
//          DateOfTimeBar3rdParty,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateOfTimeBar3rdParty      :abap_boolean,
//
//
//          @UI.hidden :#(HideDateOfTimeBarClaimant)
//          DateOfTimeBarClaimant,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateOfTimeBarClaimant      :abap_boolean,
//
//          @UI.hidden :#(HideDateOpened)
//          DateOpened,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateOpened                 :abap_boolean,
//
//          @UI.hidden :#(HideDateReceived)
//          DateReceived,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateReceived               :abap_boolean,
//
//
//          @UI.hidden :#(HideDateReopened)
//          DateReopened,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateReopened               :abap_boolean,
//
//          @UI.hidden :#(HideReportedToInsurer)
//          ReportedToInsurer,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideReportedToInsurer          :abap_boolean,
//
//          @UI.hidden :#(HideDateReportedToTpa)
//          DateReportedToTpa,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateReportedToTpa          :abap_boolean,
//
//          @UI.hidden :#(HideDateReturnedToWork)
//          DateReturnedToWork,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateReturnedToWork         :abap_boolean,
//
//          DtRiskMgmtReviewComplete,
//
//          @UI.hidden :#(HideSettlementDate)
//          SettlementDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSettlementDate             :abap_boolean,
//
//          @UI.hidden :#(HideDateSubmitted)
//          DateSubmitted,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateSubmitted              :abap_boolean,
//
//          @UI.hidden :#(HideDateSubmittedToInsurer)
//          DateSubmittedToInsurer,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateSubmittedToInsurer     :abap_boolean,
//
//
//          @UI.hidden :#(HideDateSubrogationSubmitted)
//          DateSubrogationSubmitted,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateSubrogationSubmitted   :abap_boolean,
//
//          @UI.hidden :#(HideDateSuitFiled)
//          DateSuitFiled,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateSuitFiled              :abap_boolean,
//
//          @UI.hidden :#(HideDayOfWeek)
//          DayOfWeek,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDayOfWeek                  :abap_boolean,
//
//          @UI.hidden :#(HideDayOfWeekSrc)
//          DayOfWeekSrc,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDayOfWeekSrc               :abap_boolean,
//
//          @UI.hidden :#(HideDaysOffWorkTotal)
//          DaysOffWorkTotal,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDaysOffWorkTotal           :abap_boolean,
//
//          @UI.hidden :#(HideDaysToConversion)
//          DaysToConversion,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDaysToConversion           :abap_boolean,
//
//          @UI.hidden :#(HideDaysToDecision)
//          DaysToDecision,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDaysToDecision             :abap_boolean,
//
//          @UI.hidden :#(HideDaysToReply)
//          DaysToReply,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDaysToReply                :abap_boolean,
//
//          @UI.hidden :#(HideDcliEmployee)
//          @ObjectModel.text.element:  ['DCLIEmployee_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_DCLI_EMPLOYEE_PL', element: 'Id' } }]
//          DcliEmployee,
//          _DCLI_Employee_PL.DCLI_Employee              as DCLIEmployee_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDcliEmployee               :abap_boolean,
//
//          @UI.hidden :#(HideDecisionMade)
//          DecisionMade,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDecisionMade               :abap_boolean,
//
//          @UI.hidden :#(HideDeductible)
//          Deductible,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDeductible                 :abap_boolean,
//
//
//          @UI.hidden :#(HideDeductibleFromPolicy)
//          DeductibleFromPolicy,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDeductibleFromPolicy       :abap_boolean,
//
//          @UI.hidden :#(HideDeductibleTotal)
//          DeductibleTotal,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDeductibleTotal            :abap_boolean,
//
//          @UI.hidden :#(HideDeferredRepairs)
//          DeferredRepairs,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDeferredRepairs            :abap_boolean,
//
//          @UI.hidden :#(HideDemandAmount)
//          DemandAmount,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDemandAmount               :abap_boolean,
//
//          @UI.hidden :#(HideDepartment)
//          Department,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDepartment                 :abap_boolean,
//
//          @UI.hidden :#(HideDescribeMedicalTreatment)
//          DescribeMedicalTreatment,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDescribeMedicalTreatment   :abap_boolean,
//
//          @UI.hidden :#(HideDescription)
//          @ObjectModel.text.element:  ['Description_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_DESCRIPTION_PL', element: 'Id' } }]
//          Description,
//          _Description_PL.Description                  as Description_PL,
//          DescriptionOfEvent,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDescription                :abap_boolean,
//
//          @UI.hidden :#(HideDiagnosis)
//          Diagnosis,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDiagnosis                  :abap_boolean,
//
//          @UI.hidden :#(HideDateOfFirstDisability)
//          DateOfFirstDisability,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateOfFirstDisability      :abap_boolean,
//
//          @UI.hidden :#(HideLocationGrm)
//          LocationGrm,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideLocationGrm                :abap_boolean,
//
//          @UI.hidden :#(HideDoingUsualWork)
//          @ObjectModel.text.element:  ['UsualWork_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_USUAL_WORK_PL', element: 'Id' } }]
//          DoingUsualWork,
//          _UsualWork_PL.Usual_Work                     as UsualWork_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDoingUsualWork             :abap_boolean,
//
//          @UI.hidden :#(HideDriverAddress)
//          DriverAddress,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDriverAddress              :abap_boolean,
//
//          @UI.hidden :#(HideDriverBirthDate)
//          DriverBirthDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDriverBirthDate            :abap_boolean,
//
//          @UI.hidden :#(HideDriverCity)
//          DriverCity,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDriverCity                 :abap_boolean,
//
//          @UI.hidden :#(HideDriverName)
//          DriverName,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDriverName                 :abap_boolean,
//
//          @UI.hidden :#(HideDriverPhone)
//          DriverPhone,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDriverPhone                :abap_boolean,
//
//          @UI.hidden :#(HideDriverPostalCode)
//          DriverPostalCode,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDriverPostalCode           :abap_boolean,
//          DriverSs,
//
//          @UI.hidden :#(HideDriverState)
//          @ObjectModel.text.element:  ['DriverState_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_DRIVER_STATE_PL', element: 'Id' } }]
//          DriverState,
//          _DriverState_PL.Driver_State                 as DriverState_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDriverState                :abap_boolean,
//
//          @UI.hidden :#(HideDriversAge)
//          DriversAge,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDriversAge                 :abap_boolean,
//
//          @UI.hidden :#(HideOriginCountry)
//          OriginCountry,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideOriginCountry              :abap_boolean,
//
//          @UI.hidden :#(HideSettlingAbvLglliabilityAmt)
//          @ObjectModel.text.element:  ['EligibleBenefits_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_ELIGIBLE_BENEFITS_PL', element: 'Id' } }]
//          SettlingAbvLglliabilityAmt,
//          _EligibleBenefits_PL.Eligible_Benefits       as EligibleBenefits_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSettlingAbvLglliabilityAmt :abap_boolean,
//
//          @UI.hidden :#(HideEmployeeJobTitle)
//          EmployeeJobTitle,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideEmployeeJobTitle           :abap_boolean,
//
//          @UI.hidden :#(HideEmployerPremises)
//          @ObjectModel.text.element:  ['EmployerPremises_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_EMPLOYER_PREMISES_PL', element: 'Id' } }]
//          EmployerPremises,
//          _EmployerPremises_PL.Employer_Premises       as EmployerPremises_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideEmployerPremises           :abap_boolean,
//
//          @UI.hidden :#(HideEquipmentId)
//          EquipmentId,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideEquipmentId                :abap_boolean,
//
//          @UI.hidden :#(HideEquipmentOperator)
//          EquipmentOperator,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideEquipmentOperator          :abap_boolean,
//
//          @UI.hidden :#(HideEquipmentType)
//          @ObjectModel.text.element:  ['EquipmentType_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_EQUIPMENT_TYPE_PL', element: 'Id' } }]
//          EquipmentType,
//          _EquipmentType_PL.Equipment_Type             as EquipmentType_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideEquipmentType              :abap_boolean,
//
//          EquipmentInfrastructureType,
//
//          @UI.hidden :#(HideEstimateTotalFormula)
//          EstimateTotalFormula,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideEstimateTotalFormula       :abap_boolean,
//
//          @UI.hidden :#(HideEstimateTotal)
//          EstimateTotal,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideEstimateTotal              :abap_boolean,
//
//          @UI.hidden :#(HideEventType)
//          @ObjectModel.text.element:  ['EventType_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_EVENT_TYPE_PL', element: 'Id' } }]
//          EventType,
//          _EventType_PL.Event_Type                     as EventType_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideEventType                  :abap_boolean,
//
//          @UI.hidden :#(HideExactLocation)
//          ExactLocation,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideExactLocation              :abap_boolean,
//
//          @ObjectModel.text.element:  ['Expectaion_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_EXPECTATION_PL', element: 'Id' } }]
//          ExptForTtClubToConfirm,
//          _Expectation_PL.Expectation                  as Expectaion_PL,
//          ExpectedSettlementAmountUsd,
//          ExpenseIncurredCurr2,
//          ExpenseIncurredCurr1,
//          ExpenseOutstandingCurr2,
//          ExpenseOutstandingCurr1,
//
//          @UI.hidden :#(HideExpensePaidCurr2)
//          ExpensePaidCurr2,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideExpensePaidCurr2           :abap_boolean,
//
//          @UI.hidden :#(HideExpensePaidCurr1)
//          ExpensePaidCurr1,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideExpensePaidCurr1           :abap_boolean,
//
//          @UI.hidden :#(HideExpertInvolved)
//          ExpertInvolved,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideExpertInvolved             :abap_boolean,
//
//          @UI.hidden :#(HideExpirationDate)
//          ExpirationDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideExpirationDate             :abap_boolean,
//
//          @UI.hidden :#(HideFCode)
//          FCode,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideFCode                      :abap_boolean,
//
//          @UI.hidden :#(HideFatality)
//          @ObjectModel.text.element:  ['Fatality_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_FATALITY_PL', element: 'Id' } }]
//          Fatality,
//          _Fatality_PL.Fatality                        as Fatality_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideFatality                   :abap_boolean,
//
//          @UI.hidden :#(HideFcrNumber)
//          FcrNumber,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideFcrNumber                  :abap_boolean,
//
//          @UI.hidden :#(HideFederalCourt)
//          FederalCourt,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideFederalCourt               :abap_boolean,
//
//          @UI.hidden :#(HideFeesOutstandingTotal)
//          FeesOutstandingTotal,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideFeesOutstandingTotal       :abap_boolean,
//
//          @UI.hidden :#(HideFeesPaidTotal)
//          FeesPaidTotal,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideFeesPaidTotal              :abap_boolean,
//
//          @UI.hidden :#(HideFileLocation)
//          FileLocation,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideFileLocation               :abap_boolean,
//
//          @UI.hidden :#(HidePort)
//          @ObjectModel.text.element:  ['PlaceReceipt_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PLACE_RECEIPT_PL', element: 'Id' } }]
//          Port,
//          _Place_Receipt_PL.Place_Receipt              as PlaceReceipt_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePort                       :abap_boolean,
//
//          @UI.hidden :#(HideFinalSettlementTargetDate)
//          FinalSettlementTargetDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideFinalSettlementTargetDate  :abap_boolean,
//
//          @UI.hidden :#(HideFitForDutyDate)
//          FitForDutyDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideFitForDutyDate             :abap_boolean,
//
//          @UI.hidden :#(HideFitnessForDuty)
//          @ObjectModel.text.element:  ['FitnessDuty_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_FITNESS_DUTY_PL', element: 'Id' } }]
//          FitnessForDuty,
//          _FitnessDuty_PL.Fitness_Duty                 as FitnessDuty_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideFitnessForDuty             :abap_boolean,
//
//          @UI.hidden :#(HideFlag)
//          Flag,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideFlag                       :abap_boolean,
//
//          @UI.hidden :#(HideFleetGroup)
//          @ObjectModel.text.element:  ['FleetMangaer_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_FLEET_MANAGER_PL', element: 'Id' } }]
//          FleetGroup,
//          _FleetManager_PL.Fleet_Manager               as FleetMangaer_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideFleetGroup                 :abap_boolean,
//
//          @UI.hidden :#(HideFormerAdjusterClaim)
//          FormerAdjusterClaim,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideFormerAdjusterClaim        :abap_boolean,
//
//          @UI.hidden :#(HideGap)
//          Gap,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideGap                        :abap_boolean,
//
//          @UI.hidden :#(HideGensetNumber)
//          GensetNumber,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideGensetNumber               :abap_boolean,
//
//          @UI.hidden :#(HideGlbclmOwner)
//          @ObjectModel.text.element:  ['GLBCLMOwner_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_GLBCLM_OWNER_PL', element: 'Id' } }]
//          GlbclmOwner,
//          _GLBMOwner_PL.GLBCLM_Owner                   as GLBCLMOwner_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideGlbclmOwner                :abap_boolean,
//
//          @UI.hidden :#(HideGrmClaimsHandler)
//          GrmClaimsHandler,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideGrmClaimsHandler           :abap_boolean,
//
//          @UI.hidden :#(HideGrossIncurredCurr2)
//          GrossIncurredCurr2,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideGrossIncurredCurr2         :abap_boolean,
//
//          @UI.hidden :#(HideGrossIncurredCurr1)
//          GrossIncurredCurr1,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideGrossIncurredCurr1         :abap_boolean,
//
//          @UI.hidden :#(HideGrossOutstandingCurr2)
//          GrossOutstandingCurr2,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideGrossOutstandingCurr2      :abap_boolean,
//
//          @UI.hidden :#(HideGrossOutstandingCurr1)
//          GrossOutstandingCurr1,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideGrossOutstandingCurr1      :abap_boolean,
//
//          @UI.hidden :#(HideGrossPaidCurr2)
//          GrossPaidCurr2,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideGrossPaidCurr2             :abap_boolean,
//
//          @UI.hidden :#(HideGrossPaidCurr1)
//          GrossPaidCurr1,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideGrossPaidCurr1             :abap_boolean,
//
//          GrossRegisteredTonnage,
//
//          @UI.hidden :#(HideHandlerBu)
//          HandlerBu,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideHandlerBu                  :abap_boolean,
//
//          @UI.hidden :#(HideHandlerSrcDel)
//          HandlerSrcDel,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideHandlerSrcDel              :abap_boolean,
//
//          @UI.hidden :#(HideHandlingCountry)
//          HandlingCountry,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideHandlingCountry            :abap_boolean,
//
//          @UI.hidden :#(HideHandlingEntity)
//          HandlingEntity,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideHandlingEntity             :abap_boolean,
//
//
//          @UI.hidden :#(HideHandlingRegion)
//          HandlingRegion,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideHandlingRegion             :abap_boolean,
//          HealthcareFacilityAddrline1,
//          HealthcareFacilityAddrline2,
//          HealthcareFacilityCity,
//          HealthcareFacilityName,
//          HealthcareFacilityPostalcode,
//
//          //            @UI.hidden :#(HideHealthcareFacilityState)
//          @ObjectModel.text.element:  ['HealthState_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_HEALTHCARE_STATE_PL', element: 'Id' } }]
//           @UI.hidden : true
//          HealthcareFacilityState,
//          _HealthState_PL.HealthCare_State             as HealthState_PL,
//          //           @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          //  virtual HideHealthcareFacilityState                    :abap_boolean,
//
//          //           @UI.hidden :#(HideHierarchyNodeAp)
//          HierarchyNodeAp,
//          //           @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          //  virtual HideHierarchyNodeAp                    :abap_boolean,
//
//          @UI.hidden :#(HideHighwayDirection)
//          HighwayDirection,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideHighwayDirection           :abap_boolean,
//
//          //          @UI.hidden :#(HideHospitalizedOvernight)
//          @ObjectModel.text.element:  ['Overnight_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_HOSPITALIZED_OVERNIGHT_PL', element: 'Id' } }]
//          HospitalizedOvernight,
//          _HospitalOVernight_PL.Hospitalized           as Overnight_PL,
//          //          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          //  virtual HideHospitalizedOvernight                    :abap_boolean,
//
//          @UI.hidden :#(HideHsCode)
//          @ObjectModel.text.element:  ['HSCode_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_HS_CODE_PL', element: 'Id' } }]
//          HsCode,
//          _HSCode_PL.HS_Code                           as HSCode_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideHsCode                     :abap_boolean,
//
//          @UI.hidden :#(HideHsseLearningPacks)
//          @ObjectModel.text.element:  ['HSSELearning_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_HSSE_LEARNING_PL', element: 'Id' } }]
//          HsseLearningPacks,
//          _HSSELearning_PL.HSSE_Learning               as HSSELearning_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideHsseLearningPacks          :abap_boolean,
//
//          @UI.hidden :#(HideImoNumber)
//          ImoNumber,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideImoNumber                  :abap_boolean,
//
//          @UI.hidden :#(HideInLitigation)
//          @ObjectModel.text.element:  ['InLitigation_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_IN_LITIGATION_PL', element: 'Id' } }]
//          InLitigation,
//          _InLitigation_PL.In_Litigation               as InLitigation_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideInLitigation               :abap_boolean,
//
//          @UI.hidden :#(HideIncidentMonth)
//          IncidentMonth,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideIncidentMonth              :abap_boolean,
//
//          @UI.hidden :#(HideIncidentQuarter)
//          IncidentQuarter,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideIncidentQuarter            :abap_boolean,
//
//          @UI.hidden :#(HideBuClaim)
//          BuClaim,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideBuClaim                    :abap_boolean,
//
//          @UI.hidden :#(HideIncidentToClaimDate)
//          IncidentToClaimDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideIncidentToClaimDate        :abap_boolean,
//
//          //          @UI.hidden :#(HideIncidentYear)
//          IncidentYear,
//          //           @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          //  virtual HideHideIncidentYear                    :abap_boolean,
//
//          //           @UI.hidden :#(HideIndemnityIncurredCurr2)
//          IndemnityIncurredCurr2,
//          //            @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          //  virtual HideIndemnityIncurredCurr2                    :abap_boolean,
//
//          //          @UI.hidden :#(HideIndemnityIncurredCurr1)
//          IndemnityIncurredCurr1,
//          //          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          //  virtual HideIndemnityIncurredCurr1                    :abap_boolean,
//
//          //          @UI.hidden :#(HideIndemnityOutstandingCurr2)
//          IndemnityOutstandingCurr2,
//          //            @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          //  virtual HideIndemnityOutstandingCurr2                    :abap_boolean,
//
//          //          @UI.hidden :#(HideIndemnityOutstandingCurr1)
//          IndemnityOutstandingCurr1,
//          //            @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          //  virtual HideIndemnityOutstandingCurr1                    :abap_boolean,
//
//
//          @UI.hidden :#(HideIndemnityPaidCurr2)
//          IndemnityPaidCurr2,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideIndemnityPaidCurr2         :abap_boolean,
//
//          @UI.hidden :#(HideIndemnityPaidCurr1)
//          IndemnityPaidCurr1,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideIndemnityPaidCurr1         :abap_boolean,
//
//          @UI.hidden :#(HideInfrastructureDesc)
//          InfrastructureDesc,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideInfrastructureDesc         :abap_boolean,
//
//          @UI.hidden :#(HideInitialEstimate)
//          InitialEstimate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideInitialEstimate            :abap_boolean,
//
//          @UI.hidden :#(HideInjured)
//          @ObjectModel.text.element:  ['Injured_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_INJURED_PL', element: 'Id' } }]
//          Injured,
//          _Injured_PL.Injured                          as Injured_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideInjured                    :abap_boolean,
//
//          @UI.hidden :#(HideInjuryCauseDeath)
//          @ObjectModel.text.element:  ['InjuryDeath_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_INJURY_CAUSE_DEATH_PL', element: 'Id' } }]
//          InjuryCauseDeath,
//          _InjuryDeath_PL.Injured_Cause                as InjuryDeath_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideInjuryCauseDeath           :abap_boolean,
//
//          @UI.hidden :#(HideInjuryType)
//          @ObjectModel.text.element:  ['InjuryType_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_INJURY_TYPE_PL', element: 'Id' } }]
//          InjuryType,
//          _InjuryType_PL.Injured_Type                  as InjuryType_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideInjuryType                 :abap_boolean,
//
//          @UI.hidden :#(HideTpaCarrier)
//          @ObjectModel.text.element:  ['InsurenceCarrier_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_INSURANCE_CARRIER_PL', element: 'Id' } }]
//          TpaCarrier,
//          _InsuranceCarrier_PL                         as InsurenceCarrier_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTpaCarrier                 :abap_boolean,
//
//          @UI.hidden :#(HideInsuranceSurvey)
//          @ObjectModel.text.element:  ['InsuredSurvey_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_INSURANCE_SURVEY_PL', element: 'Id' } }]
//          InsuranceSurvey,
//          _InsuranceSurvey_PL.Insurance_Survey         as InsuredSurvey_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideInsuranceSurvey            :abap_boolean,
//
//          @UI.hidden :#(HideInsuranceSurveyDt)
//          InsuranceSurveyDt,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideInsuranceSurveyDt          :abap_boolean,
//
//          @UI.hidden :#(HideInsuredName)
           @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LOCATION_LOOKUP', element: 'Location_Name' } }]
          InsuredName,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideInsuredName                :abap_boolean,
//
//          @UI.hidden :#(HideInsurer)
//          Insurer,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideInsurer                    :abap_boolean,
//  
//  _Location.LocationUuid as LocationUuid,
//
//          @UI.hidden :#(HideInsurerClaim)
//          InsurerClaim,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideInsurerClaim               :abap_boolean,
//
//          InsurerProvisionUsdDamco,
//
//          //           @UI.hidden :#(HideInsurerReferenceNumber)
//          InsurerReferenceNumber,
//          //           @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          //  virtual HideInsurerReferenceNumber                    :abap_boolean,
//
//          @UI.hidden :#(HideInvoiceNumberSap)
//          InvoiceNumberSap,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideInvoiceNumberSap           :abap_boolean,
//
//
//          IpsCenterProvisionCurrency,
//
//
//          @UI.hidden :#(HideIpsCenterProvisionUsdDamco)
//          IpsCenterProvisionUsdDamco,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideIpsCenterProvisionUsdDamco :abap_boolean,
//
//          @UI.hidden :#(HideIpsCenterProvisionUsd)
//          IpsCenterProvisionUsd,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideIpsCenterProvisionUsd      :abap_boolean,
//
//          @UI.hidden :#(HideLastCloseDate)
//          LastCloseDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideLastCloseDate              :abap_boolean,
//
//          @UI.hidden :#(HideLastSubmitDate)
//          LastSubmitDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideLastSubmitDate             :abap_boolean,
//
//          @UI.hidden :#(HideLegalLiabilityAmountUsd)
//          LegalLiabilityAmountUsd,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideLegalLiabilityAmountUsd    :abap_boolean,
//          //                    @ObjectModel.text.element:  ['LegalStatus_PL']
//          //          @UI.textArrangement: #TEXT_ONLY
//          //          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LEGAL_STATUS_PL', element: 'Id' } }]
//          //          LegalStatusPicklist,
//          //          _LegalStatus_PL.Legal_Status as LegalStatus_PL,
//
//          @UI.hidden :#(HideLightConditions)
//          @ObjectModel.text.element:  ['LightCond_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LIGHT_CONDITIONS_PL', element: 'Id' } }]
//          LightConditions,
//          _LightConditions_PL.Light_Conditions         as LightCond_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideLightConditions            :abap_boolean,
//
//          @UI.hidden :#(HideLimitationFund)
//          LimitationFund,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideLimitationFund             :abap_boolean,
//
//          //          @UI.hidden :#(HideLimitationFundCurrency)
//          LimitationFundCurrency,
//          //                @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          //  virtual HideLimitationFundCurrency                     :abap_boolean,
//
//          @UI.hidden :#(HideLitigation)
//          @ObjectModel.text.element:  ['Litigation_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LITIGATION_PL', element: 'Id' } }]
//          Litigation,
//          _Litigation_PL.Litigation                    as Litigation_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideLitigation                 :abap_boolean,
//
//          //          @UI.hidden :#(HideLitigationStatusGrm)
//          @ObjectModel.text.element:  ['LitigationStatus_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LITIGATION_STATUS_PL', element: 'Id' } }]
//          LitigationStatusGrm,
//          _LitigationStatus_PL.Litigation_Status       as LitigationStatus_PL,
//          //            @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          //  virtual HideLitigationStatusGrm                     :abap_boolean,
//
//          @UI.hidden :#(HideLegalStatus)
//          @ObjectModel.text.element:  ['LegalStatus_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LEGAL_STATUS_PL', element: 'Id' } }]
//          LegalStatus,
//          _LegalStatus_PL.Legal_Status                 as LegalStatus_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideLegalStatus                :abap_boolean,
//
//          @UI.hidden :#(HideLossJuristiction)
//          LossJuristiction,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideLossJuristiction           :abap_boolean,
//
//          @UI.hidden :#(HideLocalProvisionDamco)
//          LocalProvisionDamco,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideLocalProvisionDamco        :abap_boolean,
//
//          //          @UI.hidden :#(HideLocalProvisionCurrency)
//          LocalProvisionCurrency,
//          //           @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          //  virtual HideLocalProvisionCurrency                     :abap_boolean,
//
//          @UI.hidden :true
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LOCATION_LOOKUP', element: 'Location_Name' } }]
//          HierarchyNode,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideHierarchyNode              :abap_boolean,
//
//          @UI.hidden :#(HideClaimLocation)
//          ClaimLocation,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimLocation              :abap_boolean,
//
//          @UI.hidden :true
//           @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LOCATION_LOOKUP', element: 'Location_Name' } }]
//          LocationLookup,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideLocationLookup             :abap_boolean,
//
//          @UI.hidden :#(HideLocationName)
//          LocationName,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideLocationName               :abap_boolean,
//
//          //           @UI.hidden :#(HideLocationSubBusinessUnit)
//          LocationSubBusinessUnit,
//          //          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          //  virtual HideLocationSubBusinessUnit                     :abap_boolean,
//
//          @UI.hidden :#(HideLongTerm)
//          @ObjectModel.text.element:  ['LongTerm_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LONG_TERM_PL', element: 'Id' } }]
//          LongTerm,
//          _LongTerm_PL.Long_Term                       as LongTerm_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideLongTerm                   :abap_boolean,
//
//          @UI.hidden :#(HideAccidentAddressLine2)
//          AccidentAddressLine2,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideAccidentAddressLine2       :abap_boolean,
//
//          @UI.hidden :#(HideAccidentAddressLine1)
//          AccidentAddressLine1,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideAccidentAddressLine1       :abap_boolean,
//
//          @UI.hidden :#(HideAccidentCity)
//          AccidentCity,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideAccidentCity               :abap_boolean,
//
//          @UI.hidden :#(HideLossCountry)
//          @ObjectModel.text.element:  ['LossCountry_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LOSS_COUNTRY_PL', element: 'Id' } }]
//          LossCountry,
//          _LossCountry_PL.Loss_Country                 as LossCountry_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideLossCountry                :abap_boolean,
//
//          @UI.hidden :#(HideAccidentCountry)
//          AccidentCountry,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideAccidentCountry            :abap_boolean,
//
//          @UI.hidden :#(HideDateOfLoss)
//          DateOfLoss,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateOfLoss                 :abap_boolean,
//
//          @UI.hidden :#(HideAccidentDescription)
//          AccidentDescription,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideAccidentDescription        :abap_boolean,
//
//          @UI.hidden :#(HideLossJurisdiction)
//          @ObjectModel.text.element:  ['LossJurisdiction_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LOSS_JURISDICTION_PL', element: 'Id' } }]
//          LossJurisdiction,
//          _LossJurisdiction_PL.Loss_Jurisdiction       as LossJurisdiction_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideLossJurisdiction           :abap_boolean,
//
//          @UI.hidden :#(HideAccidentPostalCode)
//          AccidentPostalCode,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideAccidentPostalCode         :abap_boolean,
//
//          @UI.hidden :#(HideAccidentState)
//          @ObjectModel.text.element:  ['LossState_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LOSS_STATE_PROVINCE_PL', element: 'Id' } }]
//          AccidentState,
//          _LossState_PL.Loss_State_Province            as LossState_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideAccidentState              :abap_boolean,
//
//          @UI.hidden :#(HideLostDays)
//          LostDays,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideLostDays                   :abap_boolean,
//
//          @UI.hidden :#(HideLostTimeIndicator)
//          @ObjectModel.text.element:  ['LostTime_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_LOST_TIME_INDICATOR_PL', element: 'Id' } }]
//          LostTimeIndicator,
//          _LostTime_PL.Loss_Time_Indicator             as LostTime_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideLostTimeIndicator          :abap_boolean,
//
//          LostWagesEarningCapacity,
//
//          @UI.hidden :#(HideLouSecurityAmount)
//          LouSecurityAmount,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideLouSecurityAmount          :abap_boolean,
//
//          @UI.hidden :#(HideLouSecurityCurrency)
//          LouSecurityCurrency,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideLouSecurityCurrency        :abap_boolean,
//
//          @UI.hidden :#(HideMaerskCompany)
//          @ObjectModel.text.element:  ['MaerskComp_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MAERSK_COMPANY_PL', element: 'Id' } }]
//          MaerskCompany,
//          _MaerskComp_PL.Maersk_Company                as MaerskComp_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideMaerskCompany              :abap_boolean,
//
//          @UI.hidden :#(HideMaerskDamcoBlNumber)
//          MaerskDamcoBlNumber,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideMaerskDamcoBlNumber        :abap_boolean,
//
//
//          @UI.hidden :#(HideMainActivity)
//          @ObjectModel.text.element:  ['MainActivity_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MAIN_ACTIVITY_PL', element: 'Id' } }]
//          MainActivity,
//          _MainActivity_PL.Main_Activity               as MainActivity_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideMainActivity               :abap_boolean,
//
//          @UI.hidden :#(HideMainCasualty)
//          @ObjectModel.text.element:  ['MainCasuality_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MAIN_CASUALTY_PL', element: 'Id' } }]
//          MainCasualty,
//          _MainCasualty_PL.Main_Casualty               as MainCasuality_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideMainCasualty               :abap_boolean,
//
//          @UI.hidden :#(HideMainCause)
//          @ObjectModel.text.element:  ['MainCause_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MAIN_CAUSE_PL', element: 'Id' } }]
//          MainCause,
//          _MainCause_PL.Main_Cause                     as MainCause_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideMainCause                  :abap_boolean,
//
//          @UI.hidden :#(HideMainEvent)
//          @ObjectModel.text.element:  ['MainEvent_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MAIN_EVENT_PL', element: 'Id' } }]
//          MainEvent,
//          _MainEvent_PL.Main_Event                     as MainEvent_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideMainEvent                  :abap_boolean,
//
//          @UI.hidden :#(HideStarsDeductible)
//          StarsDeductible,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideStarsDeductible            :abap_boolean,
//
//          @UI.hidden :#(HideMediationDate)
//          MediationDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideMediationDate              :abap_boolean,
//
//          @UI.hidden :#(HideMedicalBiIncurred)
//          MedicalBiIncurred,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideMedicalBiIncurred          :abap_boolean,
//
//          @UI.hidden :#(HideMedicalBiPaid)
//          MedicalBiPaid,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideMedicalBiPaid              :abap_boolean,
//          MedicalIncurredCurr2,
//          MedicalIncurredCurr1,
//
//          //          @UI.hidden :#(HideMedicalOutstandingCurr2)
//          MedicalOutstandingCurr2,
//          //          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          //  virtual HideMedicalOutstandingCurr2                      :abap_boolean,
//
//          //          @UI.hidden :#(HideMedicalOutstandingCurr1)
//          MedicalOutstandingCurr1,
//          //           @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          //  virtual HideMedicalOutstandingCurr1                      :abap_boolean,
//
//          @UI.hidden :#(HideMedicalPaidCurr2)
//          MedicalPaidCurr2,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideMedicalPaidCurr2           :abap_boolean,
//
//          @UI.hidden :#(HideMedicalPaidCurr1)
//          MedicalPaidCurr1,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideMedicalPaidCurr1           :abap_boolean,
//
//          @UI.hidden :#(HideMedicalTreatmentOnboard)
//          @ObjectModel.text.element:  ['MedicalTreat_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MEDICAL_TREATMENT_PL', element: 'Id' } }]
//          MedicalTreatmentOnboard,
//          _MedicalTreatment_PL.Medical_Treatment       as MedicalTreat_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideMedicalTreatmentOnboard    :abap_boolean,
//
//          @UI.hidden :#(HideMedicareLien)
//          @ObjectModel.text.element:  ['MedicareLien_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MEDICARE_LIEN_PL', element: 'Id' } }]
//          MedicareLien,
//          _MedicareLien_PL                             as MedicareLien_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideMedicareLien               :abap_boolean,
//
//          @UI.hidden :#(HideMedicareReportable)
//          @ObjectModel.text.element:  ['MedicareReport_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MEDICARE_REPORT_PL', element: 'Id' } }]
//          MedicareReportable,
//          _MedicareReport_PL.Medicare_Report           as MedicareReport_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideMedicareReportable         :abap_boolean,
//
//          @UI.hidden :#(HideMescEmployee)
//          @ObjectModel.text.element:  ['MescEmployee_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_MESC_EMPLOYEE_PL', element: 'Id' } }]
//          MescEmployee,
//          _MescEmployee_PL.Medicare_Report             as MescEmployee_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideMescEmployee               :abap_boolean,
//
//          @UI.hidden :#(HideMiasShare)
//          MiasShare,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideMiasShare                  :abap_boolean,
//
//          @UI.hidden :#(HideMiasShareManual)
//          MiasShareManual,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideMiasShareManual            :abap_boolean,
//
//          @UI.hidden :#(HideVoidDate)
//          VoidDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideVoidDate                   :abap_boolean,
//
//          @UI.hidden :#(HideModeOfTransport)
//          ModeOfTransport,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideModeOfTransport            :abap_boolean,
//
//          @UI.hidden :#(HideNameOfWatercraft)
//          NameOfWatercraft,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideNameOfWatercraft           :abap_boolean,
//
//          @UI.hidden :#(HideNameTitleReportedTo)
//          NameTitleReportedTo,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideNameTitleReportedTo        :abap_boolean,
//
//          @UI.hidden :#(HideNature)
//          @ObjectModel.text.element:  ['NatureInjury_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_NATURE_INJURY_PL', element: 'Id' } }]
//          Nature,
//          _NatureInjury_PL.Nature_Injury               as NatureInjury_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideNature                     :abap_boolean,
//
//          @UI.hidden :#(HideNearestLandmark)
//          NearestLandmark,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideNearestLandmark            :abap_boolean,
//
//          @UI.hidden :#(HideNetIncurredCurr2)
//          NetIncurredCurr2,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideNetIncurredCurr2           :abap_boolean,
//
//          @UI.hidden :#(HideNetIncurredCurr1)
//          NetIncurredCurr1,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideNetIncurredCurr1           :abap_boolean,
//
//          @UI.hidden :#(HideNetOutstandingCurr2)
//          NetOutstandingCurr2,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideNetOutstandingCurr2        :abap_boolean,
//
//          @UI.hidden :#(HideNetOutstandingCurr1)
//          NetOutstandingCurr1,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideNetOutstandingCurr1        :abap_boolean,
//
//          @UI.hidden :#(HideNetPaidCurr2)
//          NetPaidCurr2,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideNetPaidCurr2               :abap_boolean,
//
//          @UI.hidden :#(HideNetPaidCurr1)
//          NetPaidCurr1,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideNetPaidCurr1               :abap_boolean,
//
//          @UI.hidden :#(HideNetRetention)
//          NetRetention,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideNetRetention               :abap_boolean,
//
//          @UI.hidden :#(HideNetRtntEur)
//          NetRtntEur,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideNetRtntEur                 :abap_boolean,
//
//          @UI.hidden :#(HideNetRtntUsd)
//          NetRtntUsd,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideNetRtntUsd                 :abap_boolean,
//
//          @UI.hidden :#(HideNewDisabilityPeriod)
//          @ObjectModel.text.element:  ['DisabilityPeriod_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_DISABILITY_PERIOD_PL', element: 'Id' } }]
//          NewDisabilityPeriod,
//          _DisabilityPeriod_PL.Disability_Period       as DisabilityPeriod_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideNewDisabilityPeriod        :abap_boolean,
//
//          @UI.hidden :#(HideNotifiedDate)
//          NotifiedDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideNotifiedDate               :abap_boolean,
//
//          @UI.hidden :#(HideOccupation)
//          @ObjectModel.text.element:  ['Occupation_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_OCCUPATION_PL', element: 'Id' } }]
//          Occupation,
//          _Occupation_PL.Occupation                    as Occupation_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideOccupation                 :abap_boolean,
//
//          @UI.hidden :#(HideOccurrence)    
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_OCCURRENCE_LOOKUP', element: 'Occurrence_Name' } }]
//          Occurrence,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideOccurrence                 :abap_boolean,
//
//          @UI.hidden :#(HideOccurrenceNumber)
//          OccurrenceNumber,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideOccurrenceNumber           :abap_boolean,
//
//          @UI.hidden :#(HideOccurrenceType)
//          OccurrenceType,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideOccurrenceType             :abap_boolean,
//
//          @UI.hidden :#(HideOcl)
//          @ObjectModel.text.element:  ['OCL_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_OCL_PL', element: 'Id' } }]
//          Ocl,
//          _OCL_PL.Ocl                                  as OCL_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideOcl                        :abap_boolean,
//
//          @UI.hidden :#(HideOcuClaim)
//          @ObjectModel.text.element:  ['OclClaim_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_OCU_CLAIM_PL', element: 'Id' } }]
//          OcuClaim,
//          _OCU_Claim_PL.Ocl_Claim                      as OclClaim_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideOcuClaim                   :abap_boolean,
//
//          @UI.hidden :#(HideOffBsCentreCurrency)
//          OffBsCentreCurrency,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideOffBsCentreCurrency        :abap_boolean,
//
//          @UI.hidden :#(HideOffBsCountriesCurrency)
//          OffBsCountriesCurrency,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideOffBsCountriesCurrency     :abap_boolean,
//
//          @UI.hidden :#(HideOffsiteMedicalTreatmentDel)
//          @ObjectModel.text.element:  ['OffsiteTreat_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_OFFSITE_TREATMENT_PL', element: 'Id' } }]
//          OffsiteMedicalTreatmentDel,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideOffsiteMedicalTreatmentDel :abap_boolean,
//          _OffsiteTreatment_PL.Offsite_Treatment       as OffsiteTreat_PL,
//
//          @UI.hidden :#(HideOldDamcoReferenceNumber)
//          OldDamcoReferenceNumber,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideOldDamcoReferenceNumber    :abap_boolean,
//
//          @UI.hidden :#(HideOshaRecordable)
//          @ObjectModel.text.element:  ['OSHARecord_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_OSHA_RECORDABLE_PL', element: 'Id' } }]
//          OshaRecordable,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideOshaRecordable             :abap_boolean,
//          _OSHARecord_PL.OSHA_Recordable               as OSHARecord_PL,
//
//          @UI.hidden :#(HideOtherCarriers)
//          OtherCarriers,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideOtherCarriers              :abap_boolean,
//
//          @UI.hidden :#(HideOtherVehicles)
//          @ObjectModel.text.element:  ['OtherVehicles_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_OTHER_VEHICLES_PL', element: 'Id' } }]
//          OtherVehicles,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideOtherVehicles              :abap_boolean,
//          _OtherVehicles_PL.Other_Vehicles             as OtherVehicles_PL,
//
//          @UI.hidden :#(HideOwcp)
//          Owcp,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideOwcp                       :abap_boolean,
//
//          @UI.hidden :#(HidePIAad)
//          PIAad,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePIAad                      :abap_boolean,
//
//          @UI.hidden :#(HidePIClubNew)
//          PIClubNew,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePIClubNew                  :abap_boolean,
//
//
//          @UI.hidden :#(HidePIClubNames)
//          @ObjectModel.text.element:  ['PIClub_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PI_CLUB_PL', element: 'Id' } }]
//          PIClubNames,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePIClubNames                :abap_boolean,
//          _PIClub_PL.PI_Club                           as PIClub_PL,
//
//          @UI.hidden :#(HidePaAppointed)
//          @ObjectModel.text.element:  ['PaAppointed_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PA_APPOINTED_PL', element: 'Id' } }]
//          PaAppointed,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePaAppointed                :abap_boolean,
//          _PA_Appointed_PL.PA_Appointed                as PaAppointed_PL,
//
//          @UI.hidden :#(HidePaAppointedDate)
//          PaAppointedDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePaAppointedDate            :abap_boolean,
//
//          @UI.hidden :#(HidePaEmail)
//          PaEmail,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePaEmail                    :abap_boolean,
//
//          @UI.hidden :#(HidePaFirmName)
//          PaFirmName,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePaFirmName                 :abap_boolean,
//
//          @UI.hidden :#(HidePaName)
//          PaName,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePaName                     :abap_boolean,
//
//
//          @UI.hidden :#(HidePaPhone)
//          PaPhone,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePaPhone                    :abap_boolean,
//
//          @UI.hidden :#(HideSettledLegalCost)
//          SettledLegalCost,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSettledLegalCost           :abap_boolean,
//
//          @UI.hidden :#(HidePaidSettledLegalCostsUsd)
//          PaidSettledLegalCostsUsd,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePaidSettledLegalCostsUsd   :abap_boolean,
//
//          @UI.hidden :#(HidePaidSettledAmountUsd)
//          PaidSettledAmountUsd,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePaidSettledAmountUsd       :abap_boolean,
//
//
//          @UI.hidden :#(HidePartGeneralDelDel)
//          @ObjectModel.text.element:  ['PartGeneral_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PART_GENERAL_PL', element: 'Id' } }]
//          PartGeneralDelDel,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePartGeneralDelDel          :abap_boolean,
//          _PartGeneral_PL.Part_General                 as PartGeneral_PL,
//
//          @UI.hidden :#(HidePermanentRepairs)
//          @ObjectModel.text.element:  ['PermanentRepairs_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PERMANENT_REPAIRS_PL', element: 'Id' } }]
//          PermanentRepairs,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePermanentRepairs           :abap_boolean,
//          _PermanentRepairs_PL.Permanent_Repairs       as PermanentRepairs_PL,
//
//          @UI.hidden :#(HidePersonName)
//          PersonName,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePersonName                 :abap_boolean,
//
//          @UI.hidden :#(HidePhysicalFile)
//          @ObjectModel.text.element:  ['PhysicalFile_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PHYSICAL_FILE_PL', element: 'Id' } }]
//          PhysicalFile,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePhysicalFile               :abap_boolean,
//          _PhysicalFile_PL.Physical_File               as PhysicalFile_PL,
//
//          @UI.hidden :#(HidePhysicianName)
//          PhysicianName,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePhysicianName              :abap_boolean,
//
//          @UI.hidden :#(HidePlannedRepairDate)
//          PlannedRepairDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePlannedRepairDate          :abap_boolean,
//
//          @UI.hidden :#(HidePoliceDeptName)
//          PoliceDeptName,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePoliceDeptName             :abap_boolean,
//
//          @UI.hidden :#(HidePoliceReport)
//          PoliceReport,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePoliceReport               :abap_boolean,
//
//          @UI.hidden :#(HidePolicyEffectiveDate)
//          PolicyEffectiveDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePolicyEffectiveDate        :abap_boolean,
//
//          @UI.hidden :#(HidePolicyExpirationDateDel)
//          PolicyExpirationDateDel,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePolicyExpirationDateDel    :abap_boolean,
//
//          @UI.hidden :#(HidePolicyName)
//          
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_POLICY_LOOKUP', element: 'Policy_Name' } }]
//          PolicyName,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePolicyName                 :abap_boolean,
//
//          @UI.hidden :#(HidePolicyLookup)
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_POLICY_LOOKUP', element: 'Policy_Name' } }]
//          PolicyLookup,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePolicyLookup               :abap_boolean,
//
//          @UI.hidden :#(HidePolicyNumberNew)
//          PolicyNumberNew,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePolicyNumberNew            :abap_boolean,
//
//          @UI.hidden :#(HidePolicyNumber)
//          PolicyNumber,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePolicyNumber               :abap_boolean,
//
//          @UI.hidden :#(HidePolicySectionLookup)
//          PolicySectionLookup,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePolicySectionLookup        :abap_boolean,
//
//          @UI.hidden :#(HidePolicyYearNew)
//          PolicyYearNew,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePolicyYearNew              :abap_boolean,
//
//          @UI.hidden :#(HidePolicyYear)
//          PolicyYear,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePolicyYear                 :abap_boolean,
//
//          @UI.hidden :#(HideFinalDestination)
//          FinalDestination,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideFinalDestination           :abap_boolean,
//
//          @UI.hidden :#(HidePortOfDischarge)
//          PortOfDischarge,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePortOfDischarge            :abap_boolean,
//
//          @UI.hidden :#(HidePortOfOrigin)
//          PortOfOrigin,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePortOfOrigin               :abap_boolean,
//
//          @UI.hidden :#(HidePortOfLoading)
//          PortOfLoading,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePortOfLoading              :abap_boolean,
//
//          @UI.hidden :#(HidePortOfReceipt)
//          PortOfReceipt,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePortOfReceipt              :abap_boolean,
//
//          @UI.hidden :#(HidePermanentPortOfRepair)
//          PermanentPortOfRepair,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePermanentPortOfRepair      :abap_boolean,
//
//          @UI.hidden :#(HideTemporaryPortOfRepair)
//          TemporaryPortOfRepair,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTemporaryPortOfRepair      :abap_boolean,
//
//          @UI.hidden :#(HidePortSInvolved)
//          PortSInvolved,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePortSInvolved              :abap_boolean,
//
//          @UI.hidden :#(HidePreventable)
//          @ObjectModel.text.element:  ['Preventable_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PREVENTABLE_PL', element: 'Id' } }]
//          Preventable,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePreventable                :abap_boolean,
//          _Preventable_PL.Preventable                  as Preventable_PL,
//
//          @UI.hidden :#(HidePropertyLookup)
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PROPERTY_LOOKUP', element: 'Property_Name' } }]
//          PropertyLookup,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePropertyLookup             :abap_boolean,
//
//          @UI.hidden :#(HideRecommendation)
//          Recommendation,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideRecommendation             :abap_boolean,
//
//          @UI.hidden :#(HideRecommendationComments)
//          RecommendationComments,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideRecommendationComments     :abap_boolean,
//
//          @UI.hidden :#(HideRecordTypeCustom)
//          RecordTypeCustom,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideRecordTypeCustom           :abap_boolean,
//
//          @UI.hidden :#(HideRecoveryFrom3rdPartyCurr2)
//          RecoveryFrom3rdPartyCurr2,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideRecoveryFrom3rdPartyCurr2  :abap_boolean,
//
//          @UI.hidden :#(HideRecoveryFrom3rdPartyCurr1)
//          RecoveryFrom3rdPartyCurr1,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideRecoveryFrom3rdPartyCurr1  :abap_boolean,
//
//          @UI.hidden :#(HideRecoveryReceived)
//          RecoveryReceived,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideRecoveryReceived           :abap_boolean,
//
//          //          @UI.hidden :#(HideRecoveryFromInsuranceCurr2)
//          RecoveryFromInsuranceCurr2,
//          //          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          //  virtual HideRecoveryFromInsuranceCurr2  :abap_boolean,
//
//          //          @UI.hidden :#(HideRecoveryFromInsuranceCurr1)
//          RecoveryFromInsuranceCurr1,
//          //          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          //  virtual HideRecoveryFromInsuranceCurr1  :abap_boolean,
//
//          @UI.hidden :#(HideRecoveryOwner)
//          RecoveryOwner,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideRecoveryOwner              :abap_boolean,
//
//          @UI.hidden :#(HideRecoveryPursued)
//          @ObjectModel.text.element:  ['RecoveryPursued_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_RECOVERY_PURSUED_PL', element: 'Id' } }]
//          RecoveryPursued,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideRecoveryPursued            :abap_boolean,
//          _RecoveryPursued_PL.Recovery_Pursued         as RecoveryPursued_PL,
//
//
//          @UI.hidden :#(HideRecoveryStatus)
//          @ObjectModel.text.element:  ['RecoveryStatus_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_RECOVERY_STATUS_PL', element: 'Id' } }]
//          RecoveryStatus,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideRecoveryStatus             :abap_boolean,
//          _RecoveryStatus_PL.Recovery_Status           as RecoveryStatus_PL,
//
//          @UI.hidden :#(HideRedFlag)
//          @ObjectModel.text.element:  ['RedFlag_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_RED_FLAG_PL', element: 'Id' } }]
//          RedFlag,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideRedFlag                    :abap_boolean,
//          _RedFlag_PL.Red_Flag                         as RedFlag_PL,
//
//          @UI.hidden :#(HideRegionSrc)
//          RegionSrc,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideRegionSrc                  :abap_boolean,
//
//          //          @UI.hidden :#(HidePermanentRepairCompleteDate)
//          PermanentRepairCompleteDate,
//          //          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          //  virtual HidePermanentRepairCompleteDate :abap_boolean,
//          //
//          //          @UI.hidden :#(HideTemporaryRepairCompleteDate)
//          TemporaryRepairCompleteDate,
//          //          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//          //  virtual HideTemporaryRepairCompleteDate :abap_boolean,
//
//          @UI.hidden :#(HidePermanentRepairDescription)
//          PermanentRepairDescription,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePermanentRepairDescription :abap_boolean,
//
//          @UI.hidden :#(HideTemporaryRepairDescription)
//          TemporaryRepairDescription,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTemporaryRepairDescription :abap_boolean,
//
//          @UI.hidden :#(HidePermanentRepairStartDate)
//          PermanentRepairStartDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePermanentRepairStartDate   :abap_boolean,
//
//          @UI.hidden :#(HideTemporaryRepairStartDate)
//          TemporaryRepairStartDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTemporaryRepairStartDate   :abap_boolean,
//
//          @UI.hidden :#(HideRepairsCompletedInPort)
//          @ObjectModel.text.element:  ['PortRepairs_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PORT_REPAIRS_PL', element: 'Id' } }]
//          RepairsCompletedInPort,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideRepairsCompletedInPort     :abap_boolean,
//          _PortRepairs_PL.Port_Repairs                 as PortRepairs_PL,
//
//          @UI.hidden :#(HideVsaPartner)
//          @ObjectModel.text.element:  ['Repatriation_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_REPATRIATION_PL', element: 'Id' } }]
//          VsaPartner,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideVsaPartner                 :abap_boolean,
//          _Repatriation_PL.Repatriation                as Repatriation_PL,
//
//          @UI.hidden :#(HideReplyDate)
//          ReplyDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideReplyDate                  :abap_boolean,
//
//          @UI.hidden :#(HideDateReportedToClient)
//          DateReportedToClient,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideDateReportedToClient       :abap_boolean,
//
//          @UI.hidden :#(HideReportedToBroker)
//          ReportedToBroker,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideReportedToBroker           :abap_boolean,
//
//          @UI.hidden :#(HideReportingDepartment)
//          ReportingDepartment,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideReportingDepartment        :abap_boolean,
//
//          @UI.hidden :#(HideResponseDate)
//          ResponseDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideResponseDate               :abap_boolean,
//
//          @UI.hidden :#(HideX3rdPartyName)
//          X3rdPartyName,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideX3rdPartyName              :abap_boolean,
//
//          @UI.hidden :#(HideResponsible3rdPartyCode)
//          @ObjectModel.text.element:  ['Responsible3PC_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_RESPONSIBLE_3PC_PL', element: 'Id' } }]
//          Responsible3rdPartyCode,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideResponsible3rdPartyCode    :abap_boolean,
//          _Responsible3PC_PL.Responsible               as Responsible3PC_PL,
//
//          @UI.hidden :#(HideResponsiblePartyCode)
//          @ObjectModel.text.element:  ['Responsible_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_RESPONSIBLE_PC_PL', element: 'Id' } }]
//          ResponsiblePartyCode,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideResponsiblePartyCode       :abap_boolean,
//          _ResponsiblePC_PL.Responsible                as Responsible_PL,
//
//          @UI.hidden :#(HideRestrictedDays)
//          RestrictedDays,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideRestrictedDays             :abap_boolean,
//
//          @UI.hidden :#(HideRetainedEarningCapacity)
//          RetainedEarningCapacity,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideRetainedEarningCapacity    :abap_boolean,
//
//          @UI.hidden :#(HideRootCause)
//          @ObjectModel.text.element:  ['RootCause_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_ROOT_CAUSE_PL', element: 'Id' } }]
//          RootCause,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideRootCause                  :abap_boolean,
//          _RootCause_PL.Root_Cause                     as RootCause_PL,
//
//
//          @UI.hidden :#(HideZzzCauseCode)
//          @ObjectModel.text.element:  ['RouteCause_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_ROUTE_CODE_PL', element: 'Id' } }]
//          ZzzCauseCode,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideZzzCauseCode               :abap_boolean,
//          _RootCause_PL.Root_Cause                     as RouteCause_PL,
//
//          @UI.hidden :#(HideSalvage)
//          @ObjectModel.text.element:  ['Salvage_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SALVAGE_PL', element: 'Id' } }]
//          Salvage,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSalvage                    :abap_boolean,
//          _Salvage_PL.Salvage                          as Salvage_PL,
//
//
//          @UI.hidden :#(HideSavings)
//          Savings,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSavings                    :abap_boolean,
//
//          @UI.hidden :#(HideSeal)
//          Seal,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSeal                       :abap_boolean,
//
//          @UI.hidden :#(HideServedDate)
//          ServedDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideServedDate                 :abap_boolean,
//
//          @UI.hidden :#(HideSettlementAmount)
//          SettlementAmount,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSettlementAmount           :abap_boolean,
//
//          @UI.hidden :#(HideSettlementStatus)
//          @ObjectModel.text.element:  ['SettleStatus_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SETTLEMENT_STATUS_PL', element: 'Id' } }]
//          SettlementStatus,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSettlementStatus           :abap_boolean,
//          _SettlementStatus_PL.Settlement_Status       as SettleStatus_PL,
//
//          @UI.hidden :#(HideSeverity)
//          @ObjectModel.text.element:  ['Severity_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SEVERITY_PL', element: 'Id' } }]
//          Severity,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSeverity                   :abap_boolean,
//          _Severity_PL.Severity                        as Severity_PL,
//
//          @UI.hidden :#(HideShippersInstructions)
//          ShippersInstructions,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideShippersInstructions       :abap_boolean,
//
//          @UI.hidden :#(HideShift)
//          Shift,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideShift                      :abap_boolean,
//
//          @UI.hidden :#(HidePolicyExpirationDate)
//          PolicyExpirationDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePolicyExpirationDate       :abap_boolean,
//
//          @UI.hidden :#(HideSurveyDate)
//          SurveyDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSurveyDate                 :abap_boolean,
//
//          @UI.hidden :#(HidePropertyType)
//          PropertyType,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HidePropertyType               :abap_boolean,
//
//          @UI.hidden :#(HideSourceGeneralDel)
//          @ObjectModel.text.element:  ['SourceGen_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SOURCE_GENERAL_PL', element: 'Id' } }]
//          SourceGeneralDel,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSourceGeneralDel           :abap_boolean,
//          _SourceGeneral_PL.Source_General             as SourceGen_PL,
//
//          @UI.hidden :#(HideSpecification)
//          @ObjectModel.text.element:  ['Specification_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SPECIFICATION_PL', element: 'Id' } }]
//          Specification,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSpecification              :abap_boolean,
//          _Specification_PL.Specification              as Specification_PL,
//
//          @UI.hidden :#(HideStateFiled)
//          @ObjectModel.text.element:  ['StateFiled_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_STATE_FILED_PL', element: 'Id' } }]
//          StateFiled,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideStateFiled                 :abap_boolean,
//          _StateFiled_PL.State_Filed                   as StateFiled_PL,
//
//          @UI.hidden :#(HideStateFundRecovIndicatorDel)
//          @ObjectModel.text.element:  ['StateFund_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_STATE_FUND_RECOV_PL', element: 'Id' } }]
//          StateFundRecovIndicatorDel,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideStateFundRecovIndicatorDel :abap_boolean,
//          _StateFundRecov_PL.State_Fund_Recovery       as StateFund_PL,
//
//          @UI.hidden :#(HideStateOfEmploymentDel)
//          @ObjectModel.text.element:  ['StateEmployment_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_STATE_EMPLOYMENT_PL', element: 'Id' } }]
//          StateOfEmploymentDel,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideStateOfEmploymentDel       :abap_boolean,
//          _StateEmployment_PL.State_Employment         as StateEmployment_PL,
//
//          @UI.hidden :#(HideStateOfJurisdiction)
//          @ObjectModel.text.element:  ['StateJurisdiction_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_STATE_JURISDICTION_PL', element: 'Id' } }]
//          StateOfJurisdiction,
//          _StateJurisdiction_PL.State_Jurisdiction     as StateJurisdiction_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideStateOfJurisdiction        :abap_boolean,
//
//          @UI.hidden :#(HideStatus)
//          Status,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideStatus                     :abap_boolean,
//
//          @UI.hidden :#(HideStatusClosedCount)
//          StatusClosedCount,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideStatusClosedCount          :abap_boolean,
//
//          @UI.hidden :#(HideStatusDetail)
//          StatusDetail,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideStatusDetail               :abap_boolean,
//
//          @UI.hidden :#(HideStatusOpenCount)
//          StatusOpenCount,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideStatusOpenCount            :abap_boolean,
//
//          @UI.hidden :#(HideSubType)
//          @ObjectModel.text.element:  ['SubType_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SUB_TYPE_PL', element: 'Id' } }]
//          SubType,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSubType                    :abap_boolean,
//          _SubType_PL.Sub_Type                         as SubType_PL,
//
//          @UI.hidden :#(HideSubmitToTpa)
//          @ObjectModel.text.element:  ['SubmitTPA_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SUBMIT_TPA_PL', element: 'Id' } }]
//          SubmitToTpa,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSubmitToTpa                :abap_boolean,
//          _SubmitTPA_PL.Submit_TPA                     as SubmitTPA_PL,
//
//          @UI.hidden :#(HideSubmittedForReimb)
//          @ObjectModel.text.element:  ['SubmitReimburse_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SUBMIT_REIMBURSE_PL', element: 'Id' } }]
//          SubmittedForReimb,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSubmittedForReimb          :abap_boolean,
//          _SubmitReimburse_PL.Submit_Reimburse         as SubmitReimburse_PL,
//
//          @UI.hidden :#(HideSubmittedTo3rdParty)
//          @ObjectModel.text.element:  ['Submit3P_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SUBMIT_3P_PL', element: 'Id' } }]
//          SubmittedTo3rdParty,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSubmittedTo3rdParty        :abap_boolean,
//          _Submit3P_PL.Submit_3P                       as Submit3P_PL,
//
//          @UI.hidden :#(HideSubrogationGrm)
//          @ObjectModel.text.element:  ['Subrogation_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SUBROGATION_PL', element: 'Id' } }]
//          SubrogationGrm,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSubrogationGrm             :abap_boolean,
//          _Subrogation_PL.Subrogation                  as Subrogation_PL,
//
//          @UI.hidden :#(HideSubrogation)
//          Subrogation,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSubrogation                :abap_boolean,
//
//          @UI.hidden :#(HideSubrogationAmountReceived)
//          SubrogationAmountReceived,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSubrogationAmountReceived  :abap_boolean,
//
//          @UI.hidden :#(HideSubrogationAmountSubmitted)
//          SubrogationAmountSubmitted,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSubrogationAmountSubmitted :abap_boolean,
//
//          @UI.hidden :#(HideSubrogationIndicatorDel)
//          @ObjectModel.text.element:  ['SubrogationInd_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SUBROGATION_IND_PL', element: 'Id' } }]
//          SubrogationIndicatorDel,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSubrogationIndicatorDel    :abap_boolean,
//          _SubrogationInd_PL.Subrogation_Indicator     as SubrogationInd_PL,
//
//          @UI.hidden :#(HideSubrogationSubmittedTo)
//          SubrogationSubmittedTo,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSubrogationSubmittedTo     :abap_boolean,
//
//          @UI.hidden :#(HideSuitFiledDate)
//          SuitFiledDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSuitFiledDate              :abap_boolean,
//
//          @UI.hidden :#(HideSuperintendent)
//          Superintendent,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSuperintendent             :abap_boolean,
//
//          @UI.hidden :#(HideSupervisorName)
//          SupervisorName,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSupervisorName             :abap_boolean,
//
//          @UI.hidden :#(HideSurveyReportYN)
//          @ObjectModel.text.element:  ['SurveyReport_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SURVEY_REPORT_PL', element: 'Id' } }]
//          SurveyReportYN,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSurveyReportYN             :abap_boolean,
//          _SurveyReport_PL.Survey_Report               as SurveyReport_PL,
//
//          @UI.hidden :#(HideSurveyRequested)
//          @ObjectModel.text.element:  ['SurveyRequest_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_SURVEY_REQUEST_PL', element: 'Id' } }]
//          SurveyRequested,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSurveyRequested            :abap_boolean,
//          _SurveyRequest_PL.Survey_Request             as SurveyRequest_PL,
//          //SurveyedAt,
//
//          @UI.hidden :#(HideSurveyorName)
//          SurveyorName,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideSurveyorName               :abap_boolean,
//
//          @UI.hidden :#(HideTakeoverIndicator)
//          TakeoverIndicator,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTakeoverIndicator          :abap_boolean,
//
//          @UI.hidden :#(HideTemporaryRepairs)
//          @ObjectModel.text.element:  ['TempRepairs_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_TEMPORARY_REPAIRS_PL', element: 'Id' } }]
//          TemporaryRepairs,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTemporaryRepairs           :abap_boolean,
//          _Temp_Repairs_PL.Temporary_Request           as TempRepairs_PL,
//          //TerminalsLoad,
//
//          @UI.hidden :#(HideThirdPartyInsuranceCoDel)
//          ThirdPartyInsuranceCoDel,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideThirdPartyInsuranceCoDel   :abap_boolean,
//
//          @UI.hidden :#(HideThirdPartyPolicyNumberDel)
//          ThirdPartyPolicyNumberDel,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideThirdPartyPolicyNumberDel  :abap_boolean,
//
//          @UI.hidden :#(HideTimbarDateSubrogation)
//          TimbarDateSubrogation,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTimbarDateSubrogation      :abap_boolean,
//
//          @UI.hidden :#(HideTimeBar)
//          TimeBar,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTimeBar                    :abap_boolean,
//
//          @UI.hidden :#(HideAccidentTime)
//          AccidentTime,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideAccidentTime               :abap_boolean,
//
//          @UI.hidden :#(HideTimebarDateCDel)
//          TimebarDateCDel,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTimebarDateCDel            :abap_boolean,
//
//          @UI.hidden :#(HideTimebarDateApmmVsInsurance)
//          TimebarDateApmmVsInsurance,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTimebarDateApmmVsInsurance :abap_boolean,
//
//          @UI.hidden :#(HideTimebarDateClaimantVsApmm)
//          TimebarDateClaimantVsApmm,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTimebarDateClaimantVsApmm  :abap_boolean,
//
//          @UI.hidden :#(HideTimebarDateSubrogation)
//          TimebarDateSubrogation,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTimebarDateSubrogation     :abap_boolean,
//
//          @UI.hidden :#(HideTotalDeductible)
//          TotalDeductible,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTotalDeductible            :abap_boolean,
//
//          @UI.hidden :#(HideTotalDeductibleCurr2)
//          TotalDeductibleCurr2,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTotalDeductibleCurr2       :abap_boolean,
//
//          @UI.hidden :#(HideTotalDeductibleCurr1)
//          TotalDeductibleCurr1,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTotalDeductibleCurr1       :abap_boolean,
//
//          @UI.hidden :#(HideTtlNoDamageBoxesPkgWeig)
//          TtlNoDamageBoxesPkgWeig,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTtlNoDamageBoxesPkgWeig    :abap_boolean,
//
//          @UI.hidden :#(HideTotalMiasShare)
//          TotalMiasShare,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTotalMiasShare             :abap_boolean,
//
//          @UI.hidden :#(HideTotalRepairCostDel)
//          TotalRepairCostDel,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTotalRepairCostDel         :abap_boolean,
//
//          @UI.hidden :#(HideTotalRepairCostRaw)
//          TotalRepairCostRaw,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTotalRepairCostRaw         :abap_boolean,
//
//          @UI.hidden :#(HideTotalRepairCostTotal)
//          TotalRepairCostTotal,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTotalRepairCostTotal       :abap_boolean,
//
//          @UI.hidden :#(HideTpaCarrierAccountCode)
//          TpaCarrierAccountCode,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTpaCarrierAccountCode      :abap_boolean,
//
//          @UI.hidden :#(HideTpaCarrierLookupDel)
//          TpaCarrierLookupDel,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTpaCarrierLookupDel        :abap_boolean,
//
//          @UI.hidden :#(HideTpaDate)
//          TpaDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTpaDate                    :abap_boolean,
//
//          @UI.hidden :#(HideTpaPaid)
//          TpaPaid,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTpaPaid                    :abap_boolean,
//
//          @UI.hidden :#(HideTpaReportLag)
//          TpaReportLag,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTpaReportLag               :abap_boolean,
//
//          @UI.hidden :#(HideTpaReserve)
//          TpaReserve,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTpaReserve                 :abap_boolean,
//
//          @UI.hidden :#(HideTradeUnion)
//          @ObjectModel.text.element:  ['TradeUnion_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_TRADE_UNION_PL', element: 'Id' } }]
//          TradeUnion,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTradeUnion                 :abap_boolean,
//          _TradeUnion_PL.Trade_Union                   as TradeUnion_PL,
//
//          @UI.hidden :#(HideTreatedInEmergencyRoomDel)
//          @ObjectModel.text.element:  ['EmergencyRoom_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_EMERGENCY_ROOM_PL', element: 'Id' } }]
//          TreatedInEmergencyRoomDel,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTreatedInEmergencyRoomDel  :abap_boolean,
//          _EmergencyRoom_PL.Emergency_Room             as EmergencyRoom_PL,
//
//          @UI.hidden :#(HideTrialDate)
//          TrialDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTrialDate                  :abap_boolean,
//
//          @UI.hidden :#(HideTruckingCompanyAddress)
//          TruckingCompanyAddress,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTruckingCompanyAddress     :abap_boolean,
//
//          @UI.hidden :#(HideTruckingCompanyCity)
//          TruckingCompanyCity,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTruckingCompanyCity        :abap_boolean,
//
//          @UI.hidden :#(HideTruckingCompanyContact)
//          TruckingCompanyContact,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTruckingCompanyContact     :abap_boolean,
//
//          @UI.hidden :#(HideTruckingCompanyName)
//          TruckingCompanyName,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTruckingCompanyName        :abap_boolean,
//
//          @UI.hidden :#(HideTruckingCompanyPhone)
//          TruckingCompanyPhone,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTruckingCompanyPhone       :abap_boolean,
//
//          @UI.hidden :#(HideTruckingCompanyZip)
//          TruckingCompanyZip,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTruckingCompanyZip         :abap_boolean,
//
//          @UI.hidden :#(HideTruckingCompanyState)
//          @ObjectModel.text.element:  ['TruckState_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_TRUCKING_CO_STATE_PL', element: 'Id' } }]
//          TruckingCompanyState,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTruckingCompanyState       :abap_boolean,
//          _TruckingState_PL.Trucking_Co_State          as TruckState_PL,
//
//          @UI.hidden :#(HideTypeOfPropertyDamaged)
//          @ObjectModel.text.element:  ['PropertyDamage_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_PROPERTY_DAMAGED_PL', element: 'Id' } }]
//          TypeOfPropertyDamaged,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTypeOfPropertyDamaged      :abap_boolean,
//          _PropertyDamaged_PL.Property_Damaged         as PropertyDamage_PL,
//
//          @UI.hidden :#(HideTypeOfWatercraftDamaged)
//          TypeOfWatercraftDamaged,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideTypeOfWatercraftDamaged    :abap_boolean,
//
//          @UI.hidden :#(HideUnderwritersReserveTotal)
//          UnderwritersReserveTotal,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideUnderwritersReserveTotal   :abap_boolean,
//
//          @UI.hidden :#(HideUninsuredUnderinsured)
//          @ObjectModel.text.element:  ['Uninsured_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_UNINSURED_PL', element: 'Id' } }]
//          UninsuredUnderinsured,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideUninsuredUnderinsured      :abap_boolean,
//          _Uninsured_PL.Uninsured                      as Uninsured_PL,
//
//          @UI.hidden :#(HideVehicleInspectionDate)
//          VehicleInspectionDate,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideVehicleInspectionDate      :abap_boolean,
//
//          @UI.hidden :#(HideVehicleLeaseDateDel)
//          VehicleLeaseDateDel,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideVehicleLeaseDateDel        :abap_boolean,
//
//          @UI.hidden :#(HideVehicleLeased)
//          @ObjectModel.text.element:  ['VehicleLeased_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_VEHICLE_LEASED_PL', element: 'Id' } }]
//          VehicleLeased,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideVehicleLeased              :abap_boolean,
//          _VehicleLeased_PL.Vehicle_Leased             as VehicleLeased_PL,
//
//
//          @UI.hidden :#(HideVehicleMake)
//          VehicleMake,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideVehicleMake                :abap_boolean,
//
//          @UI.hidden :#(HideClaimantVehicleMake)
//          ClaimantVehicleMake,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimantVehicleMake        :abap_boolean,
//
//          @UI.hidden :#(HideVehicleModel)
//          VehicleModel,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideVehicleModel               :abap_boolean,
//
//          @UI.hidden :#(HideClaimantVehicleModel)
//          ClaimantVehicleModel,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimantVehicleModel       :abap_boolean,
//
//          @UI.hidden :#(HideVehicleOwner)
//          VehicleOwner,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideVehicleOwner               :abap_boolean,
//
//          @UI.hidden :#(HideVehicleOwnerName)
//          VehicleOwnerName,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideVehicleOwnerName           :abap_boolean,
//
//          @UI.hidden :#(HideVehicleYear)
//          VehicleYear,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideVehicleYear                :abap_boolean,
//
//          @UI.hidden :#(HideClaimantVehicleYear)
//          ClaimantVehicleYear,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideClaimantVehicleYear        :abap_boolean,
//
//          @UI.hidden :#(HideProbability)
//          @ObjectModel.text.element:  ['VesselDiversion_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_VESSEL_DIVERSION_PL', element: 'Id' } }]
//          Probability,
//          _VesselDiversion_PL.Vessel_Diversion         as VesselDiversion_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideProbability                :abap_boolean,
//
//          @UI.hidden :#(HideVessel)
//          Vessel,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideVessel                     :abap_boolean,
//
//          @UI.hidden :#(HideVesselName)
//          VesselName,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideVesselName                 :abap_boolean,
//
//          @UI.hidden :#(HideVesselOperator)
//          @ObjectModel.text.element:  ['VesselOperator_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_VESSEL_OPERATOR_PL', element: 'Id' } }]
//
//          VesselOperator,
//          _VesselOperator_PL.Vessel_Operator           as VesselOperator_PL,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideVesselOperator             :abap_boolean,
//
//          @UI.hidden :#(HideVesselOwnerName)
//          VesselOwnerName,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideVesselOwnerName            :abap_boolean,
//
//          @UI.hidden :#(HideVesselAircraft)
//          VesselAircraft,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideVesselAircraft             :abap_boolean,
//
//          @UI.hidden :#(HideVoyage)
//          //  @UI: {
//          //              lineItem:       [ { position: 40, importance: #MEDIUM } ],
//          //              identification: [ { position: 40, hidden: #(testField)} ] }
//          Voyage,
//
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideVoyage                     :abap_boolean,
//
//          @UI.hidden :#(HideVoyageNumber)
//          VoyageNumber,
//          @ObjectModel.virtualElementCalculatedBy: 'ABAP:ZCL_GRC_VE_CONTROL_FIELDS'
//           @UI.hidden : true
//  virtual HideVoyageNumber               :abap_boolean,
//          @ObjectModel.text.element:  ['Weather_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_WEATHER_PL', element: 'Id' } }]
//
//          Weather,
//          _Weather_PL.Weather                          as Weather_PL,
//          WeeklyWages,
//          WhoOwnsProperty,
//          @ObjectModel.text.element:  ['WorkRelated_PL']
//          @UI.textArrangement: #TEXT_ONLY
//          @Consumption.valueHelpDefinition: [{ entity: { name: 'ZR_WORK_RELATED_PL', element: 'Id' } }]
//
//          WorkRelatedDel,
//          _WorkRelated_PL.Work_Related                 as WorkRelated_PL,
//          WorkRestrictionsDel,
//          YearOfLoss,
//          YearlyWagesDel,
//          Createdby,
//          Createdat,
//          Lastchangedby,
//          Lastchangedat,
          Location_UUID,
          _claim_trn : redirected to composition child ZC_TGRC_CLAIM_TRN_DEMO,
          _Location,
          //Picklist
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
//          _CompensationAct_PL,
//          _ConcurrentClaim_PL,
//          _ConditionClass_PL,
//          _ContainerSize_PL,
//          _ContainerType_PL,
//          _ContingentLiability_PL,
//          _Controverted_PL,
//          _Court_PL,
//          _CrewNationality_PL,
//          _CrewRank_PL,
//          _DA_Appointed_PL,
//          _DA_Firm_PL,
//          _DA_Damage_PL,
//          _3PCAUSED_DAMAGE_PL,
//          _DCLI_Employee_PL,
//          _Description_PL,
//          _UsualWork_PL,
//          _DriverState_PL,
//          _EligibleBenefits_PL,
//          _EmployerPremises_PL,
//          _EquipmentType_PL,
//          _EventType_PL,
//          _Expectation_PL,
//          _Fatality_PL,
//          _Place_Receipt_PL,
//          _FitnessDuty_PL,
//          _FleetManager_PL,
//          _GLBMOwner_PL,
//          _HealthState_PL,
//          _HospitalOVernight_PL,
//          _HSCode_PL,
//          _HSSELearning_PL,
//          _InLitigation_PL,
//          _Injured_PL,
//          _InjuryDeath_PL,
//          _InjuryType_PL,
//          _InsuranceCarrier_PL,
//          _InsuranceSurvey_PL,
//          _LegalStatus_PL,
//          _LightConditions_PL,
//          _Litigation_PL,
//          _LitigationStatus_PL,
//          _LongTerm_PL,
//          _LossCountry_PL,
//          _LossJurisdiction_PL,
//          _LossState_PL,
//          _LostTime_PL,
//          _MaerskComp_PL,
//          _MainActivity_PL,
//          _MainCasualty_PL,
//          _MainCause_PL,
//          _MainEvent_PL,
//          _MedicalTreatment_PL,
//          _MedicareLien_PL,
//          _MedicareReport_PL,
//          _MescEmployee_PL,
//          _NatureInjury_PL,
//          _DisabilityPeriod_PL,
//          _Occupation_PL,
//          _OCL_PL,
//          _OCU_Claim_PL,
//          _OffsiteTreatment_PL,
//          _OSHARecord_PL,
//          _OtherVehicles_PL,
//          _PIClub_PL,
//          _PA_Appointed_PL,
//          _PartGeneral_PL,
//          _PermanentRepairs_PL,
//          _PhysicalFile_PL,
//          _Preventable_PL,
//          _RecoveryPursued_PL,
//          _RecoveryStatus_PL,
//          _RedFlag_PL,
//          _PortRepairs_PL,
//          _Repatriation_PL,
//          _Responsible3PC_PL,
//          _ResponsiblePC_PL,
//          _RootCause_PL,
//          _RouteCode_PL,
//          _Salvage_PL,
//          _SettlementStatus_PL,
//          _Severity_PL,
//          _SourceGeneral_PL,
//          _Specification_PL,
//          _StateFiled_PL,
//          _StateFundRecov_PL,
//          _StateEmployment_PL,
//          _StateJurisdiction_PL,
//          _SubType_PL,
//          _SubmitTPA_PL,
//          _SubmitReimburse_PL,
//          _Submit3P_PL,
//          _Subrogation_PL,
//          _SubrogationInd_PL,
//          _SurveyReport_PL,
//          _SurveyRequest_PL,
//          _Temp_Repairs_PL,
//          _TradeUnion_PL,
//          _EmergencyRoom_PL,
//          _TruckingState_PL,
//          _PropertyDamaged_PL,
//          _Uninsured_PL,
//          _VehicleLeased_PL,
//          _VesselDiversion_PL,
//          _VesselOperator_PL,
//          _Weather_PL,
//          _WorkRelated_PL,
          _ClaimRecType_PL


}
