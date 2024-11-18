trigger contactCount on Contact (after insert, after update, after delete, after undelete){
    if(trigger.isInsert || trigger.isUpdate || trigger.isDelete ||trigger.isUndelete){
        
        trgHanddle.trgmethod(trigger.new, trigger.old);
    }
}