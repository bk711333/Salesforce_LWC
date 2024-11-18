trigger updateSalary on Employee__c (after insert, after update, after delete, after undelete) {

if(trigger.isAfter && trigger.isUpdate)
{
trgHanddle.empsalary(trigger.new,trigger.oldMap);
}

else if(trigger.isAfter && trigger.isDelete)
{
trgHanddle.empsalary(trigger.old,null);
}

else
{
trgHanddle.empsalary(trigger.new,null);
}
}