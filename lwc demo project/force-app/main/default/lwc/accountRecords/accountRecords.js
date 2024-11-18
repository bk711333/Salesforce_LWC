import { LightningElement, track, wire } from 'lwc';
import getaccounts from '@salesforce/apex/AccountRecords.getaccounts';

export default class AccountRecords extends LightningElement {
    @track setkey;

    @wire(getaccounts,{strKey: '$setkey'})
    accounts;

    handlechange(event){
        this.setkey = event.target.value;
    }

}