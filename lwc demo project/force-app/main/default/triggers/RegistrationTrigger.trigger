trigger RegistrationTrigger on Registration__c (before insert,After insert) {
    list<id> eventmap= new list<id>();
    list<id> eventids= new List<id>();
    if (trigger.isAfter && trigger.isInsert){
        for(Registration__c reglist:trigger.new){
            eventmap.add(reglist.Event__c);
            system.debug('eventid'+reglist.Event__c);
        }
    }
    system.debug('eventmap'+eventmap);
    list<event__c> eventlist= [select id,status__c,Maximum_Capacity__c from Event__C where id IN: eventmap];
    system.debug('eventlist'+ eventlist);
    
    if(eventlist.size() >0){
        for(event__c eve: eventlist){
        
            if(eve.Maximum_Capacity__c >0){
         eve.Maximum_Capacity__c=   eve.Maximum_Capacity__c - 1;
               system.debug('max.capacity'+ eve.Maximum_Capacity__c);
           }
        else{
                eve.Status__c='Sold out';
            }
            
        
    }
        update eventlist;
    }
    
    
         
}