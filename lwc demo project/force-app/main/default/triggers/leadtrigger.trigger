trigger leadtrigger on Lead (before insert,before update) {
    for(lead le:trigger.new){
        le.Salutation='Dr.';
        
        
        System.debug('lead is'+ le);
    }

}