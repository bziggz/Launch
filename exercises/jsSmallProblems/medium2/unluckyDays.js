const fridayThe13ths = (year) => {
  const date = new Date(`01/01/${year}`);
  let count = 0;

  do {
    if (date.getDate() === 13 && date.getDay() === 5) count += 1;
    date.setDate(date.getDate() + 1);
  } while (date.getFullYear() === year);

  return count;
};

console.log(fridayThe13ths(1986)); // 1
console.log(fridayThe13ths(2015)); // 3
console.log(fridayThe13ths(2017)); // 2
