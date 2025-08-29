@AbapCatalog.viewEnhancementCategory: [#NONE]
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'View Entity for Activity Dependency'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.usageType:{
    serviceQuality: #X,
    sizeCategory: #S,
    dataClass: #MIXED
}
define view entity ZR_GRC_ACVT_DEPENDENCY as select from ztgrc_acvt_depn
{
   @UI.hidden: true
   key record_type as RecordType,
      @UI.hidden: true
    key recordtype_id as RecordtypeId,
   key activity as Activity,
      @UI.hidden: true
   key activity_id as ActivityId
}
