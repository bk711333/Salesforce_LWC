import { LightningElement, track } from 'lwc';
import getaccounts from '@salesforce/apex/AccountRecords.getaccounts'

export default class Imperative_method_apex extends LightningElement {
    @track account;
    @track errors;

    handlechange(event){
        const searchkey = event.target.value;
         getaccounts({strKey:searchkey}).then(result=>{
                this.account= result;
                this.errors = undefined;
            }).catch(error=>{
                this.errors = error;
                this.account = undefined;
            })
    }
}