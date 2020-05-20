const createStudent = (name, year) =>(
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

foo = createStudent('Foo', '1st');
foo.info();
// Foo is a 1st year student
foo.listCourses();
// [];
foo.addCourse({ name: 'Math', code: 101 });
foo.addCourse({ name: 'Advanced Math', code: 102 });
foo.listCourses();
// [{ name: 'Math', code: 101 }, { name: 'Advanced Math', code: 102 }]
foo.addNote(101, 'Fun course');
foo.addNote(101, 'Remember to study for algebra');
foo.viewNotes();
// Math: Fun Course; Remember to study for algebra
foo.addNote(102, 'Difficult subject');
foo.viewNotes();
// Math: Fun Course; Remember to study for algebra
// Advanced Math: Difficult Subject
foo.updateNote(101, 'Fun course');
foo.viewNotes();
// Math: Fun Course
// Advance Math: Difficult Subject