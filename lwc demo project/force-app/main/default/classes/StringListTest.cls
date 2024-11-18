public class  StringListTest {
    public static list<string> generateStringList(Integer n){
        list<string> stringlist= new list<String>();
        for(integer i=0;i<n;i++){
            stringlist.add('Test'+' '+i);
        }
        system.debug(stringlist);
        
        
        return stringlist;
        
    }
    
    
}