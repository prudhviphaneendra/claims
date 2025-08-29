@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Coverae Major Type Dependency'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_CMAJORTYPE_DEPEND_GRP
  as select from ztgrc_claim_depd
{

  key record_type       as recordtype,
  key recordtype_id     as recordtypeid,
  key coverage_major    as CoverageMajor,
  key coverage_major_id as CoverageMajorID


}
group by
  recordtype_id,
  record_type,

  coverage_major_id,
  coverage_major;


//group by recordtype_id, record_type,accident_type_id, accident_type;
