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

const professional = {
  payTax: function () {
    console.log(`${this.fullName()} Paying Taxes.`);
  },

  invoice: function () {
    console.log(`${this.fullName()} Billing Customer.`)
  },
};

const delegate = (object, mixin, method, ...args) => (
  function () {
    return mixin[method].apply(object, args);
  }
);

const extend = (object, mixin) => {
  Object.keys(mixin).forEach((method) => {
    object[method] = delegate(object, mixin, method);
  });

  return object;
};

var doctor = extend(new Doctor('foo', 'bar', 21, 'gender', 'Pediatrics'), professional);
console.log(doctor instanceof Person);     // logs true
console.log(doctor instanceof Doctor);     // logs true
doctor.eat();                              // logs 'Eating'
doctor.communicate();                      // logs 'Communicating'
doctor.sleep();                            // logs 'Sleeping'
console.log(doctor.fullName());            // logs 'foo bar'S
doctor.diagnose();                         // logs 'Diagnosing'

var professor = extend(new Professor('foo', 'bar', 21, 'gender', 'Systems Engineering'), professional);
console.log(professor instanceof Person);     // logs true
console.log(professor instanceof Professor);  // logs true
professor.eat();                              // logs 'Eating'
professor.communicate();                      // logs 'Communicating'
professor.sleep();                            // logs 'Sleeping'
console.log(professor.fullName());            // logs 'foo bar'
professor.teach();                            // logs 'Teaching'

doctor.invoice();                          // logs 'foo bar is Billing customer'
doctor.payTax();                           // logs 'foo bar Paying taxes'

professional.invoice = function() {
  console.log(this.fullName() + ' is Asking customer to pay');
};

doctor.invoice();                          // logs 'foo bar is Asking customer to pay'
professor.invoice();                       // logs 'foo bar is Asking customer to pay'
professor.payTax();                        // logs 'foo bar Paying taxes'