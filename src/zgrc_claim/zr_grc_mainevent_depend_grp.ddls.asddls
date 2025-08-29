@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Main Event Dependency'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_MAINEVENT_DEPEND_GRP
  as select from ztgrc_claim_depd
{

  key coverage_minor    as CoverageMinor,
  key coverage_minor_id as CoverageMinorID,
  key main_event        as MainEvent,
  key main_event_id     as MainEventID

}
group by
  coverage_minor_id,
  coverage_minor,

  main_event_id,
  main_event;


