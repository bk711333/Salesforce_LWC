trigger accountNameUpdate on Account (before update) {
    
   for(Account acc:Trigger.new){
        if(acc.phone != trigger.oldMap.get(acc.ID).Phone){
            acc.name= acc.name+acc.Phone;
        }
    }


}