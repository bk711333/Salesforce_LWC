public class ContactSearch {
    public static list<contact> searchForContacts(String matchingname , String postalcode){
         list<contact> conlist=[select ID,name from contact where lastname =: matchingname and MailingPostalCode =: postalcode];
        
        return conlist;
    }
}