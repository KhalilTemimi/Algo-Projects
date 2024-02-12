// Remove Blanks
// Create a function that, given a string, returns all of that string’s contents, but without blanks. 

function removeBlanks(element){
    var exp1 = element.split(" ");
    var exp2 = exp1.join("");
    console.log(exp2);
}

removeBlanks("I can not believe it's not butter");

// Get Digits
// Create a JavaScript function that given a string, returns the integer made from the string’s digits. 

function getDigits(element){
    
    var nbr = "";
    for (let char of element){
        if(!isNaN(Number(char))){
            nbr += char;
        }
    }
    var nbr = Number(nbr);
    console.log(nbr);
}

getDigits("Ic3ann2otbe5liev7eit'snotb9utter");

// Acronyms
// Create a function that, given a string, returns the string’s acronym (first letter of the word capitalized)

function acronyms(element){
    var exp1 = element.split(" ");
    var acronym = "";
    for(var i=0; i<exp1.length; i++){
        exp2 = exp1[i].split("");
        acronym += (exp2[0].toUpperCase());
    }
    console.log(acronym);
}

acronyms("Live form Nrw York, it's saturday night!");

// Count Non-Spaces
// Create a function that, given a string, returns the number of non-space characters found in the string. 

function countNonSpaces(element){
    var exp1 = element.split(" ");
    var exp2 = exp1.join("");
    console.log(exp2.length);
}

countNonSpaces("hello world! ");

// Remove Shorter Strings
// Create a function that, given an array of strings and a numerical value, returns an array that only contains strings longer than or equal to the given value.

function removeShorterStrings(arr,val){
    var newArr = [];
    for(let word of arr){
        if(word.length>= val){
            newArr.push(word);
        }
    }
    console.log(newArr);
}

removeShorterStrings(['Good morning', 'sunshine', 'the', 'Earth', 'says', 'no', 'hello'], 4);
