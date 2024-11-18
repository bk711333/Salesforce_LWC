trigger accCOCdescriptiontrigger on Contact (after update) {
    if(trigger.isAfter && trigger.isUpdate){
        AccountPhoneNotBlank.contactAcoountDiscription(trigger.new, trigger.oldmap);
    }

}