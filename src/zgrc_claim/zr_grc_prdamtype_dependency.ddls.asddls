@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZR_GRC_PRDAMTYPE_DEPENDENCY'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_PRDAMTYPE_DEPENDENCY as select from ZR_GRC_PRDAMTYPE_DEPEND_GRP
{
@UI.hidden: true
    key RecordtypeId,
    @UI.hidden: true
    key RecordType,
    @UI.hidden: true
    key TypeofPropertyDamagedID,
    key TypeofPropertyDamaged
       
}
where TypeofPropertyDamaged <> '';
