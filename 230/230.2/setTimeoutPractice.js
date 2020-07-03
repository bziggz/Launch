// 1

const delayLog = () => {
  for (let i = 1; i <= 10; i += 1) {
    setTimeout(() => {
      console.log(i)
    }, i * 1000)
  };
};

delayLog();

// 2

setTimeout(() => {      // 1
  console.log('Once');  // 5
}, 1000);               

setTimeout(() => {      // 2
  console.log('upon');  // 7
}, 3000);

setTimeout(() => {      // 3
  console.log('a');     // 6
}, 2000);

setTimeout(() => {      // 4
  console.log('time');  // 8
}, 4000);

// 3

setTimeout(() => { // 10
  setTimeout(() => { // 10 + 15
    q();
  }, 15);

  d(); // 10

  setTimeout(() => { // 10 + 5
    n();
  }, 5);

  z(); // 10
}, 10);

setTimeout(() => { // 20
  s();
}, 20);

setTimeout(() => { // 0
  f();
});

g(); // 0

// g, f, d, z, n, s, q, f

// 4

const afterNSeconds = (callback, seconds) => {
  const delay = seconds * 1000;
  setTimeout(callback, delay);
};


