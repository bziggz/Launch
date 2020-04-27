const wordDigits = [/\bzero\b/gi, /\bone\b/gi, /\btwo\b/gi, /\bthree\b/gi,
  /\bfour\b/gi, /\bfive\b/gi, /\bsix\b/gi, /\bseven\b/gi, /\beight\b/gi, /\bnine\b/gi];

const wordToDigit = (string) => {
  let result = string;

  wordDigits.forEach((regex) => {
    result = result.replace(regex, String(wordDigits.indexOf(regex)));
  });

  return result;
};



console.log(wordToDigit('Please call me at five five five one two three four. Thanks.'));
// "Please call me at 5 5 5 1 2 3 4. Thanks."
