trigger sendemailtolead on Lead (After insert) {
    List<messaging.singleEmailmessage> emaillist= new list<messaging.singleEmailmessage>();
    Emailtemplate emailtep = [select id,subject,developerName,body from emailtemplate where name='Send lead Email'];
    for(lead leadlist : trigger.new){
        if(leadlist.email != null){
            messaging.singleEmailmessage mail= new messaging.singleEmailmessage();
            mail.setTargetObjectId(leadlist.Id);
            mail.setSenderDisplayName('System Administrator');
            mail.setUseSignature(false);
            mail.setBccsender(false);
            mail.setSaveAsActivity(false);
            mail.setTemplateID(emailtep.Id);
            mail.toAddresses = new String[]{leadlist.Email};
            emaillist.add(mail);
            
            system.debug('email is'+ emaillist);
            
        }
    }
    if(emaillist.size() > 0){
        messaging.SendEmailResult[] result= messaging.sendEmail(emaillist);
        if(result[0].success){
            system.debug('the email was sent successfully.');
            
        }else{
            System.debug('the email failed to send : '+ result[0].errors[0].message);
        }
    }
  

}