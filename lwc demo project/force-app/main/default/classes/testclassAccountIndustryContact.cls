@isTest
public class testclassAccountIndustryContact {
    
    @isTest
    public static void testclassaccount(){
     List<account> accountlist= new List<account>();   
     
        for(Integer i=0; i < 200; i++){
        Account aa= new Account();
        aa.name= 'test'+i;
        aa.Phone= '4293423-33'+i;
        aa.Industry= 'Banking';
        accountlist.add(aa);
    }
        
        Test.startTest();
        AccountIndustryContact aca= new AccountIndustryContact(accountlist);
        Id acaid= system.enqueuejob(aca);
 
        Test.stopTest();
        System.AssertEquals(200,accountlist.size());
        
    } 
}