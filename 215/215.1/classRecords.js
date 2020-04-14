// Class Admin Metrics

const examWeight = 0.65;
const exerciseWeight = 0.35;
const numberOfExams = 4;

// Parse and Format Student Information

const sumScores = (accumulator, score) => accumulator + score;

const averageExamScorePerStudent = (student) => (
  student.scores.exams.reduce(sumScores, 0) / student.scores.exams.length
);

const totalExerciseScores = (student) => (
  student.scores.exercises.reduce(sumScores, 0)
);

const generateFinalGrade = (examScore, exerciseScore) => (
  Math.round((examScore * examWeight) + (exerciseScore * exerciseWeight))
);

const generateLetterGrade = (numGrade) => {
  if (numGrade <= 59) return 'F';
  if (numGrade <= 68) return 'E';
  if (numGrade <= 76) return 'D';
  if (numGrade <= 84) return 'C';
  if (numGrade <= 92) return 'B';
  return 'A';
};

const processStudentGrade = (student, scores) => {
  const examAvg = averageExamScorePerStudent(scores[student]);
  const exerciseTotal = totalExerciseScores(scores[student]);
  const finalGradePercent = generateFinalGrade(examAvg, exerciseTotal);
  const letterGrade = generateLetterGrade(finalGradePercent);

  return `${finalGradePercent} (${letterGrade})`;
};

const generateStudentGrades = (scores) => (
  Object.keys(scores).map((student) => processStudentGrade(student, scores))
);

// Parse and Format Exam Information

const gatherScoresPerExam = (scores) => {
  const scoresPerExam = [...Array(numberOfExams)].map(() => []);

  const scoresPerStudent = Object.keys(scores)
    .map((student) => scores[student].scores.exams);

  scoresPerStudent.forEach((exam) => (
    exam.forEach((score, index) => scoresPerExam[index].push(score))
  ));

  return scoresPerExam;
};

const averageScorePerExam = (exam) => 
  Number((exam.reduce(sumScores, 0) / exam.length).toFixed(2));

const minimumScorePerExam = (examScores) => Math.min(...examScores);

const maximumScorePerExam = (examScores) => Math.max(...examScores);

const generateExamSummary = (exam) => (
  {
    average: averageScorePerExam(exam),
    minimum: minimumScorePerExam(exam),
    maximum: maximumScorePerExam(exam),
  }
);

const generateExamSummaries = (scores) => (
  gatherScoresPerExam(scores).map((exam) => generateExamSummary(exam))
);

// Main Function

const generateClassRecordSummary = (scores) => (
  {
    studentGrades: generateStudentGrades(scores),
    exams: generateExamSummaries(scores),
  }
);

// Class Info and Main Function Call

const studentScores = {
  student1: {
    id: 123456789,
    scores: {
      exams: [90, 95, 100, 80],
      exercises: [20, 15, 10, 19, 15],
    },
  },
  student2: {
    id: 123456799,
    scores: {
      exams: [50, 70, 90, 100],
      exercises: [0, 15, 20, 15, 15],
    },
  },
  student3: {
    id: 123457789,
    scores: {
      exams: [88, 87, 88, 89],
      exercises: [10, 20, 10, 19, 18],
    },
  },
  student4: {
    id: 112233445,
    scores: {
      exams: [100, 100, 100, 100],
      exercises: [10, 15, 10, 10, 15],
    },
  },
  student5: {
    id: 112233446,
    scores: {
      exams: [50, 80, 60, 90],
      exercises: [10, 0, 10, 10, 0],
    },
  },
};

console.log(generateClassRecordSummary(studentScores));
