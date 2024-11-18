global class AccountConatactCount implements Database.batchable<sObject>, Database.allowscallouts, Database.stateful {
    global integer exceutedRecourdcount =0;
    global String query='select id, name, contacts_count__c, (select id, lastname, accountid from contacts) from Account';
    global Database.querylocator start(database.batchablecontext be){
        return database.getquerylocator(query);
    }
    global void execute(Database.batchablecontext bc, list<account> acc){
        system.debug('accouts list'+ acc);
        list<account> accountsTOUpdate = new list<account>();
        if(acc != null){
            
            for(account ac1:acc){
                ac1.contacts_count__c= ac1.contacts.size();
                accountsTOupdate.add(ac1);
            }
            
           
        }
           exceutedRecourdcount = exceutedRecourdcount + acc.size();

        if(accountsTOUpdate != null){
         update accountsTOUpdate;
        }
         }
    global void finish(database.batchablecontext bc){
        
        system.debug(' excecuted accout recourds count is :'+ exceutedRecourdcount);

    }

}