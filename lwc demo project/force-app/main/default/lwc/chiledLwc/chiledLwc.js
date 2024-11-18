import { LightningElement, api } from 'lwc';

export default class ChiledLwc extends LightningElement {

    message = "HI kiran Kumar";
    greeting = " good morning";
    timestamp = new Date();
    handleevent(event){
        if(event.target.name === 'name'){
        this.message =event.target.value;
        }else if(event.target.name === 'greeting'){
            this.greeting = event.target.value ;
        }
        
    }
    @api
    childmessage = 'this message from chaild';

    @api
    refersh(){
        this.timestamp = new Date();
    }

    @api
    percentage;

    get style(){
        return `background-color:red,height:5px, width:${this.percentage}%`;
    }

    endvalue= 5;
    handleCount(){
       // this.dispatchEvent(new CustomEvent("increasecount"));

       const myCusvent= new CustomEvent("increasecount",
        {
            detail :{
                endvalue : this.endvalue ,
                mesg : "this message from customeevent"
            }});
            this.dispatchEvent(myCusvent);
        
    }
    
    

  

    handleClick(){
 
    var field= this.template.querySelectorAll("lightning-input");
    field.forEach(element => {
        if(element.name ==="name"){
            this.message = element.value;

        }else if(element.name ==="greeting"){
            this.greeting= element.value ;
        }
        
    },this);
    }

}