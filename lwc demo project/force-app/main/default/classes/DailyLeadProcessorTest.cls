@isTest
public class DailyLeadProcessorTest {
    
    public static String corn_express= '0 55 23 22 6 ? 2024';
    
    @isTest
    public static void testlead(){
        list<lead> lelist= new list<lead>();
        
        
        for(integer i=0; i<200; i++){
            Lead le= new lead();
            le.LastName= 'testlead'+i;
            le.Company ='ltimindtree';
            le.Status ='Open- Not Contacted ';
            lelist.add(le);
            
        }
        
        if(lelist != null){
            insert lelist;
        }
        
       
        Test.starttest();
         DailyLeadProcessor dlprocess= new DailyLeadProcessor();
        id jobid = system.schedule('leadsource update',corn_express,dlprocess);
        test.stoptest();
        list<lead> leadsourcelist= [select id, leadsource from lead where leadsource =: 'Dreamforce'];
        
        System.assertequals(200 , leadsourcelist.size());
    }

}