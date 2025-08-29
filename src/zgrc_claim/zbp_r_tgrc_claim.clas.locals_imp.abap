CLASS lsc_zr_tgrc_claim DEFINITION INHERITING FROM cl_abap_behavior_saver.

  PROTECTED SECTION.

    METHODS save_modified REDEFINITION.

ENDCLASS.

CLASS lsc_zr_tgrc_claim IMPLEMENTATION.

  METHOD save_modified.


*DATA : lt_claim TYPE STANDARD TABLE OF ztgrc_claim,
*       lt_claim_tran TYPE STANDARD TABLE OF ztgrc_claim_trn.
*
* IF update-claim IS NOT INITIAL.
* lt_claim  = CORRESPONDING #( update-claim  ).
** lt_claim_tran = CORRESPONDING #( update-claim ).
* ENDIF.
*
*  IF create-claim  IS NOT INITIAL.
*  lt_claim = CORRESPONDING #( create-claim ).
**lt_asset_value = CORRESPONDING #( create-assetval ).
*ENDIF..
*
* IF lt_claim IS not INITIAL.
*  LOOP AT lt_claim ASSIGNING FIELD-SYMBOL(<ls_claim>).
*<ls_claim>-claim_external_id = <ls_claim>-claim_external_id+0(6).
*  ENDLOOP.
*MODIFY ztgrc_claim FROM TABLE @lt_claim.
*
*  endif.


    DATA: lv_claimuuid TYPE ztgrc_claim-claim_uuid.

    IF update-claim_trn IS NOT INITIAL.
      READ TABLE update-claim_trn INTO DATA(ls_saveupdate) INDEX 1.
      lv_claimuuid = ls_saveupdate-ClaimUuid.
    ELSEIF  create-claim_trn IS NOT INITIAL.
      READ TABLE create-claim_trn INTO DATA(ls_savecreate) INDEX 1.
      lv_claimuuid = ls_savecreate-ClaimUuid.
    ELSEIF  delete-claim_trn IS NOT INITIAL.
      READ TABLE delete-claim_trn INTO DATA(ls_savedelete) INDEX 1.
      lv_claimuuid = ls_savedelete-ClaimUuid.
    ENDIF.

    IF lv_claimuuid IS NOT INITIAL.
      READ ENTITIES OF zr_tgrc_claim IN LOCAL MODE
        ENTITY claim
        FIELDS ( GrossIncurredCurr1 )
        WITH VALUE #( ( ClaimUuid = lv_claimuuid ) )
        RESULT DATA(lt_claim_mtx).

      READ ENTITIES OF zr_tgrc_claim IN LOCAL MODE
        ENTITY claim BY \_Claim_trn
         ALL FIELDS
         WITH VALUE #( ( ClaimUuid = lv_claimuuid ) )
       RESULT DATA(lt_claimtrn_mtx).


      DATA : lv_medical_bi_paid       TYPE ztgrc_claim_trn-amount,
             lv_medical_bi_incurred   TYPE ztgrc_claim_trn-amount,
             lv_indemnity_pd_paid     TYPE ztgrc_claim_trn-amount,
             lv_indemnity_pd_incurred TYPE ztgrc_claim_trn-amount,
             lv_expense_paid          TYPE ztgrc_claim_trn-amount,
             lv_expense_incurred      TYPE ztgrc_claim_trn-amount,
             lv_insurance_paid        TYPE ztgrc_claim_trn-amount,
             lv_insurance_reserve     TYPE ztgrc_claim_trn-amount,
             lv_recovery_paid         TYPE ztgrc_claim_trn-amount,
             ls_fin_matrix            TYPE ztgrc_claim_mtrx,
             lt_fin_matrix            TYPE TABLE OF ztgrc_claim_mtrx,
             lv_matrix_uuid           TYPE ztgrc_claim_trn-claim_uuid,
             lv_currcode              TYPE ztgrc_claim_trn-currency_code.


      IF lt_claimtrn_mtx IS NOT INITIAL.
        LOOP AT lt_claimtrn_mtx ASSIGNING FIELD-SYMBOL(<lf_claimtrn>).

          lv_matrix_uuid = <lf_claimtrn>-ClaimUuid.
          lv_currcode    = <lf_claimtrn>-CurrencyCode.

          CASE <lf_claimtrn>-ClaimTrnRecType.

            WHEN 500057. " Payment
              CASE <lf_claimtrn>-Category.
                WHEN 506455. " BI/Medical
                  lv_medical_bi_paid += <lf_claimtrn>-Amount.
                WHEN 506463. " PD/Indemnity
                  lv_indemnity_pd_paid += <lf_claimtrn>-Amount.
                WHEN 506459. " Expense
                  lv_expense_paid += <lf_claimtrn>-Amount.
              ENDCASE.

            WHEN 500058. " Reserve
              CASE <lf_claimtrn>-Category.
                WHEN 506455. " BI/Medical
                  lv_medical_bi_incurred += <lf_claimtrn>-Amount.
                WHEN 506463. " PD/Indemnity
                  lv_indemnity_pd_incurred += <lf_claimtrn>-Amount.
                WHEN 506459. " Expense
                  lv_expense_incurred += <lf_claimtrn>-Amount.
              ENDCASE.

            WHEN 500059. " Recovery
              CASE <lf_claimtrn>-Category.
                WHEN 506468. " Insurance Carrier
                  lv_insurance_paid += <lf_claimtrn>-Amount.
                WHEN 506467. " 3rd Party
                  lv_recovery_paid += <lf_claimtrn>-Amount.
              ENDCASE.

          ENDCASE.

        ENDLOOP.

        "Insurance Reserve
        IF lt_claim_mtx IS NOT INITIAL.
          DATA(ls_claim_mtx) = lt_claim_mtx[ 1 ].
          lv_insurance_reserve = COND #(
            WHEN ls_claim_mtx-GrossIncurred - ls_claim_mtx-StarsDeductible > 0
            THEN ls_claim_mtx-GrossIncurred - ls_claim_mtx-StarsDeductible
            ELSE 0 ).

        ENDIF.

        lt_fin_matrix = VALUE #(
          ( claim_uuid    = lv_matrix_uuid
            category      = 'BI/Medical'
            paid          = lv_medical_bi_paid
            outstanding   = lv_medical_bi_incurred - lv_medical_bi_paid
            incurred      = lv_medical_bi_incurred
            currency_code = lv_currcode )

          ( claim_uuid    = lv_matrix_uuid
            category      = 'PD/Indemnity'
            paid          = lv_indemnity_pd_paid
            outstanding   = lv_indemnity_pd_incurred - lv_indemnity_pd_paid
            incurred      = lv_indemnity_pd_incurred
            currency_code = lv_currcode )

          ( claim_uuid    = lv_matrix_uuid
            category      = 'Expense'
            paid          = lv_expense_paid
            outstanding   = lv_expense_incurred - lv_expense_paid
            incurred      = lv_expense_incurred
            currency_code = lv_currcode )

          ( claim_uuid    = lv_matrix_uuid
            category      = 'Total'
            paid          = lv_medical_bi_paid + lv_indemnity_pd_paid + lv_expense_paid
            outstanding   = ( lv_medical_bi_incurred - lv_medical_bi_paid ) +
                            ( lv_indemnity_pd_incurred - lv_indemnity_pd_paid ) +
                            ( lv_expense_incurred - lv_expense_paid )
            incurred      = lv_medical_bi_incurred + lv_indemnity_pd_incurred + lv_expense_incurred
            currency_code = lv_currcode )

          ( claim_uuid    = lv_matrix_uuid
            category      = 'Insurance Payment'
            paid          = lv_insurance_paid
            incurred      = lv_insurance_paid
            currency_code = lv_currcode )

            ( claim_uuid    = lv_matrix_uuid
            category      = 'Insurance Reserve'
            paid          = lv_insurance_reserve
            incurred      = lv_insurance_reserve
            currency_code = lv_currcode )

          ( claim_uuid    = lv_matrix_uuid
            category      = 'Recovery 3rd Party'
            paid          = lv_recovery_paid
            incurred      = lv_recovery_paid
            currency_code = lv_currcode )

          ( claim_uuid    = lv_matrix_uuid
            category      = 'Net Total'
            paid          = lv_medical_bi_paid + lv_indemnity_pd_paid + lv_expense_paid +
                             lv_insurance_paid + lv_insurance_reserve + lv_recovery_paid

            outstanding   = ( lv_medical_bi_incurred - lv_medical_bi_paid ) +
                            ( lv_indemnity_pd_incurred - lv_indemnity_pd_paid ) +
                            ( lv_expense_incurred - lv_expense_paid )
            incurred      = lv_medical_bi_incurred + lv_indemnity_pd_incurred + lv_expense_incurred +
                             lv_insurance_paid + lv_insurance_reserve + lv_recovery_paid
            currency_code = lv_currcode )
        ).

        IF lt_fin_matrix IS NOT INITIAL.
          MODIFY ztgrc_claim_mtrx FROM TABLE @lt_fin_matrix.
        ENDIF.

      ELSE.
        DELETE FROM ztgrc_claim_mtrx WHERE claim_uuid = @lv_claimuuid.
      ENDIF.
    ENDIF.


  ENDMETHOD.

