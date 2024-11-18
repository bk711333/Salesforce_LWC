public class AccountHandler {
    public static Account insertNewAccount(String accname){
       // list<account> acclist= new list<account>();
      //  boolean result;
        Account acc = new account();
        acc.name = accname;
        try{
        insert acc;
        }
        catch(DMLException e){
            return null;
        }
       
        return acc;
      //  insert acclist;
        
     /*  return acclist;
       if(acclist != null){
            return acclist;
           
        }else {
            return Null;
        }
     /*
       Database.saveResult[] srlist= Database.insert(acclist);
        for(Database.saveResult  sr: srlist){
            if(sr.isSuccess()){
                System.debug(acclist);
                 result= true;
            }else{
                result= false;
                System.debug('no record');
            }
        }
        if(result==true){
            return acclist;
        }else{
            return Null;
        }   */
    }
    
    @AuraEnabled(cacheable = true)
    public static list<account> getAccounts(){
        list<account> acclist= [select id, Name,Rating,AnnualRevenue from account limit 10];
        
        return acclist;
    }
    
    @AuraEnabled(cacheable = true)
    public static list<Account> searchrecords(string SearchKey){
        list<account> recordslist = new list<account>();
        if(string.isNotBlank(SearchKey)){
            String key ='%' + SearchKey+ '%';
            String Quarystring = 'select id,name from account where name like :key';
            recordslist=Database.query(Quarystring);
          
        }
        system.debug('accounts '+ recordslist);
        
        return recordslist;
    }
    
    
    @AuraEnabled(cacheable = true)
    Public static list<account> getperentaccounts(){
        List<account> acclist=[select id,name,AnnualRevenue  from account where AnnualRevenue > 100];
        
        system.debug('records ' + acclist);
        return acclist;
    }

}