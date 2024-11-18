trigger cannotregesiterevent on Registration__c (before insert) {
    set<id> eventlist= new set<id>();
    for(Registration__C reglist: trigger.new){
        if(reglist.event__c != null){
            eventlist.add(reglist.event__c);
        }
    }
    list<event__c> listOFevent = [select id,Maximum_Capacity__c from event__c where id IN: eventlist];
    for(event__c even: listOfevent){
        if(even.Maximum_Capacity__c ==0){
            for(Registration__C reg: trigger.new){
                if(reg.event__c == even.Id){
                    reg.adderror('there is no seats in this event');
                }
                
            }
        }
    }
    

}