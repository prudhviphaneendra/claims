@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Main Casualty Dependency'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_MAINCASUALTY_DEPEND_GRP
  as select from ztgrc_claim_depd
{

  key main_event    as MainEvent,
  key main_event_id as MainEventID,
  key main_casualty_id     as MainCasualityID,
  key main_casualty  as MainCasuality


}
group by
  main_event_id,
  main_event,
  main_casualty_id,
  main_casualty;
