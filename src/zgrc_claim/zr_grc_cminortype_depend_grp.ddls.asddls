@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Coverae Major Type Dependency'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_CMINORTYPE_DEPEND_GRP
  as select from ztgrc_claim_depd
{

key coverage_major as CoverageMajor,
key coverage_major_id as CoverageMajorID,
key coverage_minor as CoverageMinor,
key coverage_minor_id as CoverageMinorID

}
group by
coverage_major_id, coverage_major,

coverage_minor_id, coverage_minor;



//group by recordtype_id, record_type,accident_type_id, accident_type;
