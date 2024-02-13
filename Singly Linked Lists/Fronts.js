

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

    // Remove Front
    // Write a method to remove the head node and return the new list head node. If the list is empty, return null.

    removeFront(){
        // check if the list is empty
        if(!this.head){
            return null;
        }
        // if the list had one node
        if(!this.head.next){
            this.head = null;
            return this;
        }
        // if the list had more than one node
        if (this.head.next){
            this.head = this.head.next;
            return this;
        }
    }

    // Front
    // Write a method to return the value (not the node) at the head of the list. If the list is empty, return null.

    front(){
        // check if the list is empty
        if(!this.head){
            return null;
        }else{
            return(this.head.data);
        }

    }
}

ssl1 = new SLL();
console.log("***** AddFront *****");
console.log(ssl1.addFront(18));
console.log(ssl1.addFront(5));
console.log(ssl1.addFront(73));
console.log("***** removeFront *****");
console.log(ssl1.removeFront());
console.log(ssl1.removeFront());
// console.log(ssl1.removeFront());
console.log("***** getFrontData *****");
console.log(ssl1.front());

