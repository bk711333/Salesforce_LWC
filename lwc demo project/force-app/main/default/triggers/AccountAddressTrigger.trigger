trigger AccountAddressTrigger on Account (before insert, before update) {
 //   set<id> accset= new set<id>();
     for(account acc:trigger.new){
    if(trigger.oldmap != null){
       
            if(acc.Match_Billing_Address__c == true && trigger.oldmap.get(acc.id).Match_Billing_Address__c ==false){
               acc.ShippingPostalCode =acc.BillingPostalCode;
            }
        } else{
            if(acc.Match_Billing_Address__c == true ){
               acc.ShippingPostalCode =acc.BillingPostalCode;
            } 
    }}
  /*  list<account> accToupdate= new list<account>();
    if(accset != null){
        list<account> acclist=[select id,name,ShippingAddress,BillingAddress,ShippingPostalCode,BillingPostalCode from account where id in: accset];
        
        for(id ac1: accset){
            account acc1=new account();
            acc1.id= ac1;
            
        //    acc1.ShippingCity =acc1.BillingCity;
            acc1.ShippingPostalCode =acc1.BillingPostalCode;
         //   acc1.ShippingCountry=acc1.BillingCountry;
          //  acc1.ShippingState=acc1.BillingState;
         //   acc1.ShippingStreet= acc1.BillingStreet;
            
          accToupdate.add(acc1);
         
        }
    }if(accToupdate != null){
        insert accToupdate;
    } */
   
}