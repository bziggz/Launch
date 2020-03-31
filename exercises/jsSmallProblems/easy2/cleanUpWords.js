const cleanUp = (string) => {
  let result = '';

  for (let i = 0; i < string.length; i += 1) {
    const last = result.length - 1;

    if (/[^a-zA-Z]/.test(string[i])) {
      if (result[last] !== ' ') result += ' ';
    } else {
      result += string[i];
    }
  }

  return result;
};

console.log(cleanUp("---what's my +*& line?")); // " what s my line "
