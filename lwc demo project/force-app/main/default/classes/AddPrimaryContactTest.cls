@isTest
public class AddPrimaryContactTest {
    
    @isTest
    public static void accountlistcreate(){
        list<account> acclist= new list<account>();
        list<contact> conlist = new list<contact>();
        
        for(integer i=0; i<100;i++){
          Account acc= new account();
            acc.name= 'test account'+i;
            acc.Phone= '3423423'+i;
            if(i<50){
              acc.BillingState= 'NY';  
            }else if(i >= 50){
                acc.BillingState = 'CA';
            }
            acclist.add(acc);
        }
        if(acclist != null){
            insert acclist;
        }
        
       
            contact coc= new contact();
            coc.FirstName = 'demo';
             coc.lastname= 'count';
            coc.Phone= '232323';
            
        insert coc;
            
       
        addPrimaryContact primecontact = new addPrimaryContact(coc, 'NY');
        test.startTest();
        
        id jobid= system.enqueueJob(primecontact);
        Test.stopTest();
        
        list<account> accvalue= [select id, BillingState,(select id, lastname from contacts) from account where BillingState =: 'NY'];
        
        system.assertequals(1,accvalue[1].contacts.size());
    }

}