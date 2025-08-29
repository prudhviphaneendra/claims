@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Main Cause Dependecy'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_MAINCAUSE_DEPENDENCY as select from ZR_GRC_MAINCAUSE_DEPEND_GRP
{
   @UI.hidden: true
    key MainEvent,
      @UI.hidden: true
    key MainEventID,
      @UI.hidden: true
    key MainCause,
    key MainCauseID
}
