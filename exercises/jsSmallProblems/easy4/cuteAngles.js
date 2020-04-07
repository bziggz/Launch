const leadZero = (num) => {
  if (String(num).length < 2) return `0${num}`;
  return String(num);
};

const dms = (angle) => {
  const rangedAngle = angle % 360;
  const positiveAngle = rangedAngle >= 0 ? rangedAngle : 360 + rangedAngle;

  const degrees = Math.floor(positiveAngle);
  const minutes = Math.floor((positiveAngle - degrees) * 60);
  const seconds = Math.floor(((positiveAngle - degrees) * 60 - minutes) * 60);

  return `${degrees}°${leadZero(minutes)}'${leadZero(seconds)}"`;
};

console.log(dms(30)); // 30°00'00"
console.log(dms(76.73)); // 76°43'48"
console.log(dms(254.6)); // 254°35'59"
console.log(dms(93.034773)); // 93°02'05"
console.log(dms(0)); // 0°00'00"
console.log(dms(360)); // 360°00'00" or 0°00'00"

console.log(dms(-1)); // 359°00'00"
console.log(dms(400)); // 40°00'00"
console.log(dms(-40)); // 320°00'00"
console.log(dms(-420)); // 300°00'00"
