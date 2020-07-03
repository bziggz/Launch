function walk(node, callback) {
  callback(node);

  for (let i = 0; i < node.childNodes.length; i += 1) {
    walk(node.childNodes[i], callback);
  }
};

// 1

// function findAllParagraphs() {
//   let result = [];
//   let nodes = document.body.childNodes;

//   for (let index = 0; index < nodes.length; index += 1) {
//     if (nodes[index].nodeName === 'P') {
//       result.push(nodes[index]);
//     }
//   }

//   return result;
// }

// console.log(findAllParagraphs());

// 2

// function addArticleTextClass() {
//   walk(document, (node) => {
//     if (node instanceof HTMLParagraphElement) node.classList.add('article-text');
//   });
// }

// addArticleTextClass();

// 3

// const getElementsByTagName = (tag) => {
//   const result = [];

//   walk(document, node => {;
//     if (node.nodeName === `${tag.toUpperCase()}`) result.push(node);
//   });

//   return result;
// };

// getElementsByTagName('p').forEach(node => node.classList.add('article-text'));

// 2.1

// const paras = [...document.getElementsByTagName('p')];

// paras.forEach((node) => node.classList.add('article-text'));

// 2.2

const intros = document.getElementsByClassName('intro');

for (let index = 0; index < intros.length; index += 1) {
  const paragraphs = intros[index].getElementsByTagName('p');

  for (let p = 0; p < paragraphs.length; p += 1) {
    paragraphs[p].classList.add('article-text');
  }
}
