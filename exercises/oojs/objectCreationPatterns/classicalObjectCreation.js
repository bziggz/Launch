const Person = function (firstName, lastName, age, gender) {
  this.firstName = firstName;
  this.lastName = lastName;
  this.age = age;
  this.gender = gender;
};

Person.prototype.eat = function () {
  console.log('Eating');
};

Person.prototype.communicate = function () {
  console.log('Communicating');
};

Person.prototype.sleep = function () {
  console.log('Sleeping');
};

Person.prototype.fullName = function () {
  return `${this.firstName} ${this.lastName}`;
};

const Doctor = function (firstName, lastName, age, gender, specialization) {
  Person.call(this, firstName, lastName, age, gender);

  this.specialization = specialization;
};

Doctor.prototype = Object.create(Person.prototype);

Doctor.prototype.constructor = Doctor;

Doctor.prototype.diagnose = function () {
  console.log('Diagnosing');
};

const Professor = function (firstName, lastName, age, gender, subject) {
  Person.call(this, firstName, lastName, age, gender);

  this.subject = subject;
};

Professor.prototype = Object.create(Person.prototype);

Professor.prototype.constructor = Professor;

Professor.prototype.teach = function () {
  console.log('Teaching');
};

const Student = function (firstName, lastName, age, gender, degree) {
  Person.call(this, firstName, lastName, age, gender);

  this.degree = degree;
};

Student.prototype = Object.create(Person.prototype);

Student.prototype.constructor = Student;

Student.prototype.study = function () {
  console.log('Studying');
};

const GraduateStudent = function (firstName, lastName, age, gender, graduateDegree) {
  Person.call(this, firstName, lastName, age, gender);

  this.graduateDegree = graduateDegree;
};

GraduateStudent.prototype = Object.create(Student.prototype);

GraduateStudent.prototype.constructor = GraduateStudent;

GraduateStudent.prototype.research = function () {
  console.log('Researching');
};

var person = new Person('foo', 'bar', 21, 'gender');
console.log(person instanceof Person);     // logs true
person.eat();                              // logs 'Eating'
person.communicate();                      // logs 'Communicating'
person.sleep();                            // logs 'Sleeping'
console.log(person.fullName());            // logs 'foo bar'

var doctor = new Doctor('foo', 'bar', 21, 'gender', 'Pediatrics');
console.log(doctor instanceof Person);     // logs true
console.log(doctor instanceof Doctor);     // logs true
doctor.eat();                              // logs 'Eating'
doctor.communicate();                      // logs 'Communicating'
doctor.sleep();                            // logs 'Sleeping'
console.log(doctor.fullName());            // logs 'foo bar'
doctor.diagnose();                         // logs 'Diagnosing'

var graduateStudent = new GraduateStudent('foo', 'bar', 21, 'gender', 'BS Industrial Engineering', 'MS Industrial Engineering');
// logs true for next three statements
console.log(graduateStudent instanceof Person);
console.log(graduateStudent instanceof Student); 
console.log(graduateStudent instanceof GraduateStudent);
graduateStudent.eat();                     // logs 'Eating'
graduateStudent.communicate();             // logs 'Communicating'
graduateStudent.sleep();                   // logs 'Sleeping'
console.log(graduateStudent.fullName());   // logs 'foo bar'
graduateStudent.study();                   // logs 'Studying'
graduateStudent.research();                // logs 'Researching'