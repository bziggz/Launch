const greetings = (name, job) => (
  `Hello, ${name.join(' ')}! `
  + `Nice to have a ${job.title} ${job.occupation} around!`
);

console.log(greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' }));