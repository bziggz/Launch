var i = 0;
while (i < 10) {
  if (i % 3 === 0) {
    console.log(i);
  } else {
    i += 1;
  }
}

/* will be an infinite loop, becuase once i % 3 === 0, it never branches 
to the increment branch */