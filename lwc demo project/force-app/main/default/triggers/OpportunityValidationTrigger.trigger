trigger OpportunityValidationTrigger on Opportunity (before insert,before update) {
    if(trigger.isBefore && trigger.isInsert){
        trgHanddle.oppValidate(trigger.new, null);
    }else if(trigger.isBefore && trigger.isupdate){
        trgHanddle.oppValidate(trigger.new, trigger.oldmap);
    }

}