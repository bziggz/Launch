const names = ['Frank', 'Dee', 'Charlie', 'Mac', 'Dennis'];
const upperNames = [];
let index = 0;

while (index < names.length) {
  const upperCaseName = names[index].toUpperCase();
  upperNames.push(upperCaseName);
  index += 1;
}

console.log(upperNames);


const names2 = ['Bender', 'Fry', 'Leela', 'Amy', 'Zoidberg'];
const upperNames2 = [];

for (let idx = 0; idx < names2.length; idx += 1) {
  const upperCaseName = names2[idx].toUpperCase();
  upperNames2.push(upperCaseName);
}

console.log(upperNames2);
