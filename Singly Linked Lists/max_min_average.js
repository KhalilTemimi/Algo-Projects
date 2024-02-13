class Node{
    constructor(data){
        this.data = data;
        this.next = null;
    }
}
class SLL{
    constructor(){
        this.head = null;
    }

     // Add Front
    // Write a method that accepts a value and create a new node, assign it to the list head, and return a pointer to the new head node.
    
    addFront(value){
        // creating a new node with te given value
        let newNode = new Node(value);
        // check if the list is empty
        if(!this.head){
            this.head = newNode;
            return this;
        }
        // if the list not empty next take the head and new node become head
        newNode.next = this.head;
        this.head = newNode
        return this;
    }

    // SList: Max
    // Create method max() to return list’s largest val.

    max(){
        // check if the list is empty
        if(!this.head){
            return null;
        }
        let runner = this.head;
        let max = this.head.data;
        while(runner !== null){
            if(runner.data > max){
                max = runner.data;
            }
            runner = runner.next;
        }
        return max;
    }

    // SList: Min
    // Create min(node) to return list’s smallest val.

    min(){
        // check if the list is empty
        if(!this.head){
            return null;
        }
        let runner = this.head;
        let min = this.head.data;
        while(runner !== null){
            if(runner.data < min){
                min = runner.data;
            }
            runner = runner.next;
        }
        return min;
    }

    // SList: Average
    // Create average() to return average val.

    average(){
        // check if the list is empty
        if(!this.head){
            return null;
        }
        let runner = this.head;
        let sum = 0;
        let count = 0;
        while(runner !== null){
            sum += runner.data;
            count +=1;
            runner = runner.next;
        }
        return (sum/count);
        
    }
}

ssl1 = new SLL();
console.log("***** AddFront *****");
console.log(ssl1.addFront(55));
console.log(ssl1.addFront(45));
console.log(ssl1.addFront(30));
console.log(ssl1.addFront(20));
console.log(ssl1.addFront(10));
console.log("***** Max *****");
console.log(ssl1.max());
console.log("***** Min *****");
console.log(ssl1.min());
console.log("***** Average *****");
console.log(ssl1.average());

