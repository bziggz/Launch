const startCounting = () => {
  let a = 0;

  return setInterval(() => {
    a += 1;
    console.log(a);
  }, 1000);
};

const stopID = startCounting();

const stopCounting = () => {
  clearInterval(stopID);
};
