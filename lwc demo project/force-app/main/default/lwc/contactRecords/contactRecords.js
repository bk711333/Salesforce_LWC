import { LightningElement, track, wire } from 'lwc';
import getcontacts from '@salesforce/apex/ContactRecords.getcontacts';

export default class ContactRecords extends LightningElement {
    @track contact;
    @track errors;

    @wire(getcontacts)
    contacts({error,data}){
        if(data){
            this.contact = data;
            this.errors= undefined;
        }else if(error){
            this.errors = error;
            this.contact = undefined;
    }
    };
}