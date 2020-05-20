// const sedan = {
//   speed: 0,
//   rate: 8,

//   accelerate() {
//     this.speed += this.rate;
//   }
// };

// 1

const makeCar = (accelerationRate, brakingRate) => (
  {
    speed: 0,
    rate: rate,

    accelerate() {
      this.speed += this.accelerationRate;
    },

    brake() {
      let newSpeed = this.speed - this.brakingRate;
      
      this.speed = newSpeed >= 0 ? newSpeed : 0;
    },
  }
);

// 2

const hatchback = makeCar(9);
