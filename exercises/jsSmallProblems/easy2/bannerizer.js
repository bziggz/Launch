const line = (char, count) => {
  let result = '';

  for (let i = 0; i < count; i += 1) result += char;

  return result;
};

const logInBox = (string, width = string.length) => {

  console.log(`+-${line('-', width)}-+`);
  console.log(`| ${line(' ', width)} |`);
  console.log(`| ${string.slice(0, width)} |`);
  console.log(`| ${line(' ', width)} |`);
  console.log(`+-${line('-', width)}-+`);
};

logInBox('To boldly go where no one has gone before.');
