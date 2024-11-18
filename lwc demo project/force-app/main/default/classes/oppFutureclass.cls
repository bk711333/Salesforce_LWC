global class oppFutureclass {
    @future
    public static void emailsendToaccount(set<id> oppids){
        list< messaging.singleEmailmessage> emaillist = new list<messaging.singleEmailmessage>();
        list<opportunity> opplist=[select id,AccountID,name,account.owner.name, account.owner.email,stagename from Opportunity where id in: oppids];
        for(opportunity opp:opplist){
            list<string> emailsTOsend= new list<string>();
               emailstosend.add(opp.account.owner.email);
              
            
          messaging.singleEmailmessage email= new messaging.singleEmailmessage();
            email.setToAddresses(emailstosend);
            email.setHTMLbody('Hello'+ opp.name+',' + '<br>'+ '<br>'
                             + 'Opportunity' +opp.name+'which is linked to this account'+opp.account.owner.name+'hasbeen closed'                            
                             );
            email.setSubject('opportunity status changed to closed won');
            emaillist.add(email);
    }
    }
}