import { LightningElement } from 'lwc';

export default class PerentLwc extends LightningElement {

    message = 'this message is from perent';

    handleevent(event){
        this.message = event.target.value;
    }

    refresh(){
        this.template.querySelector("c-chiled-lwc").refersh();
    }

    count=0;
    endvalue = 1;
    mesg = '' ;
   
    countincrese(event){
        this.endvalue = event.detail.endvalue;
        this.mesg= event.detail.mesg;
        if(this.count < this.endvalue){
        this.count= this.count+1;
        }else {
            alert(this.mesg);
        }

    }

}