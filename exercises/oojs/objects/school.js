// addStudent: Adds a student by creating a new student and adding the student 
// to a collection of students. The method adds a constraint that the year can 
// only be any of the following values: '1st', '2nd', '3rd', '4th', or '5th'. 
// Returns a student object if year is valid otherwise it logs "Invalid Year".

// enrollStudent: Enrolls a student in a course.

// addGrade: Adds the grade of a student for a course.

// getReportCard: Logs the grades of a student for all courses. If the course
 // has no grade, it uses "In progress" as the grade.

// courseReport: Logs the grades of all students for a given course name. 
// Only student with grades are part of the course report.

// To test your code, use the three student objects listed below. Using 
// the three student objects, produces the following values from the 
// getReportCard and courseReport methods respectively.

// foo;
// {
//   name: 'foo',
//   year: '3rd',
//   courses: [
//     { name: 'Math', code: 101, grade: 95, },
//     { name: 'Advanced Math', code: 102, grade: 90, },
//     { name: 'Physics', code: 202, }
//   ],
// }

// bar;
// {
//   name: 'bar',
//   year: '1st',
//   courses: [
//     { name: 'Math', code: 101, grade: 91, },
//   ],
// }

// qux;
// {
//   name: 'qux',
//   year: '2nd',
//   courses: [
//     { name: 'Math', code: 101, grade: 93, },
//     { name: 'Advanced Math', code: 102, grade: 90, },
//    ],
// }


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
        console.log(`${course.name}: ${course.note}`)
      });
    },
  }
);

const school = {
  students: [],

  addStudent(name, year) {
    if (!['1st', '2nd', '3rd', '4th', '5th'].includes(year)) return 'Invalid Student';

    const student = createStudent(name, year);
    this.students.push(student);
    return student;
  },

  enrollStudent(student, courseObj) {
    for (let i = 0; i < this.students.length; i += 1) {
      if (this.students[i].name === student) this.students[i].addCourse(courseObj);
    }
  },

  addGrade(student, course, grade) {
    for (let i = 0; i < this.students.length; i += 1) {
      if (this.students[i].name === student) {
        for (let j = 0; j < this.students[i].courses.length; j += 1) {
          if (this.students[i].courses[j].name === course
          || this.students[i].courses[j].code === course) {
            this.students[i].courses[j].grade = grade;
          }
        }
      }
    }
  },

  getReportCard(student) {
    for (let i = 0; i < this.students.length; i += 1) {
      if (this.students[i].name === student) {
        for (let course = 0; course < this.students[i].courses.length; course += 1) {
          if (this.students[i].courses[course].grade === undefined) {
            console.log(`${this.students[i].courses[course].name}: In Progress`);
          } else {
            console.log(`${this.students[i].courses[course].name}: ${this.students[i].courses[course].grade}`);
          }
        }
      }
    }
  },

  courseReport(courseName) {
    const courseGrades = [];

    console.log(`= ${courseName} Grades =`);

    for (let student = 0; student < this.students.length; student += 1) {
      for (let course = 0; course < this.students[student].courses.length; course += 1) {
        if (this.students[student].courses[course].name === courseName
        && this.students[student].courses[course].grade !== undefined) {
          const courseGrade = this.students[student].courses[course].grade;
          courseGrades.push(courseGrade);

          console.log(`${this.students[student].name}: ${courseGrade}`)
        }
      }
    }

    const courseAvg = courseGrades.reduce((a, b) => a + b, 0) / courseGrades.length;

    console.log('---');
    console.log(`Course Average: ${parseInt(courseAvg, 10)}`);
  },
};

school.addStudent('foo', '3rd');
school.enrollStudent('foo', { name: 'Math', code: 101 });
school.enrollStudent('foo', { name: 'Advanced Math', code: 102 });
school.enrollStudent('foo', { name: 'Physics', code: 202 });
school.addGrade('foo', 'Math', 95);
school.addGrade('foo', 'Advanced Math', 90);
// school.getReportCard('foo');

school.addStudent('bar', '1st');
school.enrollStudent('bar', { name: 'Math', code: 101 });
school.addGrade('bar', 'Math', 91);
// school.getReportCard('bar');

school.addStudent('qux', '2nd');
school.enrollStudent('qux', { name: 'Math', code: 101 });
school.enrollStudent('qux', { name: 'Advanced Math', code: 102 });
school.addGrade('qux', 'Math', 93);
school.addGrade('qux', 'Advanced Math', 90);
// school.getReportCard('qux');

school.courseReport('Math');
school.courseReport('Advanced Math');


// getReportCard output
// > school.getReportCard(foo);
// = Math: 95
// = Advanced Math: 90
// = Physics: In progress
// courseReport output
// > school.courseReport('Math');
// = =Math Grades=
// = foo: 95
// = bar: 91
// = qux: 93
// = ---
// = Course Average: 93

// > school.courseReport('Advanced Math');
// = =Advanced Math Grades=
// = foo: 90
// = qux: 90
// = ---
// = Course Average: 90

// > school.courseReport('Physics');
// = undefined