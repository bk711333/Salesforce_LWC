trigger maxOpponAccount on Opportunity (after insert,after update,after delete, after undelete) {
    if(trigger.isafter && trigger.isupdate){
        trgHanddle.accountoppvalue(trigger.new, trigger.oldmap);
    }
    else if(trigger.isAfter && trigger.isdelete){
         trgHanddle.accountoppvalue(trigger.old, null);
    }else if(trigger.isAfter && Trigger.isInsert){
         trgHanddle.accountoppvalue(trigger.new,null);
    }

}