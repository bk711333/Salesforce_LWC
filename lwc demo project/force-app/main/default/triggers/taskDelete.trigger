trigger taskDelete on Task (before Delete) {
    Id profID= Userinfo.getProfileId();
    Profile prof = [select Name from profile where id=: profID];
    for(task tosklist:trigger.old){
        if(prof.Name !='System Administrator'){
            tosklist.addError('only system admin can delete');
        }
    }

}