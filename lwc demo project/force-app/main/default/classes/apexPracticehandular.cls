public class apexPracticehandular {
    
    Public Static void conAccountOpptrigger(list<contact> conlist, map<id,contact> oldmap){
        set<id> accid= new set<id>();
        
        for (contact coc:conlist){
            if(coc.accountID !=null && coc.accountID != oldmap.get(coc.id).accountid){
                accid.add(coc.accountId);
            }
        }
        AggregateResult result = [select sum(amount)oppSum from Opportunity];
        decimal amt= (double)result.get('oppSum');
        list<account> acclist = [select id,name,Sum_Of_all_Opp__c, sum_of_Opp_ammount__c, (select amount from Opportunities ORDER By amount desc) from account where id IN: accid  ];
        list<account> acclistToUpdate= new List<account>();
        for(account acc: acclist){
            acc.sum_of_Opp_ammount__c = acc.Opportunities[0].amount;
            acc.Sum_Of_all_Opp__c = amt;
            acclistToUpdate.add(acc);
            
        } 
        
        if(acclistToUpdate != null){
            update acclistToUpdate;
        }
        
    }

}