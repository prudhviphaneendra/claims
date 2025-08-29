@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZR_GRC_SUBTYPE_DEPENDENCY'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_SUBTYPE_DEPENDENCY as select from ZR_GRC_SUBTYPE_DEPEND_GRP
{
@UI.hidden: true
    key accidenttypeid,
    @UI.hidden: true
    key accidenttype,
    @UI.hidden: true
    key subtypeid,
    key subtype
}

where subtype <> '';
 