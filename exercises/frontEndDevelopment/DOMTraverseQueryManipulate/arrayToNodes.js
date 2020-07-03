const arrayToNodes = (nodes) => {
  const parent = document.createElement(nodes[0]);
  const children = nodes[1];

  if (children.length === 0) return parent;

  for (let i = 0; i < children.length; i += 1) {
    parent.appendChild(arrayToNodes(children[i]));
  }

  return parent;
};


const nodes = ["BODY",[["HEADER",[]],["MAIN",[]],["FOOTER",[]]]];

arrayToNodes(nodes);
