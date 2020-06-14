// 1

// Capitalizing the function name is the constructor indicator

// 2

// function Lizard() {
//   this.scamper = function() {
//     console.log("I'm scampering!");
//   };
// }

// var lizzy = Lizard();
// lizzy.scamper(); // ?

// will output Uncaught Type Error

// 3

function Lizard() {
  this.scamper = function() {
    console.log("I'm scampering!");
  };
}

var lizzy = new Lizard();
lizzy.scamper();