const sectionElement = document.querySelector('section');

const makeBold = (element, customFunc) => {
  element.style.fontWeight = 'bold';
  if (customFunc && typeof customFunc === 'function') customFunc(element);
};

makeBold(sectionElement, function(elem) {
  elem.classList.add('highlight');
});

const customMakeBold = (element) => {
  element.style.fontWeight = 'bold';
  const event = new CustomEvent('bolded');

  element.dispatchEvent(event)
}

sectionElement.addEventListener('bolded', (event) => {
  alert('Bolded!')
  event.target.classList.add('highlight');
})

customMakeBold(sectionElement);