public class MathCalculator {
    Integer sum;
    Integer product;
    Integer substract;
    public  integer add(Integer n1, Integer n2){
        sum = n1 + n2;
       // System.debug('sum of two digits is'+ sum);
      return sum;  
    }
    public  Integer multiply( Integer m1, Integer m2){
        product = m1 * m2;
        //System.debug(' producrt of two num is'+ product);
        
        return product;
    }
    
    public Integer Substract(Integer s1, Integer s2){
        substract = s1- s2;
        
        return substract;
    }
    public void PrintOut(){
        System.debug('sum is '+ sum);
        system.debug('product is '+product);
        System.debug('substaction is '+ substract);
    }
}