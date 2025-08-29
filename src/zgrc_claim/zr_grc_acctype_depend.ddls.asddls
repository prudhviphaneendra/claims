@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZR_GRC_ACCTYPE_DEPENDENDCY'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_ACCTYPE_DEPEND as select from ZR_GRC_ACCTYPE_DEPEND_GRP
{
 
     @UI.hidden: true
    key RecordtypeId,
     @UI.hidden: true
    key RecordType,
     @UI.hidden: true
    key accidenttypeid,
   
    key accidenttype
}
