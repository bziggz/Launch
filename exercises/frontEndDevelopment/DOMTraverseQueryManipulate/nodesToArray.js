const nodesToArr = (parentNodes) => {
  if (parentNodes === null) return [];

  const currentNodes = parentNodes || [document.body];

  return [...currentNodes].map((node) => [node.tagName, nodesToArr(node.children)]);
};

console.log(JSON.stringify(nodesToArr()));
