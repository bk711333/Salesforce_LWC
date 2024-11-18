trigger limitcontactcreate on Contact (before insert , before update) {
    if(trigger.isbefore && trigger.isinsert){
        trgHanddle.limitcontacts(trigger.new, null);
            }else if(trigger.isbefore && trigger.isUpdate){
                trgHanddle.limitcontacts(trigger.new, trigger.oldmap);
            }
}