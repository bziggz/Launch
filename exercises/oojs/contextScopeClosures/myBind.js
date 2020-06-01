const myBind = (func, context) => {
  return function() {
    return func.apply(context, ...);
  };
};

const myBind2 = (func, context) => {
  const partialArgs = [...arguments].slice(2);

  return function() {
    const args = partialArgs.concat([...arguments]);
    return func.apply(context, args);
  }
};

