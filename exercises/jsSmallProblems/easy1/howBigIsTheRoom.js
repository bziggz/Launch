const conversion = 10.7639;

const length = parseFloat(prompt('Enter the length of the room in meters:'));
const width = parseFloat(prompt('Enter the width of the room in meters:'));

const squareMeters = length * width;
const squareFeet = squareMeters * 10.7639;

console.log(`The area of the room is ${squareMeters} square meters`
  + `(${squareFeet} square feet).`);

// FE
const conversion = 10.7639;
const roomSize = () => {
  let type = prompt('Are your measurements in feet or meters? (f/m)');

  type = (type === 'f') ? 'feet' : 'meters';

  const length = parseFloat(prompt(`Enter the length of the room in ${type}:`));
  const width = parseFloat(prompt(`Enter the width of the room in ${type}:`));

  const area = length * width;

  if (type === 'feet') {
    const convertedArea = area / conversion;
    console.log(`The area of the room is ${area.toFixed(2)} square feet`
  + `(${convertedArea.toFixed(2)} square meters).`);
  } else {
    const convertedArea = area * conversion;
    console.log(`The area of the room is ${area.toFixed(2)} square meters`
  + `(${convertedArea.toFixed(2)} square feet).`);
  }
};

roomSize();
