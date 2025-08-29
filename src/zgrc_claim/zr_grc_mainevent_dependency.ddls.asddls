@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZR_GRC_MAINEVENT_DEPENDENCY'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_MAINEVENT_DEPENDENCY as select from ZR_GRC_MAINEVENT_DEPEND_GRP
{
    @UI.hidden: true
    key CoverageMinor,
    @UI.hidden: true
    key CoverageMinorID,
    key MainEvent,
    @UI.hidden: true
    key MainEventID
}

where MainEvent <> ''
