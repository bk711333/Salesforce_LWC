import { LightningElement, wire } from 'lwc';
import getperentaccounts from '@salesforce/apex/AccountHandler.getperentaccounts';
import ACCOUNT_NAME_FIELD from '@salesforce/schema/Account.Name';
import ACCOUNT_OBJECT from '@salesforce/schema/ACCOUNT';
import ACCOUNT_RATING_FIELD from '@salesforce/schema/Account.Rating';
import ACCOUNT_PERENTID from '@salesforce/schema/Account.parentId';
import { createRecord } from 'lightning/uiRecordApi';
import { getObjectInfo, getPicklistValues } from 'lightning/uiObjectInfoApi';


export default class AccountCreationFormByLDS extends LightningElement {

perentaccount =[];
selectedPerentAccount ;
selectedAccountname;
selectedAccountRating;


@wire(getperentaccounts)
accountrecords({data,error}){
    this.perentaccount=[];
    if(data){
        
        this.perentaccount = data.map((currentitem) => ({label : currentitem.Name,
            value : currentitem.Id
        }));
        console.log('this.perentaccount',this.perentaccount);
    }else if(error){
        console.log('error' , error);
    }
};

@wire(getObjectInfo,{objectapiname : ACCOUNT_OBJECT})
accountabjectinfo;

@wire(getPicklistValues,{recordTypeId :"$accountabjectinfo.data.defaultRecordTypeId" , fieldapiName : ACCOUNT_RATING_FIELD})
ratingpicklistvalue;

handleChange(event){
    let {name,value} = event.target;
    if(name === "PerentAccount"){
        this.selectedPerentAccount = value;
    }
    if(name === "AccountName"){
        this.selectedAccountname= value;
    }
    if(name === "AccountRating"){
        this.selectedAccountRating= value;
    }
}

saveRecord(){
   
   let inputfields ={};
   inputfields=[ACCOUNT_NAME_FIELD.fieldapiName] = this.selectedAccountname;
   inputfields=[ACCOUNT_PERENTID.fieldapiName] = this.selectedPerentAccount;
   inputfields=[ACCOUNT_RATING_FIELD.fieldapiName] = this.selectedAccountRating;
   
   let recordInput = {
    apiname : ACCOUNT_OBJECT.objectapiname,
    fields : inputfields
   }

   createRecord(recordInput).then((result)=>{
    console.log("record",result);
   }).catch((error)=>{
    console.log("error",error);
   });
}


}