ENDCLASS.

CLASS lhc_claim_trn DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS precheck_update FOR PRECHECK
      IMPORTING entities FOR UPDATE claim_trn.

    TYPES :
      t_entities_update   TYPE TABLE FOR UPDATE  zr_tgrc_claim\\claim_trn,
      t_failed_claimtrn   TYPE TABLE FOR FAILED   EARLY zr_tgrc_claim_trn,
      t_reported_claimtrn TYPE TABLE FOR REPORTED EARLY zr_tgrc_claim_trn.

    METHODS :
      precheck_claimtransaction
        IMPORTING
          entities_update TYPE t_entities_update OPTIONAL
        CHANGING
          failed          TYPE t_failed_claimtrn
          reported        TYPE t_reported_claimtrn.

ENDCLASS.

CLASS lhc_claim_trn IMPLEMENTATION.

  METHOD precheck_update.

    precheck_claimtransaction(
           EXPORTING
             entities_update = entities
           CHANGING
             failed          = failed-claim_trn
             reported        = reported-claim_trn
         ).
  ENDMETHOD.

  METHOD precheck_claimtransaction.


    DATA:
      lt_entities       TYPE t_entities_update,
      lv_operation      TYPE if_abap_behv=>t_char01,
      is_modify_granted TYPE abap_bool.


    lt_entities = entities_update.
    lv_operation = if_abap_behv=>op-m-update.


    DATA : lt_check_claim_tran TYPE TABLE FOR UPDATE zr_tgrc_claim\\claim_trn.


    LOOP AT lt_entities INTO DATA(ls_claimtrn).


      READ ENTITIES OF zr_tgrc_claim IN LOCAL MODE
           ENTITY claim
            ALL FIELDS WITH VALUE #( ( ClaimUuid = ls_claimtrn-ClaimUuid ) )
          RESULT DATA(lt_claim).

      DATA(ls_claim) = VALUE #(  lt_claim[  ls_claimtrn-ClaimUuid  ] OPTIONAL ).

      READ ENTITIES OF zr_tgrc_claim IN LOCAL MODE
           ENTITY claim BY \_Claim_trn
            ALL FIELDS WITH VALUE #( ( ClaimUuid = ls_claimtrn-ClaimUuid ) )
          RESULT DATA(lt_claimtrn).
      IF lt_claimtrn IS NOT INITIAL.
        APPEND INITIAL LINE TO lt_check_claim_tran ASSIGNING FIELD-SYMBOL(<ls_claim_check>).

        <ls_claim_check> = CORRESPONDING #( lt_claimtrn[ 1 ] ).
        <ls_claim_check> = CORRESPONDING #( BASE ( <ls_claim_check> ) ls_claimtrn USING CONTROL ).
      ENDIF.
    ENDLOOP.
    LOOP AT lt_check_claim_tran INTO ls_claimtrn .



