@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'ZR_GRC_CMAJORTYPE_DEPENDENCY'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_CMAJORTYPE_DEPENDENCY as select from ZR_GRC_CMAJORTYPE_DEPEND_GRP
{
@UI.hidden: true
    key recordtype,
    @UI.hidden: true
    key recordtypeid,
    key CoverageMajor,
    @UI.hidden: true
    key CoverageMajorID
}

where CoverageMajor <> '';
