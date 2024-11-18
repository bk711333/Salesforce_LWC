public class AddPrimaryContact implements Queueable {
    private contact con;
    private string stateabrival;
    public AddPrimaryContact(contact records, string str){
        this.con = records;
        this.stateabrival = str;
        
    }
    public void execute(queueablecontext context){
        list<account> acclist = [select id, name, BillingState, (select id, accountid, lastname from contacts) from account where BillingState =: stateabrival limit 200  ];
        system.debug('accountlist'+ acclist.size());
        list<contact> clonelist= new list<contact>();
        
        for(account acc: acclist){
           
                contact clonecontact= con.clone(false,false,false,false);
                   clonecontact.AccountId= acc.Id;
            
                clonelist.add(clonecontact);
                
            
        }
        if(clonelist != null){
            insert clonelist;
        }
        system.debug('conlist'+clonelist.size());
        
    }

}