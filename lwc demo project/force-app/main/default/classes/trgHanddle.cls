public class trgHanddle {
    public static void accountCreationwithContacts(){
        
list<account> acc2= new list<account>();
list<contact> con2 = new list<contact>();

for(Integer i=21;i<100; i++){
    
    Account ac= new account();
      ac.Name='batchacc'+ i;
    ac.Phone='(415)445-12'+ i;
    ac.NumberOfEmployees=50;
    acc2.add(ac);
}
insert acc2;

for (Account ac1:acc2){
    for(Integer j=0; j<5;j++){
        Contact coc1=new contact();
        coc1.lastname = ac1.name;
        coc1.firstname= 'user';
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
     
        
        
    }
    
    public static void trgmethod(list<contact> newCont, list<contact> oldCont){
        Set<id> accidSet= new Set<id>();
        try{
        if(newCont !=null){
            for(contact con:newcont){
                accidSet.add(con.accountId);
            }
            if(oldCont != null){
                for(Contact con:oldCont){
                    accidSet.add(con.accountid);
                }
            }
            List<Account> acc= [select id,name,contacts_count__c, (select id, lastname from contacts) from Account where id IN:accidSet];
             if(acc !=null){
            for (Account ac:acc){
               
                    ac.contacts_count__c = ac.contacts.size();
                }
             }
            if(!acc.isEmpty()){
                 update acc;
             }
        } 
        }Catch(exception e){
           System.debug('error messege '+ e.getMessage()); 
        }
    }
/*------------new apex class for maxOpponAccount-------*/
    public static void accountoppvalue(list<opportunity> opplist, map<id, opportunity> oppmap){
        set<id> accountset= new set<id>();
        if(!opplist.isEmpty()){
            for(Opportunity opp: opplist){
                
                if(oppmap != null){
                    Opportunity oldopp =oppmap.get(opp.id);
                    if(opp.AccountId != oldopp.AccountId){
                        accountset.add(opp.AccountId);
                        accountset.add(oldopp.AccountId);
                    }else{
                        accountset.add(opp.AccountId);
                    }
                }else{
                accountset.add(opp.AccountId);
                }
            }
        }
        
        if(!accountset.isEmpty()){
            list<account> listToupdate= new list<account>();
            list<account> accountlist= [select maxOpp__c ,(select name,amount from Opportunities where amount !=null order by amount desc limit 1 ) from account where id in: accountset];
            if (accountlist != null){
                for (Account acc: accountlist){
                    if(!acc.opportunities.isEmpty()){
                    acc.maxopp__c = acc.opportunities[0].name;
                    listToupdate.add(acc);
                    }else{
                        acc.maxopp__c='';
                        listToupdate.add(acc);
                    }
                }
            }
            
            if(! listToupdate.isEmpty()){
                update listtoUpdate;
            }
            
        }
        
    }    
 /*-----new apex class for OpportunityValidationTrigger----*/   
    
    public static void oppValidate(list<opportunity> emplist,Map<id,Opportunity> empmap){
        list<opportunity> newopp= new list<Opportunity>();
        for(Opportunity opp: emplist){
            if(empmap != null){
            if(opp.CloseDate < Date.today()){
                opp.adderror('close data cannot be in past date');
            }else if(opp.StageName=='Closed Won' && empmap.get(opp.id).stageName =='Prospecting'){
                opp.adderror('can not move the opportunity from Prospecting to closed won directly');
            }else if(opp.StageName=='Closed won' && opp.Amount < 100000){
                opp.adderror('ammount should be greter than 100000 for closed won oppertunity');
            }else{
                newopp.add(opp);
                
            }}else{
                if(opp.CloseDate < Date.today()){
                opp.adderror('close data cannot be in past date');
                }
            }
           }}
  /* ----------new class for the employee object----*/
    public static void  empsalary(list<employee__c> newlist, map<id, Employee__c> oldmap){
        set<id> techID= new seT<ID>();
        FOR(Employee__c emp : newlist){
            If(emp.salary__c != null){
                techId.add(emp.Tech_firm__c);
            }else if(emp.salary__c != oldmap.get(emp.id).salary__c){
                techId.add(emp.tech_firm__c);
            }else{
                techId.add(emp.Tech_firm__c);
            }
        }
      //  List<Tech_firm__c> techlisttoUpdate= new List<Tech_firm__c>();
        
        
        list<AggregateResult> agglist=[select Tech_firm__c tfid,max(salary__c) Max_Salary,min(salary__c) Min_Salary from Employee__c where Tech_firm__c in: techId group by Tech_Firm__c];
        Map<id, Tech_firm__c> maptoupdate= new map<id, Tech_firm__c>();
      /*  for(id tech:techID){
            Tech_firm__c tf=new tech_firm__c();
            tf.id= tech;
            tf.Max_salary__c= 0;
            tf.min_salary__c=0;
            
            maptoupdate.put(tf.id, tf);
        }*/
        if(! agglist.isEmpty()){
            for(AggregateResult aggr:agglist){
                  Tech_firm__c tf=new tech_firm__c();
            tf.id= (id)aggr.get('tfid');
            tf.Max_salary__c=(decimal)aggr.get('Max_Salary');
            tf.min_salary__c=(decimal)aggr.get('Min_Salary');
            
            maptoupdate.put(tf.id, tf);
            }
        }
        if(!mapToUpdate.isEmpty())
{
update mapToUpdate.values();
}
        
        }
    
/*--------method for closeallopp trigger-------*/    

    public static void accountoppclose(list<account> acclist, map<id,account> accmap){
        set<id> accset= new set<id>();
        for (Account acc: acclist){
            if(accmap != null){
                if(acc.close_all_opp__c==true && accmap.get(acc.id).close_all_opp__c==false){
                     accset.add(acc.id);
                }
            } 
        }
        list<opportunity> opptoupdate= new list<opportunity>();
        list<opportunity> opplist=[select id,accountid,StageName from Opportunity where accountID in: accset];
        if(opplist != null){
            for(opportunity opp:opplist){
                if(opp.StageName != 'Closed Won'){
                    opp.StageName ='Closed Won';
                    opptoupdate.add(opp);
                }
            }
            if(!opptoupdate.isEmpty()){
                update opptoupdate;
            }
        }
    }
    
 /*----------trigger method for ClosedOpportunityTrigger-----*/
    
    public static void taskToOpp (list<opportunity> opplist, map<id, Opportunity> oppmap){
        set<id> oppid= new set<id>();
        for(opportunity opp: opplist){
            if(oppmap != null){
                if(opp.StageName =='Closed Won' && oppmap.get(opp.id).stagename != 'closed Won'){
                    oppid.add(opp.id);
                }
                }else{
                    if(opp.StageName =='Closed Won'){
                        oppid.add(opp.Id);
                    }
            }
        }
        system.debug(oppid);
        list<Task>  tasktoInsert = new list<task>();
        if(oppid != null){
         list<opportunity> oppolist=[select id,ownerId, stagename from Opportunity where id in: oppid];
            for(Opportunity opp:oppolist){
                task ts=new task();
                ts.WhatId =opp.Id;
                ts.OwnerId= opp.OwnerId;
                ts.Subject='Follow Up Test Task';
                ts.Status='Not started';
                ts.Priority= 'normal';
                
                tasktoInsert.add(ts);
            }
          }
        system.debug('tasks are :' + tasktoInsert);
        if(tasktoInsert != null){
            insert tasktoInsert;
        }
    }
 /*-------------------apex class to call future method for oppsendemailtrigger-------------*/
    public static void oppTofuturemethod (list<opportunity> opplist, map<id, Opportunity> oppmap){
        set<id> oppid= new set<id>();
        for(opportunity opp: opplist){
            if(oppmap != null){
                if(opp.StageName =='Closed Won' && oppmap.get(opp.id).stagename != 'closed Won'){
                    oppid.add(opp.id);
                }
                }else{
                    if(opp.StageName =='Closed Won'){
                        oppid.add(opp.Id);
                    }
            }
        }
        oppFutureclass.emailsendToaccount(oppid);
    }
 //-------------------------new class for limitcontactcreate--------
    public static void limitcontacts(list<contact> conlist, map<id, contact> oldcontact){
         list<id> acclist = new list<id>();
    if(conlist != null){
    for(contact con:conlist){
        if(oldcontact != null){
        if(con.accountID != oldcontact.get(con.id).accountID){
            acclist.add(con.accountID);
        } else{
            acclist.add(con.accountid);
        }}else{
            acclist.add(con.accountid);
        }
    }
    }
    
    list<account> accTocontact = [select id,name,contacts_limit__C, contacts_count__c,( select lastname,id from contacts) from account where id IN: acclist];
        for(account acc:accTocontact){
            if(acc.contacts_limit__C != null){
            if(acc.contacts_limit__C == acc.contacts_count__C){
                
         
                for(Contact coc:acc.contacts){
                    coc.adderror('can not edit this contact because of account is reached max limit os contacts' );
                }
                }
            }
        }

    }  
    
 //------new class for accountbankingIndustry trigger-------
 
    public static void accountBankIndustryContact(list<account> acclist){
        list<id> accid= new list<id>();
        if(acclist != null){
            for(account acc:acclist){
                if(acc.Industry == 'Banking'){
                    accid.add(acc.id);
                }
            }
        }
        system.debug('number of accounts with banking industry ='+acclist.size() );
            list<contact> conlist= new list<contact>();
            list<account> acclist1=[select ID,name, phone from account where id In: accid];
            for(account acc1: acclist1){
                contact coc= new contact();
                coc.AccountId= acc1.Id;
                coc.lastname=acc1.name;
                coc.Phone = acc1.Phone;
                conlist.add(coc);
            }
            insert conlist;
       }
    
    
}