document.querySelector('html').addEventListener('click', () => {
  const element = document.querySelector('#container');

  if (!element.contains(event.target)) {
    document.querySelector('#container').style = 'display: none';
  }
});

