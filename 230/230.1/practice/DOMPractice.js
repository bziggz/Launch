// 1

const heading = document.querySelector('h1');
heading.classList.add('heading');

// 2

document.getElementById('list').setAttribute('class', 'bulleted');

// 3

document.querySelector('#toggle').onclick = function toggleHiddenLink(e) {
  e.preventDefault();

  const hiddenElement = document.querySelector('#notice');

  hiddenElement.getAttribute('class') === 'hidden'
    ? hiddenElement.setAttribute('class', 'visible')
    : hiddenElement.setAttribute('class', 'hidden');
};

// 4

document.querySelector('#notice').onclick = function toggleHiddenBanner(e) {
  e.preventDefault();

  e.currentTarget.setAttribute('class', 'hidden');
};

// 5

document.querySelector('#multiplication').textContent = `${13 * 9}`;

// 6

document.querySelector('body').id = 'styled';