*Admin_only_for_TPA_Transaction_Codes    Non-admins are not allowed to use TPA Transaction Codes. Please change the transaction code.
*Expse_Paymts_cant_be_less_total_exp_paid    Expense payment cannot be less than the total expenses paid
*      IF ls_claimtrn-ex <  cl_abap_context_info=>get_system_date( ).
*
*
*          APPEND VALUE #( %key = ls_claimtrn-%key
*                          %update = if_abap_behv=>mk-on ) TO failed-claim_transaction.
*          APPEND VALUE #( %key = ls_claimtrn-%key
*                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
*                                                        text = 'Expense payment cannot be less than the total expenses paid.' )
*                          %update = if_abap_behv=>mk-on
*                          %element-AccountingDate = if_abap_behv=>mk-on
*                         ) TO reported-claim_transaction.
*        ENDIF.
*Indem_Paymts_cant_be_less_total_Ind_paid    Indemnity payment cannot be less than the total Indemnity paid
*      IF ls_claimtrn-IndemnityPdPaid <  ls_claimtrn-TotalReserve.
*
*
*          APPEND VALUE #( %key = ls_claimtrn-%key
*                          %update = if_abap_behv=>mk-on ) TO failed-claim_transaction.
*          APPEND VALUE #( %key = ls_claimtrn-%key
*                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
*                                                        text = 'Expense payment cannot be less than the total expenses paid.' )
*                          %update = if_abap_behv=>mk-on
*                          %element-AccountingDate = if_abap_behv=>mk-on
*                         ) TO reported-claim_transaction.
*        ENDIF.
*Insufficient_Expense_Reserve    Not Enough Expense Reserve to Post Transaction
*Insufficient_Indemnity_Reserve  Not Enough Indemnity / Property Damage Reserve to Post Transaction
*Insufficient_Medical_Reserve    Not Enough Medical /Bodily Injury Reserve to Post Transaction
*Invalid_Transaction_Code    TPA transaction codes are not available for this profile type. Please pick another option.
*Med_Paymts_cant_be_less_total_Med_paid  Medical payment cannot be less than the total Medical paid
*No_Payments_on_a_Closed_Claim   No transactions are permitted on a closed claim. Reopen the claim then post a transaction.
*NonUserEnteredTransactionsCannotBeMod   Non-User-Entered Transactions Cannot Be Modified.
*
*Payment_cannot_be_less_than_Total_Paid  Payments cannot be less than the total already paid
*TPA_Data_No_New_Transactions    Cannot change add transaction to a TPA handled claim.
*TPATransactionsCannotBeModified TPA Transactions Cannot Be Modified.
*
*    If you believe you SHOULD be able to edit this transaction, please contact your system administrator and tell them the validation rule to check is TPATransactionsCannotBeModified.
*Error message to user if master claims record field TPA_Carrier
* picklist value = "Signal" OR "Sedgwick CMS" OR "Gallagher Bassett"
*    IF ls_claim-TpaCarrier = 'Signal' OR
*    ls_claim-TpaCarrier = 'Sedgwick CMS' OR
*    ls_claim-TpaCarrier = 'Gallagher Bassett'.
*
*
*    ENDIF.
    ENDLOOP.


  ENDMETHOD.

ENDCLASS.

CLASS lhc_zr_tgrc_claim DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.
    METHODS:
      get_global_authorizations FOR GLOBAL AUTHORIZATION
        IMPORTING
        REQUEST requested_authorizations FOR Claim
        RESULT result,
      Payment FOR MODIFY
        IMPORTING keys FOR ACTION Claim~payment RESULT result,
      copyclaim FOR MODIFY
        IMPORTING keys FOR ACTION Claim~copyclaim,
      precheck_create FOR PRECHECK
        IMPORTING entities FOR CREATE Claim.

    METHODS precheck_update FOR PRECHECK
      IMPORTING entities FOR UPDATE Claim.
    METHODS get_instance_features FOR INSTANCE FEATURES
      IMPORTING keys REQUEST requested_features FOR Claim RESULT result.
    METHODS closeclaim FOR MODIFY
      IMPORTING keys FOR ACTION claim~closeclaim RESULT result.
    METHODS get_global_features FOR GLOBAL FEATURES
      IMPORTING REQUEST requested_features FOR claim RESULT result.
    METHODS get_instance_authorizations FOR INSTANCE AUTHORIZATION
      IMPORTING keys REQUEST requested_authorizations FOR claim RESULT result.
    METHODS claimrectype FOR DETERMINE ON SAVE
      IMPORTING keys FOR claim~claimrectype.
    METHODS determine_rectype FOR DETERMINE ON MODIFY
      IMPORTING keys FOR claim~determine_rectype.

    TYPES :
      t_entities_create TYPE TABLE FOR CREATE zr_tgrc_claim\\claim,
      t_entities_update TYPE TABLE FOR UPDATE  zr_tgrc_claim\\claim,
      t_failed_claim    TYPE TABLE FOR FAILED   EARLY zr_tgrc_claim,
      t_reported_claim  TYPE TABLE FOR REPORTED EARLY zr_tgrc_claim.

    METHODS :
      precheck_claim
        IMPORTING
          entities_create TYPE t_entities_create OPTIONAL
          entities_update TYPE t_entities_update OPTIONAL
        CHANGING
          failed          TYPE t_failed_claim
          reported        TYPE t_reported_claim.

ENDCLASS.

CLASS lhc_zr_tgrc_claim IMPLEMENTATION.
  METHOD get_global_authorizations.
