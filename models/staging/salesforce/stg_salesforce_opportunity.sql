SELECT 
        op.id as opportunityId
        , op.accountid as accountId
        , LEFT(op.account_id__c, 15) as accountId_trimmed
        , op.ownerid as ownerId
        , op.name as opportunityName
        , op.stagename as stageName
        , op.closedate as closeDate
        , op.type as opportunityType
        , op.isclosed as isClosed
        , op.iswon as isWon
        , op.campaignid as campaignId
        , op.createddate as createdDate
        , op.Entered_Pipeline_Date__c as enteredPipelineDate
        , op.dead_reason__c as deadReason
        , op.x7_closed_won_date__c as closedWonDate
        , op.x8_dead_date__c as deadDate
        , op.renewal_due_date__c as renewalDueDate
        , op.multi_year_1st_due_date__c as multiYear1stDueDate
        , op.multi_year_2nd_due_date__c as multiYear2ndDueDate
        , op.contact_champion__c as contactChampionId
        , op.business_unit__c as businessUnit
        , op.vy_attribution__c as opportunityAttribution
        , op.new_acv__c as newACV
        , op.new_arr__c as newARR
        , op.one_time__c as oneTimeCharge
        , op.last_year_arr__c as lastYearARR
        , op.renewal_amount__c as renewalAmount
        , op.renewal_won_arr__c as renewalWonARR
        , op.renewal_lost_arr__c as renewalLostARR
        , op.reoccurring_mrr__c as reoccurringMRR
        , op.csm_owner__c as csmOwnerId
        , op.contract_start_date__c as contractStartDate
        , op.contract_end_date__c as contractEndDate
        , op.previous_contract_start_date__c as previousContractStartDate
        , op.previous_contract_end_date__c as previousContractEndDate
        , op.churn_reason__c as churnReason
        , op.competition__c as competitor
        , op.forecastcategoryname as forecastCategory
        , op.red_opportunity__c as redOpportunity
        , op.assurance__c as Assurance
        , op.vy_use_case__c as useCase
FROM 
    {{ source('salesforce_production', 'opportunity') }} as op