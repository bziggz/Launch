const swapName = (name) => {
  const fullName = name.split(' ');

  return `${fullName.pop()}, ${fullName.join(' ')}`;
};

console.log(swapName('Billy Joe Roberts')); // "Roberts, Billy Joe"
