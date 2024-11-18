@isTest
public class LeadProcessorTest {
    @istest
    Public static void leadsourcetest(){
        list <lead> leadlist= new list<lead>();
        for(integer i=0;i< 200; i++){
            lead le=new lead();
            le.LastName= 'leaduser'+i;
            le.FirstName= 'apex';
            le.LeadSource ='web';
            le.Company ='ltimindtree';
            le.Status= 'open - notcontacted';
            leadlist.add(le);
        }
        
        insert leadlist;
        
        test.starttest();
        leadprocessor leadjob= new leadprocessor();
        id jobid = database.executebatch(leadjob);
        test.stoptest();
        
        list<lead> listcount= [select id, leadsource from lead where leadsource = 'Dreamforce'  ];
        system.debug(listcount);
    
        system.assertequals(200, listcount.size());
    
    }
    

}