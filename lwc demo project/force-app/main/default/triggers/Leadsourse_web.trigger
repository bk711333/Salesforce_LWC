trigger Leadsourse_web on Lead (before insert) {
    for (Lead le:trigger.new){
        if(le.LeadSource== 'Web'){
            le.Rating='Cold';
        }else{
            le.Rating='Hot';
        }
        system.debug('lead is'+le);
    }
}