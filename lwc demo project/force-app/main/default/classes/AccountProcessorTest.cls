@isTest
public class AccountProcessorTest {
        @isTest
        public static void createAccList(){
            list<account> acclist = new list<account>();
            for(integer i=0; i<10; i++){
       account acc= new account(name = 'raju'+i, phone= '324324'+i);
             acclist.add(acc);   
            }
            
            insert acclist;
list<contact> con2 = new list<contact>();
  
        list<id> acid= new list<id>();

   


for (Account ac1:acclist){
    for(Integer j=0; j<2;j++){
        Contact coc1=new contact();
        coc1.lastname = ac1.name;
        coc1.firstname= 'testuser';
        coc1.accountid =ac1.ID;
        coc1.phone = ac1.phone;
        con2.add(coc1);
    }
    acid.add(ac1.id);
}
 try{
     insert con2;  
 }catch(DMLException e){
     system.debug('exception accoured '+ e);
 }
            
            
        Test.StartTest();
         AccountProcessor.countContacts(acid);
         Test.StopTest(); 
            
            list<account> testaccount= [select id,name,number_of_contacts__C from account ];
           
           
         System.assertequals(2,testaccount[0].number_of_contacts__c);
         
       
        }
 

}