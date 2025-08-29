@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZR_GRC_EQPINFRATYPE_DEPENDENCY'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_EQPINFRATYPE_DEPENDENCY as select from ZR_GRC_EQPINFRATYPE_DEPEND_GRP
{
    @UI.hidden: true
    key TypeofPropertyDamaged,
    @UI.hidden: true
    key TypeofPropertyDamagedID,
    key EquipmentInfraType,
    @UI.hidden: true
    key EquipmentInfraTypeID
}
where EquipmentInfraType <> '';