*    zbp_r_tgrc_claim=>lv_control = abap_true.
*  IF requested_authorizations-%create = if_abap_behv=>mk-on.
*    AUTHORITY-CHECK OBJECT 'Z_CLAIM_O'
*          ID 'ACTVT' FIELD '01'
*          ID 'Z_CLREC_F' DUMMY
*          id 'Z_CLLOC_F' dummy.
*    IF sy-subrc <> 0.
*      result-%create = if_abap_behv=>auth-unauthorized.
*      APPEND VALUE #( %msg      = new_message_with_text(
*                      severity = if_abap_behv_message=>severity-error
*                      text = 'operation not authorized!' ) )
*                      TO reported-claim.
*    ENDIF.
*  ENDIF.

  ENDMETHOD.
  METHOD Payment.
    DATA(lt_tab) = 1.
  ENDMETHOD.

  METHOD copyclaim.

    DATA:
      claim    TYPE TABLE FOR CREATE zr_tgrc_claim,
      claimtrn TYPE TABLE FOR CREATE zr_tgrc_claim\\claim\_claim_trn.

    " remove travel instances with initial %cid (i.e., not set by caller API)
    READ TABLE keys WITH KEY %cid = '' INTO DATA(key_with_inital_cid).
    ASSERT key_with_inital_cid IS INITIAL.

    " read the data from the travel instances to be copied
    READ ENTITIES OF zr_tgrc_claim IN LOCAL MODE
       ENTITY claim
       ALL FIELDS WITH CORRESPONDING #( keys )
    RESULT DATA(lt_claim_read_result)
    FAILED failed.


    READ ENTITIES OF zr_tgrc_claim IN LOCAL MODE
         ENTITY claim BY \_Claim_trn
          ALL FIELDS WITH CORRESPONDING #( lt_claim_read_result )
        RESULT DATA(lt_claimtrn_read_result).

    LOOP AT lt_claim_read_result ASSIGNING FIELD-SYMBOL(<ls_claim_read_result>).
      " fill in travel container for creating new travel instance
      APPEND VALUE #( %cid      = keys[ KEY entity %key = <ls_claim_read_result>-%key ]-%cid
                     %is_draft = keys[ KEY entity %key = <ls_claim_read_result>-%key ]-%param-%is_draft
                     %data     = CORRESPONDING #( <ls_claim_read_result> EXCEPT claimuuid )
                  )
      TO claim ASSIGNING FIELD-SYMBOL(<ls_new_claim>).

      "Fill %cid_ref of travel as instance identifier for cba booking
      APPEND VALUE #( %cid_ref = keys[ KEY entity %key = <ls_claim_read_result>-%key ]-%cid )
        TO claimtrn ASSIGNING FIELD-SYMBOL(<ls_claimtrn>).


      <ls_new_claim>-ClaimExternalId = 'Clone_' && cl_abap_context_info=>get_system_time( ).


      LOOP AT lt_claimtrn_read_result ASSIGNING FIELD-SYMBOL(<ls_claim_tran>) USING KEY entity WHERE ClaimUuid EQ <ls_claim_read_result>-ClaimUuid.

        APPEND VALUE #( %cid     = keys[ KEY entity %key = <ls_claim_read_result>-%key ]-%cid && <ls_claim_tran>-ClaimTrnUuid
                        %data    = CORRESPONDING #( lt_claimtrn_read_result[ KEY entity %key = <ls_claim_tran>-%key ] EXCEPT  ClaimUuid ) )
          TO <ls_claimtrn>-%target ASSIGNING FIELD-SYMBOL(<ls_new_claim_tran>).

        <ls_new_claim_tran>-ClaimTrnExternalId = 'Clone_Trn' && cl_abap_context_info=>get_system_time( ).

      ENDLOOP.

    ENDLOOP.

    " create new BO instance
    MODIFY ENTITIES OF  zr_tgrc_claim IN LOCAL MODE
       ENTITY claim
       CREATE FIELDS
       (


     ClaimExternalId
     ClaimRecType
     X2ndWitness
     X3rdPartyClaimSubmittedTo
     X3rdPartyClaimsReceivedTtl
     X3rdPartyClaimsSettledTtl
     X3rdPartyPropertyDamage
     X3rdPartyLiability
     X3rdPartyRecoveriesUsd
     X3rdRecoveryObtainedFormula

      )
          WITH claim
*ENTITY claim
       CREATE BY \_Claim_trn AUTO FILL CID
        FIELDS (

     ClaimTrnUuid
     ClaimTrnExternalId
     ClaimTrnRecType
     Adjustment
     Amount
     BankAccountNumber
     Category
     CheckNumber
     CheckStatus
     CoverageMajor
     CurrencyCode
     CurrencyLookup
     DateCheckCleared )
           WITH claimtrn
       MAPPED DATA(mapped_create).

*MODIFY ENTITIES OF  zr_grc_mi_claimreg IN LOCAL MODE
*ENTITY claim
*CREATE FROM claimreg
* CREATE BY \_claim_transaction  FROM claimtrn_cba
*MAPPED DATA(mapped_create)
*FAILED DATA(mapped_create)
*REPORTED DATA(mapped_create).

    " set the new BO instances
    mapped-claim  =  mapped_create-claim.

  ENDMETHOD.

  METHOD precheck_create.
    "Begin of change by PPT020
