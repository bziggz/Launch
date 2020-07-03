const divRed = document.querySelector('#red');
const divBlue = document.querySelector('#blue');
const divOrange = document.querySelector('#orange');
const divGreen = document.querySelector('#green');

const tracker = (() => {
  const list = [];

  return {
    list() {
      return [...list];
    },

    elements() {
      return this.list().map(({target}) => target);
    },

    add(event) {
      list.push(event);
    },

    clear() {
      list.length = 0;
      return list.length;
    },
  };
})();

function track(callback) {
  return event => {
    tracker.add(event);

    callback(event);
  };
}

divRed.addEventListener('click', track(event => {
  document.body.style.background = 'red';
}));

divBlue.addEventListener('click', track(event => {
  event.stopPropagation();
  document.body.style.background = 'blue';
}));

divOrange.addEventListener('click', track(event => {
  document.body.style.background = 'orange';
}));

divGreen.addEventListener('click', track(event => {
  document.body.style.background = 'green';
}));

console.log(tracker.list().length);
// = 4
console.log(tracker.elements());
// = [div#blue, div#red, div#orange, div#green]
console.log(tracker.elements()[0] === document.querySelector('#blue'));
// = true
console.log(tracker.elements()[3] === document.querySelector('#green'));
// = true
console.log(tracker.clear());
// = 0
console.log(tracker.list());
// = []
tracker.list()[0] = 'abc';
console.log(tracker.list().length);
// = 0
