@isTest
public class testCaseDemo1 {
    
    @testsetup
    static void addAccount(){
        
        List<account>  acc= new List<account>();
            for(Integer i=0; i<10;i++){
                
            
        acc.add(new Account(Name='testcaseUser'+i , Industry='Education',Phone='90012-2321'+i, Rating='Hot'));
            } 
        insert acc;
        
    }
    
    @istest
    static void contactTest(){
        Account acc= [select Id from account where name='testcaseUser0' LIMIT 1];
        
        Contact coc= new Contact(FirstName='testContact',AccountId=acc.Id,LastName='user1',Email='bk711333@gmail.com',phone='7889-8878');
        
        insert coc;
    }
    
    @istest
    static void updateaccount(){
        
        Account acc1=[select Id from Account where name='testcaseUser1' limit 1];
        
        acc1.Rating='Cold';
        
        update acc1;
        if(acc1.Rating=='Hot'){
        system.debug(acc1.Rating);
        }else{
            system.debug('account not updated');
        }
    }
    
    @istest
    static void dataLoadtest(){
        List<account>  listAccount= Test.loadData(Account.sObjectType, 'testResource');
        Account acc= listAccount.get(0);
        System.debug('account record'+acc);
    }
    
    
    

}