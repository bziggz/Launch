// 1

// const h2s = [...document.querySelectorAll('h2')];

// const h2Lengths = h2s.map((h2) => h2.textContent.split(' ').length);

// h2Lengths.forEach((length) => console.log(length));

// 2

// console.log(document.getElementById('toc'));
// console.log(document.querySelector('#toc'));
// console.log(document.querySelectorAll('.toc')[0]);

// 3

// [...document.querySelectorAll('.toc a')]
//   .filter((_, idx) => idx % 2 === 1)
//   .forEach((el) => el.style.color = 'green');

// 4

// const text = [...document.querySelectorAll('.thumbcaption')]
//   .map((caption) => caption.textContent.trim());

// console.log(text);

// 5

const classifications = ['Kingdom', 'Phylum', 'Class', 'Order', 'Family', 'Genus', 'Species'];

const result = {};
const values = [...document.querySelectorAll('.infobox td')];

values.forEach((td) => {
  const possibleKey = td.textContent.replace(':', '');
  if (classifications.includes(possibleKey)) {
    result[possibleKey] = td.nextElementSibling.firstElementChild.textContent;
  }
});

console.log(result);
