import { LightningElement, wire } from 'lwc';
import getaccounts from '@salesforce/apex/AccountRecords.getaccounts';

export default class ApexDemo extends LightningElement {
    account;
    
    @wire(getaccounts) accountrecord;




      
}