@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Property Damaged Type Dependency'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_PRDAMTYPE_DEPEND_GRP
  as select from ztgrc_prtyp_depn
{
  key  recordtype_id               as RecordtypeId,
  key  record_type                 as RecordType,
  key  type_of_property_damaged    as TypeofPropertyDamaged,
  key  type_of_property_damaged_id as TypeofPropertyDamagedID

}
group by
  recordtype_id,
  record_type,
  type_of_property_damaged_id,
  type_of_property_damaged;

//group by recordtype_id, record_type,accident_type_id, accident_type;
