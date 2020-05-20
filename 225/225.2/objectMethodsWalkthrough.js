const me = {
  id: 1,
  firstName: 'Philip',
  lastName: 'Fry',
};

const her = {};
her.id = 2;
her.firstName = 'Leela';
her.lastName = 'Fry';

function fullName(person) {
  console.log(person.firstName + ' ' + person.lastName);
}

const robot = {
  id: 3,
  firstName: 'Bender',
  lastName: 'Rodriguez',
};

const professor = {
  id: 4,
  firstName: 'Hubert',
  lastName: 'Farnsworth',
};

const assistant = {};
assistant.id = 5;
assistant.firstName = 'Amy';
assistant.lastName = 'Wong';


const planetExpress = {
  nextID: 6,

  collection: [me, her, robot, professor, assistant],

  fullName: function(person) {
    console.log(person.firstName + ' ' + person.lastName)
  },

  rollCall: function() {
    this.collection.forEach(this.fullName);
  },

  add: function(person) {
    if (this.isInvalidPerson(person)) return;

    person.id = this.nextID;
    this.nextID += 1;

    this.collection.push(person);
  },

  getIndex: function(person) {
    let index = -1;

    this.collection.forEach((comparator, i) => {
      if (comparator.firstName === person.firstName
        && comparator.lastName === person.lastName) {
        index = i;
      }
    });

    return index;
  },

  remove: function(person) {
    if (this.isInvalidPerson(person)) return;

    const index = this.getIndex(person);
    if (index === -1 ) return;

    this.collection.splice(index, 1);
  },

  isInvalidPerson: function(person) {
    return typeof person.firstName !== 'string'
      || typeof person.lastName !== 'string';
  },

  get: function(person) {
    if (this.isInvalidPerson(person)) return;

    return this.collection[this.getIndex(person)];
  },

  update: function(person) {
    if (this.isInvalidPerson(person)) return;

    let existingID = this.getIndex(person);

    if (existingID === -1) {
      this.add(person);
    } else {
      this.collection[existingID] = person;
    }
  }
}

console.log(planetExpress.nextID);
planetExpress.rollCall();
planetExpress.add({ firstName: 'John', lastName: 'Zoidberg' });
console.log(planetExpress.nextID)
planetExpress.rollCall();
