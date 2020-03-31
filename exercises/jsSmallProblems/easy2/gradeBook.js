const getAvgGrade = (gradesArr) => (
  gradesArr.reduce((total, grade) => total + grade) / gradesArr.length
);

const gradeNumToLetter = (num) => {
  if (num < 60) return 'F';
  if (num < 70) return 'D';
  if (num < 80) return 'C';
  if (num < 90) return 'E';
  return 'A';
};

const getGrade = (...grades) => gradeNumToLetter(getAvgGrade(grades));


console.log(getGrade(95, 90, 93)); // "A"
console.log(getGrade(50, 50, 95)); // "D"
