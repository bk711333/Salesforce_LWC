trigger Opportunitylinritemtrigger on OpportunityLineItem (after insert, after delete) {

    if(trigger.isafter && trigger.isInsert){
        AccountPhoneNotBlank.oppLineAccounntproducts(trigger.new);
    }else if(trigger.isafter && trigger.isDelete){
        AccountPhoneNotBlank.oppLineAccounntproducts(trigger.old);
    }
}