// Push Front
// Given an array and an additional value, insert this value at the beginning of the array.

var arr = [3,4,5,6,7];
function pushFront([],nbr){
    for(var i = arr.length; i>0 ; i--){
        arr[i] = arr[i-1];
    }
    arr[0] = nbr;
}
console.log(arr);
pushFront(arr,2);
console.log(arr);
console.log("______________________");

// Pop Front
// Given an array, remove and return the value at the beginning of the array. 
// Prove the value is removed from the array by printing it.

var arr = [3,4,5,6,7];
function popFront([]){
    x = arr[0];
    for(var i = 0; i<arr.length ; i++){
        arr[i] = arr[i+1];
    }
    arr.pop();
    return x;
}
console.log(arr);
value =  popFront(arr);
console.log("The value removed = "+value);
console.log(arr);
console.log("______________________");

// Insert At
// Given an array, index, and additional value, insert the value into array at given index. 
// You can think of pushFront(arr,val) as equivalent to insertAt(arr,0,val).

var arr = [3,4,5,6,7];
function insertAt([],index,nbr){
    for(var i = 0; i<arr.length ; i++){
        if(i==index){
            for(j = arr.length; j>i; j--){
                arr[j]= arr[j-1]
            }
            arr[i] = nbr;
        }
    }
}
console.log(arr);
insertAt(arr,2,4.5);
console.log(arr);
console.log("______________________");

// BONUS: Remove At
// Given an array and an index into array, remove and return the array value at that index. 
// Prove the value is removed from the array by printing it. 
// Think of popFront(arr) as equivalent to removeAt(arr,0).

var arr = [3,4,5,6,7];
function removeAt([],index){
    for(var i = 0; i<arr.length ; i++){
        if(i == index){
            x = arr[i];
            for(j=i; j<arr.length; j++){
                arr[j] = arr[j+1];
            }
        }
    }
    arr.pop();
    return x;
}
console.log(arr);
value =  removeAt(arr,2);
console.log("The value removed = "+value);
console.log(arr);
console.log("______________________");

// BONUS: Swap Pairs
// Swap positions of successive pairs of values of given array.
//  If length is odd, do not change the final element.

arr = [3,4,5,6,7,8];
function swapPairs([]){
    if(arr.length %2 == 0){
        for(var i=0; i<arr.length-1 ; i+=2){
            temp = arr[i];
            arr[i] = arr[i+1];
            arr[i+1] = temp;
        }
    }else{
        for(var i=0; i<arr.length-2 ; i+=2){
            temp = arr[i];
            arr[i] = arr[i+1];
            arr[i+1] = temp;
        }
    }
}
console.log(arr);
swapPairs(arr);
console.log(arr);
console.log("______________________");

// BONUS: Remove Duplicates
// Given a sorted array, remove duplicate values. Because array elements are already in order, 
// all duplicate values will be grouped together. If you already made the Remove At function, 
// you are welcome to use that! If you solved this using nested loops, for an extra challenge,
//  try to do it without any nested loops!

var arr = [3,3,4,5,6,6,6,6,7];
function removeDuplicates([]){
    for(var i = 0; i<arr.length ; i++){
        if(arr[i] == arr[i+1]){
            for(j=i+1; j<arr.length; j++){
                arr[j] = arr[j+1];
            }
            arr.pop();
        }
        if(arr[i] == arr[i+1]){
            i--
        }
    }
}
console.log(arr);
removeDuplicates(arr);
console.log(arr);
console.log("______________________");