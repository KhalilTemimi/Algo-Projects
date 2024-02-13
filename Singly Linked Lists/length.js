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

    // Length
    // Create a new SLL method length() that returns number of nodes in that list.

    length(){
        // check if the list is empty
        if(!this.head){
            return null;
        }
        let runner = this.head;
        let length = 0;
        while(runner !== null){
            runner = runner.next;
            length +=1;
        }
        return length;
    }
}

ssl1 = new SLL();
console.log("***** AddFront *****");
console.log(ssl1.addFront(10));
console.log(ssl1.addFront(20));
console.log(ssl1.addFront(30));
console.log("***** Length *****");
console.log(ssl1.length());

