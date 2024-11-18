trigger capacityfullEvent on Event__c (before insert) {
  /*  for(event__c even: trigger.new){
        if(even.Maximum_Capacity__c == 0){
            for (Registration__c reg:trigger.new){
                if(reg.event__c == even.id){
                reg.adderrors('no capacity innthis event');
                }
            }
        }
    } */

}