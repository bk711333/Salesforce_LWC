public class accountRecordlist {
    
    @AuraEnabled(cacheable=true)
    Public static list<account> getAccounts(){
        
        return [select id,name,phone from account limit 10];
    }

}