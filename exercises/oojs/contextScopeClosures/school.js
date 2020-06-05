const school = (function () {
  const students = [];
  const validYears = ['1st', '2nd', '3rd', '4th', '5th'];

  const createStudent = (name, year) => (
    {
      name,
      year,
      courses: [],

      info() {
        console.log(`${this.name} is a ${this.year} year student.`);
      },

      addCourse(courseObj) {
        this.courses.push(courseObj);
      },

      listCourses() {
        console.log(this.courses);
      },

      addNote(courseCode, note) {
        this.courses.forEach((course) => {
          if (course.code === courseCode) {
            course.note === undefined ? course.note = note : course.note += `; ${note}`;
          }
        });
      },

      updateNote(courseCode, note) {
        this.courses.forEach((course) => {
          if (course.code === courseCode) course.note = note;
        });
      },

      viewNotes() {
        const result = [];

        this.courses.forEach((course) => {
          if (course.note !== undefined) result.push(course);
        });

        result.forEach((course) => {
          console.log(`${course.name}: ${course.note}`);
        });
      },
    }
  );

  return {
    addStudent(name, year) {
      if (!validYears.includes(year)) return 'Invalid Student';

      const student = createStudent(name, year);
      students.push(student);
      return student;
    },

    enrollStudent(student, courseObj) {
      for (let i = 0; i < students.length; i += 1) {
        if (students[i].name === student) students[i].addCourse(courseObj);
      }
    },

    addGrade(student, course, grade) {
      for (let i = 0; i < students.length; i += 1) {
        if (students[i].name === student) {
          for (let j = 0; j < students[i].courses.length; j += 1) {
            if (students[i].courses[j].name === course
            || students[i].courses[j].code === course) {
              students[i].courses[j].grade = grade;
            }
          }
        }
      }
    },

    getReportCard(student) {
      for (let i = 0; i < students.length; i += 1) {
        if (students[i].name === student) {
          for (let course = 0; course < students[i].courses.length; course += 1) {
            if (students[i].courses[course].grade === undefined) {
              console.log(`${students[i].courses[course].name}: In Progress`);
            } else {
              console.log(`${students[i].courses[course].name}: ${students[i].courses[course].grade}`);
            }
          }
        }
      }
    },

    courseReport(courseName) {
      const courseGrades = [];

      console.log(`= ${courseName} Grades =`);

      for (let student = 0; student < students.length; student += 1) {
        for (let course = 0; course < students[student].courses.length; course += 1) {
          if (students[student].courses[course].name === courseName
          && students[student].courses[course].grade !== undefined) {
            const courseGrade = students[student].courses[course].grade;
            courseGrades.push(courseGrade);

            console.log(`${students[student].name}: ${courseGrade}`);
          }
        }
      }

      const courseAvg = courseGrades.reduce((a, b) => a + b, 0) / courseGrades.length;

      console.log('---');
      console.log(`Course Average: ${parseInt(courseAvg, 10)}`);
    },
  };
}());

console.log(school);
