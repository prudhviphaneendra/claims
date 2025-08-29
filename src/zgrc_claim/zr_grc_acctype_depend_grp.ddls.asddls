@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Accident Type Dependency'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_ACCTYPE_DEPEND_GRP as select from ztgrc_actyp_depn
{ 
 key recordtype_id as RecordtypeId,  
  key  record_type as RecordType, 
  key accident_type_id as accidenttypeid,
  key  accident_type as accidenttype
  
    }
group by recordtype_id, record_type,accident_type_id, accident_type;
//group by recordtype_id, record_type,accident_type_id, accident_type;
