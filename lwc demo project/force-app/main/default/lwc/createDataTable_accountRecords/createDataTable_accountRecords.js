import { LightningElement, wire } from 'lwc';
import getAccounts from '@salesforce/apex/AccountHandler.getAccounts';

const columns = [
    {label : "account Name", fieldName : "Name"},
    
    { label : " Rating", fieldName: "Rating"},
    { label : "Annual Revenue" , fieldName : "AnnualRevenue"}
];
export default class CreateDataTable_accountRecords extends LightningElement {

    @wire(getAccounts)
    accounts;
    cols = columns ;

}