const nodeSwap = (node1Id, node2Id) => {
  const node1 = document.getElementById(node1Id);
  const node2 = document.getElementById(node2Id);

  if (node1 && node2 && !(node1.contains(node2) || node2.contains(node1))) {
    const node1Clone = node1.cloneNode(true);
    const node2Clone = node2.cloneNode(true);
    const node1Parent = node1.parentNode;
    const node2Parent = node2.parentNode;

    node1Parent.replaceChild(node2Clone, node1);
    node2Parent.replaceChild(node1Clone, node2);
  }
};

nodeSwap(3, 1);
nodeSwap(7, 9);