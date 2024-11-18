@isTest
public class testClassOFAccountContactCount {
    @isTest
        public static void createAccList(){
       list<account> acclist= [select id, name from account];
list<contact> con2 = new list<contact>();


   


for (Account ac1:acclist){
    for(Integer j=0; j<2;j++){
        Contact coc1=new contact();
        coc1.lastname = ac1.name;
        coc1.firstname= 'testuser';
        coc1.accountid =ac1.ID;
        coc1.phone = ac1.phone;
        con2.add(coc1);
    }
}
 try{
     insert con2;  
 }catch(DMLException e){
     system.debug('exception accoured '+ e);
 }
            
            
        Test.StartTest();
         AccountConatactCount ContactTOaccountcount= new AccountConatactCount();
        id batchid = Database.executeBatch(ContactTOaccountcount);
         Test.StopTest(); 
            
            list<account> testaccount= [select id,name,contacts_count__c from account where contacts_count__c != 0];
           
           
         System.assertequals(acclist.size(),testaccount.size());
         
       
        }
}