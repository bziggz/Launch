const bands = [
  { name: 'sunset rubdown', country: 'UK', active: false },
  { name: 'women', country: 'Germany', active: false },
  { name: 'a silver mt. zion', country: 'Spain', active: true },
];

const formatted = (string) => string.split(' ')
  .map((word) => word[0].toUpperCase() + word.slice(1))
  .join(' ').replace(/\./g, '');


function processBands(data) {
  return data.map((band) => (
    {
      name: formatted(band.name),
      country: 'Canada',
      active: band.active,
    }
  ));
}

console.log(processBands(bands));

// should return:
// [
//   { name: 'Sunset Rubdown', country: 'Canada', active: false },
//   { name: 'Women', country: 'Canada', active: false },
//   { name: 'A Silver Mt Zion', country: 'Canada', active: true },
// ]
