import { LightningElement, wire } from 'lwc';
import getaccountlist from '@salesforce/apex/accountRecordlist.getAccounts';

export default class BindwireWithfuntion extends LightningElement {
   accounts;
   error;

   @wire(getaccountlist)
   acclist({error,data}){
    if(data){
        this.accounts= data;
        this.error= undefined;
    }else if(error){
        this.accounts = undefined;
        this.error =error;
    }
   }

}