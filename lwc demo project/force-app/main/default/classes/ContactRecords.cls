public class ContactRecords {
    @AuraEnabled(cacheable = true)
    public static list<contact> getcontacts(){
        list<contact> conlist = [select id, lastname, phone ,accountId from contact limit 20];
        System.debug(conlist);
        
        return conlist;
        
    }

}