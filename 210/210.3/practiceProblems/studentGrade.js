const getGrades = function getGrades() {
  const grades = [];

  for (let i = 1; i <= Infinity; i += 1) {
    if (prompt('Do you have another grade to enter? (y/n)') === 'n') break;
    const grade = Number(prompt(`Enter score ${i}:`));
    grades.push(grade);
  }

  return grades.reduce((acc, el) => acc + el, 0) / grades.length;
};

const letterGrade = function displayAverageGrade() {
  const average = getGrades();
  let letter;

  if (average >= 90) {
    letter = 'A';
  } else if (average >= 70) {
    letter = 'B';
  } else if (average >= 50) {
    letter = 'C';
  } else {
    letter = 'F';
  }

  console.log('Based on the average of your three scores, '
    + `your letter grade is "${letter}".`);
};

letterGrade();
