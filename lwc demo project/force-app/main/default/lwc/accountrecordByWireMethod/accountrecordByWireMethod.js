import { LightningElement, track, wire } from 'lwc';
import getaccounts from '@salesforce/apex/AccountRecords.getaccounts';

export default class AccountrecordByWireMethod extends LightningElement {
    @track setkey;
    @track account;
    @track errors;

    @wire(getaccounts ,{strKey:'$setkey'})
        AccountRecords({error, data}){
            if(data){
                this.account = data;
                this.error = undefined;
            }else if(error){
                this.errors= error;
                this.data = undefined
            }
        }
    
     handlechange(event){
        this.setkey= event.target.value;
     }   
}