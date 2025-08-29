@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for SUB TYPE Dependency'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_SUBTYPE_DEPEND_GRP as select from ztgrc_actyp_depn
{ 
 
  key accident_type_id as accidenttypeid,
  key  accident_type as accidenttype,
  
  key sub_type_id  as subtypeid ,  
  key  sub_type  as subtype 
  
    }
group by accident_type_id, accident_type,sub_type_id, sub_type;
