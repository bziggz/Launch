const colorGeneration = (target) => {
  let generation = 0;
  let parents = [document.body];
  let elements;

  while (generation < target) {
    generation += 1;
    elements = parents.map(({children}) => Array.prototype.slice.call(children))
      .reduce((collection, children) => collection.concat(children), []);
    parents = elements;
  }

  if (elements) elements.forEach(({classList}) => classList.add('generation-color'));
};

colorGeneration(4);