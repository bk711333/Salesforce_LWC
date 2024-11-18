public class DailyLeadProcessor implements Schedulable {
    
    public static void execute(SchedulableContext bx){
        List<lead> leadrecords = [select id,Leadsource from lead where leadsource =: ''];
        list<lead> leadupdate= new list<lead>();
        for(lead le: leadrecords){
            le.leadSource = 'Dreamforce';
            leadupdate.add(le);
            
        }
        if(leadupdate != null){
        update leadupdate;
        }
    }
   

}