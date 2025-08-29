@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZR_GRC_CMINORTYPE_DEPENDENCY'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_CMINORTYPE_DEPENDENCY
  as select from ZR_GRC_CMINORTYPE_DEPEND_GRP
{
      @UI.hidden: true
  key CoverageMajor,
      @UI.hidden: true

  key CoverageMajorID,
  key CoverageMinor,
      @UI.hidden: true
  key CoverageMinorID
}

where
  CoverageMinor <> ''
