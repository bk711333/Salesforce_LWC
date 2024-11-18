trigger accountAnnuval_contact on Account (after insert) {
    list<Contact> contlist = new list<Contact>();
    for(account acc:trigger.new){
        if(acc.AnnualRevenue >= 50000){
            contact cont= new contact();
            cont.FirstName='sharn';
            cont.Lastname='kumar';
            cont.AccountId= acc.Id;
            contlist.add(cont);
        }
        
    }
    insert contlist;
}