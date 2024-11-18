trigger ContactEmailPhone on Contact (before insert, before update) {
    
    Map<string,contact> emailmap = new Map<string,contact>();
    Map<string,contact> phonemap = new Map<string,contact>();
    for(contact cont : trigger.new){ 
    if(trigger.isbefore && trigger.isInsert){
        if(trigger.new != null){
       
            emailmap.put(cont.email,cont);
            phonemap.put(cont.Phone, cont);
            
        }
        }
        if(trigger.isUpdate){
            if(trigger.oldmap.get(cont.id).email != cont.Email){
                emailmap.put(cont.Email, cont);
            }
            if (trigger.oldmap.get(cont.Id).phone != cont.Phone){
                phonemap.put(cont.phone, cont);
            } 
                
                system.debug('trigger.new'+ trigger.new);
                system.debug('trigger.old'+ trigger.old);
                system.debug('emailmap'+ emailmap);
                system.debug('phonemap'+ phonemap);
            }
        
    }
   String errormessage='';
   list<contact> existingcontacts = [select id, firstname, lastname, Email, phone from Contact where email IN:emailmap.keyset() or Phone IN: phonemap.keyset()]; 
    
   System.debug('existingcontacts'+ existingcontacts);
    
    if(existingcontacts.size() >0){
        for(contact co: existingcontacts){
            if(co.Email != null){
            if(emailmap.get(co.Email) != null){
              errormessage = 'Email';
            }
            }
            
              if(co.phone != null){
            if(phonemap.get(co.phone) != null){
                errormessage =errormessage + (errormessage != ''? 'and Phone': 'Phone');
            }
            }
            
        }
        if(errormessage != ''){
            trigger.new[0].addError('your Contact' + errormessage +' already in system');
        }
    } 
}