const determineSuffix = (year) => {
  if ([11, 12, 13].includes(year % 100)) return 'th';

  switch (year % 10) {
    case 1:
      return 'st';
    case 2:
      return 'nd';
    case 3:
      return 'rd';
    default:
      return 'th';
  }
};

const century = (year) => {
  const centuryNumber = year % 100 === 0
    ? (year / 100) : parseInt((year / 100), 0) + 1;

  return String(centuryNumber) + determineSuffix(centuryNumber);
};

console.log(century(2000)); // "20th"
console.log(century(2001)); // "21st"
console.log(century(1965)); // "20th"
console.log(century(256)); // "3rd"
console.log(century(5)); // "1st"
console.log(century(10103)); // "102nd"
console.log(century(1052)); // "11th"
console.log(century(1127)); // "12th"
console.log(century(11201)); // "113th"