*    DATA(lt_claim_cre) = entities.
*    IF lt_claim_cre IS NOT INITIAL.
*      SELECT location_uuid,level_1_id FROM ztgrc_locationx
*            FOR ALL ENTRIES IN @lt_claim_cre WHERE level_1_id = @lt_claim_cre-InsuredName INTO TABLE @DATA(lt_location).
*
*
*
*    ENDIF.
*    LOOP AT entities ASSIGNING FIELD-SYMBOL(<fs_entity>).
*      DATA(lv_uuid) = VALUE zgrc_clmloc_char( lt_location[ level_1_id = <fs_entity>-InsuredName ]-location_uuid OPTIONAL ).
*  AUTHORITY-CHECK OBJECT 'Z_CLAIM_O'
*      ID 'ACTVT' FIELD '02'
*      ID 'Z_CLREC_F' FIELD <fs_entity>-ClaimRecType
*      ID 'Z_CLLOC_F' FIELD lv_uuid.
*
*  IF sy-subrc <> 0.
*    "Return Error Message to Frontend.
*    APPEND VALUE #(  %cid =  <fs_entity>-%cid ) TO failed-claim.
*    APPEND VALUE #(  %cid =  <fs_entity>-%cid
*                     %msg = new_message_with_text(
*                        severity = if_abap_behv_message=>severity-error
*                        text = |No Autorization to create claim for RecType{  <fs_entity>-ClaimRecType }|
*                      )  ) TO reported-claim.
*  ENDIF.
*    ENDLOOP.
    "End of change by PPT020

    precheck_claim(
        EXPORTING
          entities_create = entities
        CHANGING
          failed          = failed-claim
          reported        = reported-claim
      ).
  ENDMETHOD.

  METHOD precheck_update.
    precheck_claim(
        EXPORTING
          entities_update = entities
        CHANGING
          failed          = failed-claim
          reported        = reported-claim
      ).
  ENDMETHOD.

  METHOD precheck_claim.

    DATA:
      lt_entities       TYPE t_entities_update,
      lv_operation      TYPE if_abap_behv=>t_char01,
      is_modify_granted TYPE abap_bool.

    " Either entities_create or entities_update is provided.  NOT both and at least one.
    ASSERT NOT ( entities_create IS INITIAL EQUIV entities_update IS INITIAL ).

    IF entities_create IS NOT INITIAL.
      lt_entities = CORRESPONDING #( entities_create MAPPING %cid_ref = %cid ).
      lv_operation = if_abap_behv=>op-m-create.
    ELSE.
      lt_entities = entities_update.
      lv_operation = if_abap_behv=>op-m-update.
    ENDIF.

    DATA : lt_check_claim TYPE TABLE FOR UPDATE zr_tgrc_claim\\claim.

    LOOP AT lt_entities INTO DATA(ls_claim).

      READ ENTITIES OF zr_tgrc_claim IN LOCAL MODE
                ENTITY claim
                ALL FIELDS WITH VALUE #( ( %tky = ls_claim-%tky ) )
                RESULT DATA(lt_claim).

      IF lines( lt_claim ) = 0.
        CONTINUE.
      ENDIF.

      APPEND INITIAL LINE TO lt_check_claim ASSIGNING FIELD-SYMBOL(<ls_claim_check>).

      <ls_claim_check> = CORRESPONDING #( lt_claim[ 1 ] ).
      <ls_claim_check> = CORRESPONDING #( BASE ( <ls_claim_check> ) ls_claim USING CONTROL ).
    ENDLOOP.
    LOOP AT lt_check_claim INTO ls_claim.

*      Closed claims require a date claim closed
      IF ls_claim-Status = 'CLOSED' AND ls_claim-DateClosed IS INITIAL.

        APPEND VALUE #( %key = ls_claim-%key
                        %update = if_abap_behv=>mk-on ) TO failed.
        APPEND VALUE #( %key = ls_claim-%key
                        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                      text = 'Closed claims require a date claim closed' )
                        %update = if_abap_behv=>mk-on
                        %element-DateClosed = if_abap_behv=>mk-on
                       ) TO reported.
      ENDIF.

*Date of Loss is required
      IF ls_claim-DateOfLoss IS INITIAL.
        APPEND VALUE #( %key = ls_claim-%key
                                %update = if_abap_behv=>mk-on ) TO failed.
        APPEND VALUE #( %key = ls_claim-%key
                        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                      text = 'Closed claims require a date claim closed' )
                        %update = if_abap_behv=>mk-on
                        %element-DateOfLoss  = if_abap_behv=>mk-on
                       ) TO reported.
*                         ELSE.
*                         Loss Date cannot be in the future.
      ELSEIF ls_claim-DateOfLoss >  cl_abap_context_info=>get_system_date( ).
        APPEND VALUE #( %key = ls_claim-%key
                                %update = if_abap_behv=>mk-on ) TO failed.
        APPEND VALUE #( %key = ls_claim-%key
                        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                      text = 'Loss Date cannot be in the future' )
                        %update = if_abap_behv=>mk-on
                        %element-DateOfLoss = if_abap_behv=>mk-on
                       ) TO reported.


      ENDIF.

      IF ls_claim-DateClosed  IS NOT INITIAL.
*Date Closed cannot be before Date of Loss
        IF ls_claim-DateClosed < ls_claim-DateOfLoss.
          APPEND VALUE #( %key = ls_claim-%key
                                  %update = if_abap_behv=>mk-on ) TO failed.
          APPEND VALUE #( %key = ls_claim-%key
                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                        text = 'Closed claims require a date claim closed' )
                          %update = if_abap_behv=>mk-on
                          %element-DateClosed = if_abap_behv=>mk-on
                         ) TO reported.
        ENDIF.

*Date Closed cannot be after todays date
        IF ls_claim-DateClosed >  cl_abap_context_info=>get_system_date( ).
          APPEND VALUE #( %key = ls_claim-%key
                                  %update = if_abap_behv=>mk-on ) TO failed.
          APPEND VALUE #( %key = ls_claim-%key
                          %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                        text = 'Date Closed cannot be after todays date' )
                          %update = if_abap_behv=>mk-on
                          %element-DateClosed = if_abap_behv=>mk-on
                         ) TO reported.
        ENDIF.
      ENDIF.
