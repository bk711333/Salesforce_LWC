/* trigger accountAndContact on Account (after insert) {
   
    list<Contact> conlist= new List<contact>();
    for (Account ac1:trigger.new){
        System.debug('trigger.new is: '+ trigger.new);
        contact c= new Contact();
        c.accountid= ac1.id;
        c.lastname = ac1.name;
        c.Phone = ac1.phone;
        conlist.add(c);
        System.debug('contact is'+c);
    }
     
    insert conlist;

} */

trigger unabletodeleteContact on Account(before delete){
 /*   set<id> accSet=new set<id>();
    map<id,Account> mAcc= new Map<id,Account>();
    for(Account ac1:trigger.old){
        accSet.add(ac1.Id);
    }  
    for (account a: [select id,name,(select id,firstname,lastname from contacts) from account where id in: accSet]){
        mAcc.put(a.id,a);
    }   
    System.debug('size of map:' + mAcc.size());
    System.debug('keyvalue set'+ mAcc.keySet());
    
    for(Account a1:trigger.old){
        if(mAcc.get(a1.id).Contacts.size() >= 2){
            a1.adderror('Account delete not possible if account hase more than 2 contacts');
        }
    }*/
    
     for(Account a : [select id,(select id from contacts) from account Where Id in:Trigger.old]){
    if(a.contacts.size()>=2){
       Trigger.oldmap.get(a.Id).addError('you can not delete');
    }   
    }
    
}