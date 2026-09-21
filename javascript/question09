let arr = [4, 2, 4, 3, 2, 4, 5, 2];

let count = {};

for (let x of arr) {
    count[x] = (count[x] || 0) + 1;
}

let max = 0;
let answer = 0;

for (let x of arr) {
    if (count[x] > max) {
        max = count[x];
        answer = x;
    }
}

console.log(answer);