*Date of Claim Reported to Insurer cannot be in the future
      IF ls_claim-DtOfClaimReportToInsurer >  cl_abap_context_info=>get_system_date( ).
        APPEND VALUE #( %key = ls_claim-%key
                                %update = if_abap_behv=>mk-on ) TO failed.
        APPEND VALUE #( %key = ls_claim-%key
                        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                      text = 'Date of Claim Reported to Insurer cannot be in the future' )
                        %update = if_abap_behv=>mk-on
                        %element-DtOfClaimReportToInsurer = if_abap_behv=>mk-on
                       ) TO reported.
      ENDIF.

*Date Reported to Client must be on after Date of Loss
      IF ls_claim-DateReportedtoClient IS NOT INITIAL AND ls_claim-DateReportedtoClient < ls_claim-DateOfLoss.
        APPEND VALUE #( %key = ls_claim-%key
                                %update = if_abap_behv=>mk-on ) TO failed.
        APPEND VALUE #( %key = ls_claim-%key
                        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                      text = 'Date Reported to Client must be on after Date of Loss' )
                        %update = if_abap_behv=>mk-on
                        %element-DtOfClaimReportToInsurer = if_abap_behv=>mk-on
                       ) TO reported.
      ENDIF.

*Date Reported to Client cannot be in the future
      IF ls_claim-DateReportedtoClient  >  cl_abap_context_info=>get_system_date( ).
        APPEND VALUE #( %key = ls_claim-%key
                                %update = if_abap_behv=>mk-on ) TO failed.
        APPEND VALUE #( %key = ls_claim-%key
                        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                      text = 'Date Reported to Client cannot be in the future' )
                        %update = if_abap_behv=>mk-on
                        %element-DtOfClaimReportToInsurer = if_abap_behv=>mk-on
                       ) TO reported.
      ENDIF.

*Closed claims can't have an Underwriters Reserve
*Error message to user where field Status__c is being changed to "Closed" but where field RecordTypeid "Marine" and field Underwriters_Reserve_Total__c is not = 0
      IF ls_claim-Status = 'CLOSED' AND ls_claim-UnderwritersReserveTotal IS NOT INITIAL.

        APPEND VALUE #( %key = ls_claim-%key
                        %update = if_abap_behv=>mk-on ) TO failed.
        APPEND VALUE #( %key = ls_claim-%key
                        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                      text = 'Closed claims cant have an Underwriters Reserve' )
                        %update = if_abap_behv=>mk-on
                        %element-UnderwritersReserveTotal = if_abap_behv=>mk-on
                       ) TO reported.
      ENDIF.
* Error message to user where field Status_Detail__c = "N-Potential Claim" AND field Date_Closed__c is not blank OR field Status_c is trying to be changed to "Closed"
* Please change Status Detail from a Potential Claim, when the Claim is closed.
      IF ls_claim-StatusDetail = 'N-Potential Claim' AND ls_claim-DateClosed IS NOT INITIAL.

        APPEND VALUE #( %key = ls_claim-%key
                        %update = if_abap_behv=>mk-on ) TO failed.
        APPEND VALUE #( %key = ls_claim-%key
                        %msg = new_message_with_text( severity = if_abap_behv_message=>severity-error
                                                      text = 'Please change Status Detail from a Potential Claim, when the Claim is closed.' )                          %update = if_abap_behv=>mk-on
                        %element-StatusDetail = if_abap_behv=>mk-on
                       ) TO reported.
      ENDIF.


    ENDLOOP.


  ENDMETHOD.

  METHOD get_instance_features.
    zbp_r_tgrc_claim=>lv_control = abap_true.

    READ ENTITIES OF zr_tgrc_claim IN LOCAL MODE
     ENTITY claim
        FIELDS ( status )
        WITH CORRESPONDING #( keys )
     RESULT DATA(lt_claim_read_result)
     FAILED failed.


**LOOP AT lt_claim_read_result INTO DATA(ls_claim_control).
**
**APPEND VALUE #( %tky                   = ls_claim_control-%tky
**%field-status =   if_abap_behv=>fc-f-read_only ) To result.
**
**APPEND VALUE #( %tky                   = ls_claim_control-%tky
**%field-DateClosed    =   if_abap_behv=>fc-f-read_only ).
**
**
**ENDLOOP.


**    result = VALUE #( FOR ls_claim IN lt_claim_read_result
*                       ( %tky                   = ls_claim-%tky
*                         %field-status =   if_abap_behv=>fc-f-read_only
*                         %field-DateClosed    =   if_abap_behv=>fc-f-read_only
**                          %field-Activity   =
*
*                         %assoc-_claim_trn = COND #( WHEN ls_claim-status = 'C'
*                                                          THEN if_abap_behv=>fc-o-disabled ELSE if_abap_behv=>fc-o-enabled  ) ) ).

*
*LOOp at result INTO DATA(ls_result).
*ls_result-
*
*ENDLOOP..


  ENDMETHOD.

  METHOD closeclaim.


    MODIFY ENTITIES OF zr_tgrc_claim IN LOCAL MODE
           ENTITY claim
              UPDATE FIELDS ( status )
                 WITH VALUE #( FOR key IN keys ( %tky      = key-%tky
                                                 status = 'C' ) ). " closed

    " Read changed data for action result
    READ ENTITIES OF zr_tgrc_claim IN LOCAL MODE
      ENTITY claim
         ALL FIELDS WITH
         CORRESPONDING #( keys )
       RESULT DATA(lt_claim).

    result = VALUE #( FOR ls_claim IN lt_claim ( %tky      = ls_claim-%tky
                                              %param    = ls_claim ) ).

  ENDMETHOD.

  METHOD get_global_features.




  ENDMETHOD.

  METHOD get_instance_authorizations.
