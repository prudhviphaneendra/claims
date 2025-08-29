@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Crew Rank Dependency'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_CREWRANK_DEPEND_GRP
  as select from ztgrc_claim_depd
{

  key main_event    as MainEvent,
  key main_event_id as MainEventID,
  key crew_rank     as CrewRank,
  key crew_rank_id  as CrewRankID


}
group by
  main_event_id,
  main_event,
  crew_rank_id,
  crew_rank;
