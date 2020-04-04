// Part 1

function formatTime(time) {
  return (time.length < 2) ? `0${time}` : time;
}

function timeOfDay(mins) {
  const millisecPerMinute = 60000;

  const midnight = new Date('1/1/1970 00:00');
  const afterMidnight = new Date(midnight.getTime() + mins * millisecPerMinute);

  let hours = String(afterMidnight.getHours());
  let minutes = String(afterMidnight.getMinutes());

  hours = formatTime(hours);
  minutes = formatTime(minutes);

  return `${hours}:${minutes}`;
}


console.log(timeOfDay(0)); // "00:00"
console.log(timeOfDay(-3)); // "23:57"
console.log(timeOfDay(35)); // "00:35"
console.log(timeOfDay(-1437)); // "00:03"
console.log(timeOfDay(3000)); // "02:00"
console.log(timeOfDay(800)); // "13:20"
console.log(timeOfDay(-4231)); // "01:29"

// Part 2

const afterMidnight = (timeString) => {
  const baseTime = new Date('1/1/1970 00:00');
  const time = new Date(`1/1/1970 ${timeString}`);

  return (Math.abs((baseTime.getTime() - time.getTime())) / 60000) % 1440;
};

const beforeMidnight = (timeString) => {
  const baseTime = new Date('1/1/1970 24:00');
  const time = new Date(`1/1/1970 ${timeString}`);

  return (Math.abs((baseTime.getTime() - time.getTime())) / 60000) % 1440;
};

console.log(afterMidnight('00:00')); // 0
console.log(beforeMidnight('00:00')); // 0
console.log(afterMidnight('12:34')); // 754
console.log(beforeMidnight('12:34')); // 686
