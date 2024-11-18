@isTest
public class Assignment6class {
    
   // @Testsetup
    Public static void setupmethod11(){
        List<Account> accList=TestDataFactory.accountInfo('apexaccount',1,'Hot','Prospect',50);
        //system.debug(accList);
        
      
    }
    
    @TestSetup
    Public static void setupaccount(){
        list<account> acc22= TestDataFactory.dataLoadtest();
        
    }    
    
    @isTest
    public Static void Accountupdate(){

      list<Account> acc= [select id, Name, Rating From Account where Rating='Cold'];
         
        for(Account ac1:acc){
            ac1.Industry= 'Education';
            system.debug(ac1);
            
         
        }
     update acc;
    }

}