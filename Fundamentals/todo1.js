// ----- Setting and swapping -----

var myNumber = 42;
var myName = "khalil";

var x = myNumber;
myNumber = myName;
myName = x;
console.log(myName, myNumber);

// ----- Print -52 to 1066 -----

for(var count = -52; count<1067; count++){
    console.log(count);
}

// ----- Don't worry be happy -----

function beCheerful(){
    console.log("Good morning!");
}
for(var i =0; i<98; i++){
    beCheerful();
}

// ----- multiple sof three but not all -----

for( i=-300; i<0; i++){
    if(i%3 == 0){
        if (i == -3 || i == -6){
            continue;
        }
        console.log(i);
    }
}

// ----- priting integres with while -----

var x = 2000;
while(x<5281){
    console.log(x);
    x++;
}

// ----- You say it's your birthday -----

let day = 20;
let month = 4;

if(day == 27 && month == 4){
    console.log("How did you know?");
}else{
    console.log("Just another day...")
}

// ------ Leap Year -----

y = 3000;
if((y%4 == 0 || y%400 == 0) && (y%100 != 0)){
    console.log("this is a leap year.")
}else{
    console.log("this is not a leap year.")
    }

    // ------ Print and count -----

count = 0;
 for(var i = 512; i<4097; i++){
    if(i%5 == 0){
        count ++;
        console.log(i);
    }
}
console.log("there was "+count+" multiples of 5");

// ------ Multiple of six -----

var i =0;
while (i<60001){
    if(i%6 == 0){
        console.log(i);
    }
    i++;
}

// ------ Counting, the Dojo way -----

for(i=1; i<101; i++){
    if (i%5 == 0 && i%10 == 0){
        console.log("Coding Dojo");
    }else if(i%5 == 0){
        console.log("Coding");
    }else{
        console.log(i);
    }
}

// ------ What do you know -----

function incoming(param){
    console.log(param);
}
incoming("Hello");

// ------ Whoa, that sucker's Huge... -----

result = 0;
for(i=-300000; i<300001; i++){
    if(i%2 !=0){
        result += i;
    }
}
console.log(result);

// ------ Count Down By four -----
i=2016;
while(i>0){
    console.log(i);
    i-=4;
}

// ------ Flexible Countdown -----

function Countdown (low,hight,mult){
    for(i = hight; i>low; i--){
        if(i%mult == 0){
            console.log(i);
        }
    }
}
Countdown(4,15,3);

// ------ The Final Countdown -----

function finalCountdown(x,y,z,w){
    for(i = y; i<z; i++){
        if(i%x == 0){
            if(i == w){
                continue;
            }
        console.log(i);
        }
    }
}
finalCountdown(3,5,17,9);