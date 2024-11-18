trigger closeAllOpportunity on Account (After insert, After update) {
    if(trigger.isAfter && trigger.isupdate){
        trghanddle.accountoppclose(trigger.new, trigger.oldmap);
    }else if(trigger.isAfter && trigger.isInsert){
        trghanddle.accountoppclose(trigger.new, null);
    }
}