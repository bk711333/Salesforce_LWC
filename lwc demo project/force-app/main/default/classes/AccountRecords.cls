public class AccountRecords {
    @AuraEnabled(cacheable= true)
    public static list<account> getaccounts(String strKey) {
        String searchKey = '%'+strKey+'%';
        list<account> acclist = [select id,name, phone, (select id, lastname from contacts) from account where name like:searchKey ];
         system.debug(acclist);
      return acclist;
    }
}