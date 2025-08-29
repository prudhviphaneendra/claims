@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZR_GRC_CREWRANK_DEPENDENCY'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_CREWRANK_DEPENDENCY as select from ZR_GRC_CREWRANK_DEPEND_GRP
{
    @UI.hidden: true
    key MainEvent,
    @UI.hidden: true
    key MainEventID,
    key CrewRank,
    @UI.hidden: true
    key CrewRankID
}
where CrewRank <>''
