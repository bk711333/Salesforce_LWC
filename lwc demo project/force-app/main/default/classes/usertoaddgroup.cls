public class usertoaddgroup {
    public static void userAddtoGrouplist(list<User> userlist){
     Group addtoGroup=[select id from group where DeveloperName='Admins' and Type='Regular' limit 1 ];
    if(addtoGroup != null){
        List<Groupmember> groupmemberstoadd= new List<GroupMember>();
        profile adminprofile=[Select ID from profile WHERE Name = 'System Administrator' LIMIT 1];
        for(user us1: userlist){
            if(us1.profileID == 'System Administrater'  && us1.isActive == true){
            //  groupmemberstoadd.add(new GroupMember(GroupId = addtoGroup.Id, UserOrGroupId = user.Id) );      
            }
        }
        Insert  groupmemberstoadd;
    }    
    }


}