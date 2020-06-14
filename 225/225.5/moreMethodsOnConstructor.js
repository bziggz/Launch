function newPerson(name) {
  return Object.defineProperties({ name: name}, {
    log: {
      value: function() {
        console.log(this.name);
      },

      writable: false,
    },
  });
}

var me = newPerson('Shane Riley');
me.log();     // => Shane Riley
me.log = function() { console.log('Amanda Rose'); };
me.log();     // => Shane Riley