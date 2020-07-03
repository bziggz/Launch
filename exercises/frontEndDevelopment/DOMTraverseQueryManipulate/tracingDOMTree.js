function domTreeTracer(id) {
  let currentElement = document.getElementById(id);
  let parentElement;
  const tree = [];

  do {
    parentElement = currentElement.parentNode;

    const children = Array.from(parentElement.children, function(sibling) { 
      return sibling.nodeName 
    });

    tree.push(children);

    currentElement = parentElement;

  } while (parentElement.tagName !== 'BODY');

  return tree;
}


console.log(domTreeTracer(2));