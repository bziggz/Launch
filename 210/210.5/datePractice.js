// Date and Time

const constructNew = new Date();
const functionNew = Date();

console.log(constructNew);
console.log(functionNew);

// getDay

const today = new Date();

console.log(`Today's day is ${today.getDay()}`);

// format getDay

const daysOfWeek = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];

const namedDay = daysOfWeek[today.getDay()];

console.log(`Today's day is ${namedDay}`);

// Add Calender Date

const date = today.getDate();

console.log(`Today is ${namedDay}, the ${date}`);

// Add suffix

const dateSuffix = (date) => {
  let result = '';

  if (date % 10 === 1) {
    result += 'st';
  } else if (date % 10 === 2) {
    result += 'nd';
  } else if (date % 10 === 3) {
    result += 'rd';
  } else {
    result += 'th';
  }

  if ([11, 12, 13].includes(date)) result = 'th';

  return String(date) + result;
};

const dateWithSuffix = dateSuffix(date);

console.log(`Today is ${namedDay}, the ${dateWithSuffix}`);

// getMonth

const month = today.getMonth();

console.log(`Today is ${namedDay}, ${month} ${dateWithSuffix}`);

// name month

const months = [
  'Jan', 'Feb', 'Mar',
  'Apr', 'May', 'Jun',
  'Jul', 'Aug', 'Sep',
  'Oct', 'Nov', 'Dec',
];

const namedMonth = months[month];

console.log(`Today is ${namedDay}, ${namedMonth} ${dateWithSuffix}`);

// refactor

const formattedMonth = (date) => months[date.getMonth()];

const formattedDay = (date) => daysOfWeek[date.getDay()];

const formattedDate = (date) => (
  `${formattedDay(date)}, ${formattedMonth(date)} ${dateSuffix(date.getDate())}`
);

console.log(`Today is ${formattedDate(today)}`);

// getYear vs getFullYear

console.log(today.getYear());
console.log(today.getFullYear());

// getTime

console.log(today.getTime());

// tomorrow

let tomorrow = new Date(today.getTime());

tomorrow.setDate(today.getDate() + 1);

console.log(`Tomorrow is ${formattedDate(tomorrow)}`);

// Compare next week

let nextWeek = new Date(today.getTime());

console.log(today === nextWeek);

// try compare again

console.log(today.toDateString() === nextWeek.toDateString());

nextWeek.setDate(today.getDate() + 7);

console.log(today.toDateString() === nextWeek.toDateString());

// format time

const formatTime = (date) => {
  let minutes = String(date.getMinutes());
  let hours = String(date.getHours());

  if (minutes.length < 2) minutes = '0' + minutes;
  if (hours.length < 2) hours = '0' + hours;

  return `${hours}:${minutes}`;
};

console.log(formatTime(new Date(2013, 2, 1, 1, 10)));
