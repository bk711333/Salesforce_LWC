import { LightningElement } from 'lwc';

export default class ToDoApplication extends LightningElement {

Taskname ="";
TaskDate= null;

IncompleteTasks = [];
CompleteTasks = [];


Changehandular(event){
        let {name,value} = event.target;

        if(name=== "Taskname"){
            this.Taskname = value;
        }else if(name === "TaskDate"){
            this.TaskDate = value;
        }
    }

resethanduller(){
        this.Taskname ="";
        this.TaskDate= null;
    }

addTaskhanduller(){

        if(!this.TaskDate){
            this.TaskDate = new Date().toISOString().slice(0,10);
        } 

        if(this.validateTask()){
           // this.validateTask();
            this.IncompleteTasks =[...this.IncompleteTasks, {Taskname : this.Taskname , TaskDate : this.TaskDate}];
         
            this.resethanduller();
            let sortedIncompleteArray = this.SortArray(this.IncompleteTasks);
            this.IncompleteTasks = [...sortedIncompleteArray];
        }

        //console.log(this.sortedIncompleteArray);

    }

validateTask(){
    let isValid = true;
    let element= this.template.querySelector(".TaskName"); 

    if(!this.Taskname){
        isValid=false;
    }else{
        let isduplicateTask=this.IncompleteTasks.find(currItem => currItem.Taskname === this.Taskname && currItem.TaskDate === this.TaskDate);
    if(isduplicateTask){
        isValid= false;
        element.setCustomValidity("This task is already added");
    }
   }

    if(isValid){
        element.setCustomValidity("");
    }
   element.reportValidity();

   return isValid;
  }

SortArray(inputarray){
    let sortedarray= inputarray.sort((a,b) =>{ const dateA = new Date(a.TaskDate); const dateB = new Date(b.TaskDate);
        return dateA - dateB;
    });
   return sortedarray;

}

removehandular(event){

    let index = event.target.name;
    this.IncompleteTasks.splice(index,1);
    let sortedIncompleteArray = this.SortArray(this.IncompleteTasks);
            this.IncompleteTasks = [...sortedIncompleteArray];

}

addtocompletehandular(event){
    let index = event.target.name;
   let completedtask =  this.IncompleteTasks.splice(index,1);
    
    let sortedcompleteArray = this.SortArray(this.IncompleteTasks);
    this.IncompleteTasks = [...sortedcompleteArray];
    this.CompleteTasks = [...this.CompleteTasks, completedtask[0]];
}

dragstarthandular(event){
    event.dataTransfer.setdata("index",event.target.dataset.item);
}

allowdrop(event){
    event.preventdefault();
}

dropElementHandular(event){
   let index= event.dataTransfer.getdata("index");
   this.refreshdata(index);
}

refreshdata(index){
    let completedtask =  this.IncompleteTasks.splice(index,1);
    
    let sortedcompleteArray = this.SortArray(this.IncompleteTasks);
    this.IncompleteTasks = [...sortedcompleteArray];
    this.CompleteTasks = [...this.CompleteTasks, completedtask[0]];
}


}