*    IF requested_authorizations-%update EQ if_abap_behv=>mk-on OR
*       requested_authorizations-%delete EQ if_abap_behv=>mk-on.
*      READ ENTITIES OF zr_tgrc_claim IN LOCAL MODE
*                ENTITY Claim
*                  FIELDS ( ClaimRecType InsuredName )
*                  WITH CORRESPONDING #( keys )
*                RESULT DATA(lt_rectyp)
*                FAILED failed.
*
*      CHECK lt_rectyp IS NOT INITIAL.
*      SELECT location_uuid,level_1_id FROM ztgrc_locationx
*      FOR ALL ENTRIES IN @lt_rectyp WHERE level_1_id = @lt_rectyp-InsuredName INTO TABLE @DATA(lt_location).
*
*      LOOP AT lt_rectyp INTO DATA(ls_rectyp).
*        DATA(lv_uuid) = VALUE zgrc_clmloc_char( lt_location[ level_1_id = ls_rectyp-InsuredName ]-location_uuid OPTIONAL ).
*        IF requested_authorizations-%update EQ if_abap_behv=>mk-on.
*          AUTHORITY-CHECK OBJECT 'Z_CLAIM_O'
*          ID 'ACTVT' FIELD '02'
*          ID 'Z_CLREC_F' FIELD ls_rectyp-ClaimRecType
*          ID 'Z_CLLOC_F' FIELD lv_uuid.
*
*          IF sy-subrc = 0.
*            DATA(lv_update) = abap_true.
*          ENDIF.
*
*        ENDIF.
*        IF requested_authorizations-%delete EQ if_abap_behv=>mk-on.
*          AUTHORITY-CHECK OBJECT 'Z_CLAIM_O'
*          ID 'ACTVT' FIELD '06'
*          ID 'Z_CLREC_F' FIELD ls_rectyp-ClaimRecType
*          ID 'Z_CLLOC_F' FIELD lv_uuid.
*                    IF sy-subrc = 0.
*            DATA(lv_delete) = abap_true.
*          ENDIF.
*
*        ENDIF.
*        APPEND VALUE #(  %tky    = ls_rectyp-%tky
*                           %update = COND #( WHEN lv_update = abap_false
*                                             THEN if_abap_behv=>auth-unauthorized
*                                             ELSE if_abap_behv=>auth-allowed )
*                           %action = VALUE #( edit = COND #( WHEN lv_update = abap_false
*                                             THEN if_abap_behv=>auth-unauthorized
*                                             ELSE if_abap_behv=>auth-allowed ) )
*                           %delete = COND #( WHEN lv_delete = abap_false
*                                             THEN if_abap_behv=>auth-unauthorized
*                                             ELSE if_abap_behv=>auth-allowed )
*                                              )  TO result.
*
*      ENDLOOP.
*
*    ENDIF.

  ENDMETHOD.

  METHOD ClaimRecType.
