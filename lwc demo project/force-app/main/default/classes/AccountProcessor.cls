public class AccountProcessor {
    
    @future
    public static void countContacts(list<id> accid){
        list<account> accountTOupdate = new list<account>();
        list<account> accountlist= [select id, name ,(select id, lastname from contacts), number_of_contacts__C from account where id IN: accid];
        for(account acc: accountlist){
            acc.number_of_contacts__c = acc.contacts.size();
            accountToUpdate.add(acc);
        }
        
        if(accountToupdate != null){
            update accountToupdate ;        }
    }

}