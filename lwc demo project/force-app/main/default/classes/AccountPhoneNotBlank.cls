public class AccountPhoneNotBlank {

    public static void accountphone(list<account> acclist){
        list<account> acc= new list<account>();
        
        for(account a:acclist){
            if(a.phone == null || a.phone == ' '){
                a.adderror('phone number must enter');
            }else{
                acc.add(a);
            }
        }
        if(acc != null){
            insert acc;
        }
      }
   //-------------------------------------------------=-------------------------------------------------//
    
    Public static void accoutbillingAndShipping(list<account> acclist, map<id, account> oldmap){
        list<account> accountlist = new list<account>();
        if(oldmap != null){
            for(account acc:acclist){
                if(acc.billingcity != null){
                    accountlist.add(acc);
                }else if(acc.billingcity != oldmap.get(acc.id).billingcity){
                    accountlist.add(acc);
                }
            }
        }
        
      //  list<account> ac= [select id name shippingaddress, billingaddress from account where id IN: a]
      list<account> aclist= new list<account>();
        for(account a:accountlist){
            //a.ShippingAddress = a.BillingAddress;
            a.ShippingCity = a.BillingCity;
            a.ShippingCountry = a.BillingCountry;
            a.ShippingState = a.BillingState;
            
            aclist.add(a);
            
        }
        if(aclist != null){
            update aclist;
        } 
      }
   //----------------------------------------------------------=----------------------------------------------// 
    Public static void samePhoneNoAccountContact(list<account> acclist, map<id, account> oldmap){
        set<id> accountlist= new set<id>();
        for(account acc:acclist){
            if(acc.phone != null || acc.phone != oldmap.get(acc.id).phone){
                accountlist.add(acc.id);
            }
        }
        map<id, account> accmap= new map<id,account>([select id,name,phone from account where id in: accountlist]);
      list<contact> coclist= [select lastname,phone,accountId from contact where accountId in: accountlist];  
        list<contact> cocToupdate = new list<contact>();
        for(contact c:coclist){
            if(accmap.containsKey(c.accountid)){
                c.Phone= accmap.get(c.AccountId).phone;
                cocToUpdate.add(c);
            }
        }
        if(cocToUpdate != null){
            update cocToUpdate;
        }
    }
 //-------------------------------------------------------------------------------------------//
    
    Public static void contactAcoountDiscription (list<contact> conlist, map<id,contact> oldmap){
        set<id> accid= new set<id>();
        
        for(contact coc:conlist){
            if(coc.accountid != null && coc.description != oldmap.get(coc.id).description){
             accid.add(coc.accountid);
                
            }
        }
        
        map<id,account> accmap= new map<id,account>([select id,name, description ,(select id, lastname, description from contacts) from account where id IN: accid]);
        list<account> acctoupdate= new list<account>();
        for(contact cc:conlist){
            if(accmap.containsKey(cc.accountid)){
                accmap.get(cc.AccountId).description = cc.Description;
                acctoupdate.add(accmap.get(cc.AccountId));
            }
            
        }
        if(acctoupdate != null){  
        update acctoupdate;
        }
    }
//------------------------------------=------------------------------//

    public static void duplicateaccountName(list<account> acclist, list<account> oldlist){
        set<string> accname= new set<string>();
       map<String, account> accmap= new map<string, account>(); 
        for(account ac: acclist){
            If(ac.name != null){
                accname.add(ac.name);
            }
        }
        list<account> accountlist=[select id,name from account where name in: accname];
        for(account a:accountlist){
            accmap.put(a.name, a);
        }   
                
        for(account acc: acclist){
            If(acc.name != null){
                if(accmap.containsKey(acc.name)){
                    acc.adderror('name already exist');
                }
            }
          }
    }  
    
 //---------------------------------------=------------------------------------//
 
    Public static void oppLineAccounntproducts(list<OpportunityLineItem> opplist){
        set<id> oppid= new set<id>();
        map<id,decimal> accountopp= new map<id,decimal>();
        if(!opplist.isempty()){
            for(OpportunityLineItem op:opplist){
                oppid.add(op.OpportunityId);
            }
        }
            list<opportunity> Opportunitylist= [select id, accountid from opportunity where id in: oppid];
            for(opportunity oppo:Opportunitylist){
                accountopp.put(oppo.accountid,0);
                
            }   
        
        System.debug('opportnity ids (oppid)'+ oppid);
        System.debug('opportnity records (Opportunitylist)'+ Opportunitylist);
        
            list<aggregateresult> agrlist= [select count(id) opid, opportunity.accountid from OpportunityLineItem where opportunity.accountid in: accountopp.keyset() group by opportunity.accountId ];
         
          System.debug('aggregatelist  (agrlist)'+ agrlist);      
        
            for(aggregateresult arg: agrlist){
                accountopp.put((id)arg.get('accountID'),(decimal)arg.get('opid'));
            }
        list<account> listToupdate= new list<account>();
        
        
        for(id accid: accountopp.keyset()){
            account ac= new account();
            ac.id = accid;
            ac.number_of_products__c= accountopp.get(accid);
             listToupdate.add(ac);
            
        }
        
        System.debug('listToupdate records  (listToupdate)'+ listToupdate);  
        if(listToupdate != null){
            try{
                update listToupdate;
            }catch(exception ex){
                system.debug('error while updating'+ ex.getmessage());
            }
        }
        
    }
    
}