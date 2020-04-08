var languages = ['JavaScript', 'Ruby', 'Python'];

console.log(languages); // will log ['JavaScript', 'Ruby', 'Python']
console.log(languages.length); // will log 3

languages.length = 4;

console.log(languages); // will log ['JavaScript', 'Ruby', 'Python', <1 empty item>]
console.log(languages.length); // will log 4

languages.length = 1;

console.log(languages); // will log ['JavaScript']
console.log(languages.length); // will log 1

languages.length = 3;

console.log(languages); // will log ['JavaScript', <2 empty items>]
console.log(languages.length); // will log 3

languages.length = 1;
languages[2] = 'Python';

console.log(languages); // will log ['JavaScript', <1 empty item>, 'Python']
console.log(languages[1]); // will log undefined
console.log(languages.length); // will log 3

