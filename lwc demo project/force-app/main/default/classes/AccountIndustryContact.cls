public class AccountIndustryContact implements queueable{
  
    private list<Account> acclist= new list<account>();
    
    Public AccountIndustryContact(list<account> acc){
        this.acclist = acc;
    }
    
    public void execute(queueablecontext context){
        list<contact> contactlist = new list<contact>();
        for(account acc1:acclist){
            contact co = new  contact();
            co.accountid =acc1.id;
            co.lastname= acc1.name;
            co.Phone= acc1.phone;
            contactlist.add(co);
            
        }
        
        
        if(contactlist != null){
            insert contactlist;
        }
        
    }

    

}