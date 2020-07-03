function sliceTree(startId, endId) {
  const startElement = document.getElementById(startId);
  let endElement = document.getElementById(endId);

  if (!startElement || !endElement) return undefined;

  const result = [];
  let currentElement;

  do {
    currentElement = endElement;
    result.unshift(currentElement.tagName);
    endElement = endElement.parentNode;
  } while (currentElement.id !== String(startId) && endElement.tagName !== 'BODY');

  return currentElement.id !== String(startId) && endElement.tagName === 'BODY'
    ? undefined : result;
}


console.log(sliceTree(1, 4));