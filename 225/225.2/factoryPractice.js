//1 

var chile = {
  name: 'The Republic of Chile',
  continent: 'South America',
  getDescription: function() {
    return this.name + ' is located in ' + this.continent + '.';
  },
};

var canada = {
  name: 'Canada',
  continent: 'North America',
  getDescription: function() {
    return this.name + ' is located in ' + this.continent + '.';
  },
};

var southAfrica = {
  name: 'The Republic of South Africa',
  continent: 'Africa',
  getDescription: function() {
    return this.name + ' is located in ' + this.continent + '.';
  },
};

// getDescription() is repeated unnecessarily

// 2

const makeCountry = (name, continent, visited = false) => (
  {
    name,
    continent,
    visited,

    getDescription () {
      const visitStatement = this.visited === true 
        ? `I have visited ${this.name}.` : `I haven't visited ${this.name}.`;

      console.log(`${this.name} is located in ${this.continent}. ${visitStatement}`);
    },

    visitCountry () {
      this.visited = true;
    },
  }
);

const ghana = makeCountry('Ghana', 'Africa');

ghana.getDescription();
ghana.visitCountry();
ghana.getDescription();