*    DATA: lv_rectype TYPE zgrc_picklist_numbering.
*    READ ENTITIES OF zr_tgrc_claim IN LOCAL MODE
*      ENTITY Claim
*      FIELDS ( ClaimRecType ) WITH CORRESPONDING #( keys )
*      RESULT DATA(lt_rectype).
*    LOOP AT lt_rectype INTO DATA(ls_rectype).
*      IF sy-xprog CS 'ZC_GRC_CLAIMS_AL'.
*        lv_rectype = 500019.
*      ELSEIF sy-xprog CS 'ZC_GRC_CLAIMS_CCC'.
*        lv_rectype = 500020.
*       ELSEIF sy-xprog CS 'ZC_GRC_CLAIMS_GL'.
*        lv_rectype = 500023.
*         ELSEIF sy-xprog CS 'ZC_GRC_CLAIM_WC'.
*        lv_rectype = 500029.
*         ELSEIF sy-xprog CS 'ZC_GRC_GRM_LIABILITY'.
*        lv_rectype = 500031.
*         ELSEIF sy-xprog CS 'ZC_GRC_CLAIM_INCIDENT_ONLY_CCC'.
*        lv_rectype = 500035.
*         ELSEIF sy-xprog CS 'ZC_GRC_CLAIM_MARINE'.
*        lv_rectype = 500046.
*         ELSEIF sy-xprog CS 'ZC_GRC_CLAIMS_ERRORS_OMISSIONS'.
*        lv_rectype = 500021.
*         ELSEIF sy-xprog CS 'ZC_GRC_CLAIMS_POLLUTION'.
*        lv_rectype = 500027.
*         ELSEIF sy-xprog CS 'ZC_GRC_CLAIMS_GRM_PROPERTY'.
*        lv_rectype = 500032.
*         ELSEIF sy-xprog CS 'ZC_GRC_INCIDENT_PROPERTY'.
*        lv_rectype = 500031.
*         ELSEIF sy-xprog CS 'ZC_GRC_CLAIMS_PROPERTY'.
*        lv_rectype = 500043.
*         ELSEIF sy-xprog CS 'ZC_GRC_GRM_CARGO_INSURANCE'.
*        lv_rectype = 500030.
*         ELSEIF sy-xprog CS 'ZC_GRC_CLAIMS_PL'.
*        lv_rectype = 500026.
*         ELSEIF sy-xprog CS 'ZC_GRC_CLAIMS_HM'.
*        lv_rectype = 500025.
*         ELSEIF sy-xprog CS 'ZC_GRC_WORKERS_COMPENSATION'.
*        lv_rectype = 500045.
*         ELSEIF sy-xprog CS 'ZC_GRC_INCIDENT_ONLY_AL'.
*        lv_rectype = 500033.
*         ELSEIF sy-xprog CS 'ZC_GRC_INCIDENT_ONLY_GL'.
*        lv_rectype = 500038.
*         ELSEIF sy-xprog CS 'ZC_GRC_INCIDENT_ONLY_WC'.
*        lv_rectype = 500044.
*         ELSEIF sy-xprog CS 'ZC_GRC_CLAIMS_FINES_DUTIES'.
*        lv_rectype = 500037.
*         ELSEIF sy-xprog CS 'ZC_GRC_INCIDENT_POLLUTION'.
*        lv_rectype = 500042.
*         ELSEIF sy-xprog CS 'ZC_GRC_INCIDENT_ONLY_HM'.
*        lv_rectype = 500039.
*         ELSEIF sy-xprog CS 'ZC_GRC_INCIDENT_H_COUNSEL'.
*        lv_rectype = 500040.
*         ELSEIF sy-xprog CS 'ZC_GRC_INC_FINES_DUTIES'.
*        lv_rectype = 500037.
*         ELSEIF sy-xprog CS 'ZC_GRC_INC_CAPTIVE_CCC'.
*        lv_rectype = 500034.
*         ELSEIF sy-xprog CS 'ZC_GRC_CL_GL_EMP_LIABILITY'.
*        lv_rectype = 500024.
*         ELSEIF sy-xprog CS 'ZC_GRC_INC_ERROR_OMISSIONS'.
*        lv_rectype = 500021.
*         ELSEIF sy-xprog CS 'ZC_GRC_INC_EMP_LIABILITY'.
*        lv_rectype = 500041.
*      ENDIF.
*      MODIFY ENTITIES OF zr_tgrc_claim IN LOCAL MODE
*         ENTITY Claim
*         UPDATE
*         FIELDS ( ClaimRecType ) WITH VALUE #( ( %tky = ls_rectype-%tky ClaimRecType = lv_rectype ) ).
*    ENDLOOP.
  ENDMETHOD.

  METHOD determine_RecType.
  DATA: lv_rectype TYPE zgrc_picklist_numbering.
    READ ENTITIES OF zr_tgrc_claim IN LOCAL MODE
      ENTITY Claim
      FIELDS ( ClaimRecType ) WITH CORRESPONDING #( keys )
      RESULT DATA(lt_rectype).
    LOOP AT lt_rectype INTO DATA(ls_rectype).
      IF sy-xprog CS 'ZC_GRC_CLAIMS_AL'.
        lv_rectype = 500019.
      ELSEIF sy-xprog CS 'ZC_GRC_CLAIMS_CCC'.
        lv_rectype = 500020.
       ELSEIF sy-xprog CS 'ZC_GRC_CLAIMS_GL'.
        lv_rectype = 500023.
         ELSEIF sy-xprog CS 'ZC_GRC_CLAIM_WC'.
        lv_rectype = 500029.
         ELSEIF sy-xprog CS 'ZC_GRC_GRM_LIABILITY'.
        lv_rectype = 500031.
         ELSEIF sy-xprog CS 'ZC_GRC_CLAIM_INCIDENT_ONLY_CCC'.
        lv_rectype = 500035.
         ELSEIF sy-xprog CS 'ZC_GRC_CLAIM_MARINE'.
        lv_rectype = 500046.
         ELSEIF sy-xprog CS 'ZC_GRC_CLAIMS_ERRORS_OMISSIONS'.
        lv_rectype = 500021.
         ELSEIF sy-xprog CS 'ZC_GRC_CLAIMS_POLLUTION'.
        lv_rectype = 500027.
         ELSEIF sy-xprog CS 'ZC_GRC_CLAIMS_GRM_PROPERTY'.
        lv_rectype = 500032.
         ELSEIF sy-xprog CS 'ZC_GRC_INCIDENT_PROPERTY'.
        lv_rectype = 500031.
         ELSEIF sy-xprog CS 'ZC_GRC_CLAIMS_PROPERTY'.
        lv_rectype = 500043.
         ELSEIF sy-xprog CS 'ZC_GRC_GRM_CARGO_INSURANCE'.
        lv_rectype = 500030.
         ELSEIF sy-xprog CS 'ZC_GRC_CLAIMS_PL'.
        lv_rectype = 500026.
         ELSEIF sy-xprog CS 'ZC_GRC_CLAIMS_HM'.
        lv_rectype = 500025.
         ELSEIF sy-xprog CS 'ZC_GRC_WORKERS_COMPENSATION'.
        lv_rectype = 500045.
         ELSEIF sy-xprog CS 'ZC_GRC_INCIDENT_ONLY_AL'.
        lv_rectype = 500033.
         ELSEIF sy-xprog CS 'ZC_GRC_INCIDENT_ONLY_GL'.
        lv_rectype = 500038.
         ELSEIF sy-xprog CS 'ZC_GRC_INCIDENT_ONLY_WC'.
        lv_rectype = 500044.
         ELSEIF sy-xprog CS 'ZC_GRC_CLAIMS_FINES_DUTIES'.
        lv_rectype = 500037.
         ELSEIF sy-xprog CS 'ZC_GRC_INCIDENT_POLLUTION'.
        lv_rectype = 500042.
         ELSEIF sy-xprog CS 'ZC_GRC_INCIDENT_ONLY_HM'.
        lv_rectype = 500039.
         ELSEIF sy-xprog CS 'ZC_GRC_INCIDENT_H_COUNSEL'.
        lv_rectype = 500040.
         ELSEIF sy-xprog CS 'ZC_GRC_INC_FINES_DUTIES'.
        lv_rectype = 500037.
         ELSEIF sy-xprog CS 'ZC_GRC_INC_CAPTIVE_CCC'.
        lv_rectype = 500034.
         ELSEIF sy-xprog CS 'ZC_GRC_CL_GL_EMP_LIABILITY'.
        lv_rectype = 500024.
         ELSEIF sy-xprog CS 'ZC_GRC_INC_ERROR_OMISSIONS'.
        lv_rectype = 500021.
         ELSEIF sy-xprog CS 'ZC_GRC_INC_EMP_LIABILITY'.
        lv_rectype = 500041.
      ENDIF.
      MODIFY ENTITIES OF zr_tgrc_claim IN LOCAL MODE
         ENTITY Claim
         UPDATE
         FIELDS ( ClaimRecType ) WITH VALUE #( ( %tky = ls_rectype-%tky ClaimRecType = lv_rectype ) ).
    ENDLOOP.
  ENDMETHOD.

ENDCLASS.
