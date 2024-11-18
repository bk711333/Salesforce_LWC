public class Demo1 {
    public String helloworld;
    private static final string Defult_string;
    
    static{
        Defult_string= 'hello, this is defult string';
    }
    public Demo1(){
        this(Defult_string);
    }
    public Demo1(String conSing){
        this.helloworld= conSing;
    }
    
    public void massege(){
        system.debug('messege is  hellow world');
        Account acc=new Account(Name='Apex_testcaseUser' , Industry='Education',Phone='90012-2321', Rating='Hot');
        insert acc;
        System.debug(acc.id);
    }
     
    public static void messege1(){
        System.debug('this messege from static');
        
    }
    

}