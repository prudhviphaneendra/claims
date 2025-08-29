@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Main Cause Dependency'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_MAINCAUSE_DEPEND_GRP
  as select from ztgrc_claim_depd
{
key main_event as MainEvent,
key main_event_id as MainEventID,
key main_cause as MainCause,
key main_cause_id as MainCauseID

}
group by
main_event, main_event_id,

main_cause_id, main_cause;

