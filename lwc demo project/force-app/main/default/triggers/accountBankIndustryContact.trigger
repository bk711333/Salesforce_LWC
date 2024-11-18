trigger accountBankIndustryContact on Account (after insert) {
  //  if(trigger.isAfter){  
    trgHanddle.accountBankIndustryContact(trigger.new);
  
}