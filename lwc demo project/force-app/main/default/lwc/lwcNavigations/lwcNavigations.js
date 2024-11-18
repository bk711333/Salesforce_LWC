import { LightningElement } from 'lwc';
import LightningAlert from 'lightning/alert';
import LightningConfirm from 'lightning/confirm';
import LightningPrompt from 'lightning/prompt';

export default class LwcNavigations extends LightningElement {

    async handlealert(){
        await LightningAlert.open({
            message : "simple message",
            label : "alert test",
            theme : "error"
        }).then(()=>{
            console.log('###Alert working');
        });
    }

    async handleconfirm(){
        const result= await LightningConfirm.open({
            message : " simple confirm message",
            theme : "success",
            label : "confirm test"
        }).then(()=>{
            console.log('###confirm '+ result);
        })
    }

    async handleprompt(){
        await LightningPrompt.open({
            message : "simple prompt message",
            label : "prompt test",
            theme : "error",
            defaultvalue : "test"
        }).then(()=>{
            console.log('###prompt working');
        });
    }

}