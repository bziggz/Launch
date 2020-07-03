function callback1() {
  console.log('callback1');
}

function callback2() {
  console.log('callback2');
}

function callback3() {
  console.log('callback3');
}

const randomizer = (...args) => {
  const callbacks = [...args];

  if (callbacks.length < 1) return;

  const totalTime = 2 * callbacks.length;
  let secondsPassed = 0;

  const currentTime = setInterval(() => {
    secondsPassed += 1;
    console.log(secondsPassed);

    if (secondsPassed >= totalTime) clearInterval(currentTime);
  }, 1000);

  callbacks.forEach(func => {
    setTimeout(func, Math.floor(Math.random() * totalTime * 1000));
  });
};

randomizer(callback1, callback2, callback3);