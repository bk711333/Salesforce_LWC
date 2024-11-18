public class EventCapacityCalculator {

    public static  Decimal eventcount(id evn){
        
      Decimal maxcount;
      list<event__C>  listofevent=[select id,name, Maximum_Capacity__c from Event__c where id =: evn ];
        for(event__c eve:listofevent){
         maxcount=   eve.Maximum_Capacity__c;
        }
        system.debug('maxcount'+ maxcount);
            
        return maxcount;
        
    }

}