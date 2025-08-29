@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Equip Infra Type Dependency'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_EQPINFRATYPE_DEPEND_GRP
  as select from ztgrc_prtyp_depn
{
 
  key  type_of_property_damaged    as TypeofPropertyDamaged,
  key  type_of_property_damaged_id as TypeofPropertyDamagedID,
  key equipment_infra_type as EquipmentInfraType,
  key equipment_infra_type_id as EquipmentInfraTypeID

}
group by
  type_of_property_damaged_id,
  type_of_property_damaged,
  equipment_infra_type_id, 
  equipment_infra_type;

//group by recordtype_id, record_type,accident_type_id, accident_type;
