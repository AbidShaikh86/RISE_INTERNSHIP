// Q1 — Variables & Arithmetic Operators 
let num1 = 20;
let num2 = 39;
console.log('Sum: ', num1 + num2);
console.log("Difference: ", num1 - num2);
console.log("Product: ", num1 * num2);
console.log("quotient: ", num1 / num2);

// Q2 — Swap Two Variables
let a = 5;
let b = 10;
let temp = a;
a = b;
b = temp;
console.log("A = ", a);
console.log("B = ", b);

// Q3 — Comparison & Logical Operators
let age = 22;
let hasID = true;
console.log(hasID == true && age >= 18);

// Q4 — Basic if / else
let num = 10;
if (num > 0) {
    console.log("Positive");
} else {
    console.log("Negative");
}

// Q5 — if / else if / else Grading System
let marks = 69;
if (marks >= 90) {
    console.log("Grade: A");
} else if (marks <= 89 && marks >= 75) {
    console.log("Grade: B");
} else if (marks <= 74 && marks >= 60) {
    console.log("Grade: C");
} else {
    console.log("Grade: F");
}

// Q6 — switch Statement
let dayNumber = 1;
switch (dayNumber) {
    case 1:
        console.log("Monday");
        break;
    case 2:
        console.log("Tuesday");
        break;
    case 3:
        console.log("Wednesday");
        break;
    case 4:
        console.log("Thursday");
        break;
    case 5:
        console.log("Friday");
        break;
    case 6:
        console.log("Saturday");
        break;
    case 7:
        console.log("Sunday");
        break;
    default:
        console.log("Enter Valid Day Number");
        break;
}

// Q7 — Fix the Missing break
let size = "M";
switch (size) {
    case "S":
        console.log("Small");
        break;
    case "M":
        console.log("Medium");
        break;
    case "L":
        console.log("Large");
        break;
    default:
        console.log("Unknown size");
}

// Q8 — Ternary Operator (Basic)
let number = 105;
let result = number < 40 ? "Slow" : number > 40 && number < 60 ? "Normal" : "Fast"
console.log(result);

// Q10 — for Loop: Print a Range
for (let i = 0; i <= 10; i++) {
    console.log(i);
}

// Q11 — for Loop: Sum of Numbers
let add = 0;
for (let i = 0; i <= 50; i++) {
    add += i;
    console.log(add);
}
console.log("Sum of 1 - 50 is ", add);


// Q12 — for Loop: Multiplication Table
for (let i = 1; i <= 10; i++) {
    let mul = 7 * i;
    console.log("7 x ", i, " = ", mul);
}

// Q13 — for...of : Iterate Array Values
const colors = ["red", "green", "blue", "yellow"];
for (const element of colors) {
    console.log(element);
}

// Q14 — for...of : Sum an Array
const prices = [250, 899, 120, 45, 999];
let totalPrice = 0;
for (const element of prices) {
    totalPrice += element;
}
console.log("Sum of Price is ", totalPrice);

// Q15 — for...in : Iterate Object Keys
const laptop = {
    brand: "Dell",
    ram: "16GB",
    storage: "512GB SSD"
};
for (const key in laptop) {
    if (!Object.hasOwn(laptop, key)) continue;
    const element = laptop[key];
    console.log(key, ":", element);
}

// Q16 — for...in : Count Properties
let counter = 0;
for (const key in laptop) {
    const element = laptop[key];
    counter++;
}
console.log("total element in obeject is ", counter);

// Q17 — while Loop
let countdown = 10
while (countdown > 0) {
    console.log(countdown);
    countdown--;
    if (countdown == 0) {
        console.log("Liftoff!");
    }
}

// Q18 — do...while Loop
let Q18 = 1
do {
    console.log(Q18);
    Q18++;
} while (Q18 <= 500);

// Q19 — Combine Loops + Conditionals: FizzBuzz
for (let i = 0; i <= 30; i++) {
    if (i % 3 == 0 && i % 5 == 0) {
        console.log("FizzBuzz");
    } else if (i % 3 == 0) {
        console.log("Fizz");
    } else if (i % 5 == 0) {
        console.log("Buzz");
    } else {
        console.log(i);
    }
}

// Q20 — Mini Project: Simple Grade Report
const scores = [95, 42, 78, 60, 88];

for (const element of scores) {
    if (element >= 90) {
        console.log("Scores: ", element, ", Grade: A");
    } else if (element <= 89 && marks >= 75) {
        console.log("Scores: ", element, ", Grade: B");
    } else if (element <= 74 && marks >= 60) {
        console.log("Scores: ", element, ", Grade: C");
    } else {
        console.log("Scores: ", element, ", Grade: F");
    }
}