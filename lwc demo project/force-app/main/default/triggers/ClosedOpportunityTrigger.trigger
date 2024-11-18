trigger ClosedOpportunityTrigger on Opportunity (After insert, after update) {
    if(trigger.isAfter && trigger.isUpdate){
       // trgHanddle.taskToOpp(trigger.new, trigger.oldmap);
        
        trgHanddle.oppTofuturemethod(trigger.new, trigger.oldmap);
    }else if(trigger.isAfter && trigger.isInsert){
        trgHanddle.taskToOpp(trigger.new, null);
    }

}