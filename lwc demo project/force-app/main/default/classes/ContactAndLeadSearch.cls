public class ContactAndLeadSearch {
    public static list<list<sObject>> searchContactsAndLeads(String sample){
        list<list<sObject>> conlead = [FIND :sample in all fields RETURNING contact(lastName),lead(LastName,Company)]; 
        
        system.debug(conlead);
        return conlead;
    }

}