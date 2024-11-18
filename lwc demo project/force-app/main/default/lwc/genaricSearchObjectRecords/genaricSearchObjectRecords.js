import { LightningElement, wire } from 'lwc';
import searchrecords from "@salesforce/apex/AccountHandler.searchrecords";

const DELAY= 200;

export default class GenaricSearchObjectRecords extends LightningElement {
     searchString ="a" ;
    // objectsearchname ="Account";
     obName = "Account";
     IconName ="Standerd:cccount";
     delayTime ;
     selectedRecordtoDisplay ={
        selectedrecordid: "",
        selectedrecordName : ""
     };

     displaybox = false;

    @wire(searchrecords, {SearchKey : "$searchString" })
    outputrecords;

    inputhandullaer(event){
        window.clearTimeout(this.delayTime);
       let userentry = event.target.value;
       this.delayTime = setTimeout(() =>{this.searchString = userentry, this.displaybox = true},DELAY);
console.log('records '+ this.outputrecords.data);

    }
    


    clickhanduller(event){
        let selectedrecord = event.currentTarget.dataset.item;

        let outputrecord = this.outputrecords.data.find(currentitem => {currentitem.id === selectedrecord});
        this.selectedRecordtoDisplay = {
            selectedrecordid: outputrecord.id,
        selectedrecordName :  outputrecord.name
        };
        this.displaybox = false;
    }
    


}