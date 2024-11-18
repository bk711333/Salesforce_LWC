public class LeadProcessor implements Database.Batchable<sobject>  {
     public string query ;
    public Database.querylocator start(database.batchablecontext context){
        query = 'select id ,name, leadsource from lead'; 
        
        return database.getquerylocator(query);
    }
    public void execute(Database.BatchableContext bc, List<lead> scope){
        list <lead> leadupdate = new list<lead>();
        for(lead le:scope){
            le.leadsource =' Dreamforce';
            leadupdate.add(le);
        }
        update leadupdate ;
    }
    public void finish(database.batchablecontext bc){
        system.debug('leadsource updated succesfully');
        
    }
}