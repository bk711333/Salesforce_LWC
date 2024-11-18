@isTest
public class TestDataFactory {
    
    public static List<Account> accountInfo(String Name, Integer NumberOfEmployees, String Rating,String Type, Integer noOfAccounts ){
     
        List<account> acc = new List<Account>();
        for (Integer i=0; i< noOfAccounts;i++){
            Account addAccount= new Account(Name= Name+i, NumberOfEmployees= NumberOfEmployees+1, Rating = Rating, Type= Type);
            
            acc.add(addAccount);
        } 
        
        return acc;
    }
    
    @isTest
    public static list<account> dataLoadtest(){
        List<account>  listAccount= Test.loadData(Account.sObjectType, 'testResource');
        Account acc= listAccount.get(0);
        System.debug('account record'+acc);
        
        
        return listAccount;
    }

}