function walk(node, callback) {
  callback(node);

  for (let index = 0; index < node.childNodes.length; index += 1) {
    walk(node.childNodes[index], callback);
  }
}

// 1

let html = document.childNodes[1]
let body = html.lastChild
let header = body.childNodes[1];

header.style.color = 'red';
header.style.fontSize = '48px';

// 2

let paras = [ ...body.childNodes ].filter(node => node.nodeName === 'P');
console.log(paras.length);

// 3

let firstWord = paras.map(p => p.textContent.trim().split(' ')[0]);
console.log(firstWord)

// 4

let first = true;
walk(document, node => {
  if (node.nodeName === 'P') {
    if (first) {
      first = false;
    } else {
      node.classList.add('stanza');
    }
  }
});

// 5

let images = [];

walk(document, node => {
  if (node.nodeName === 'IMG') images.push(node);

});

console.log(images.length);

let pngImages = images.filter(node => node.getAttribute('src').match(/.png$/));

console.log(pngImages.length);

// 6

walk(document, node => {
  if (node.nodeName === 'A') node.style.color = 'red';
});
