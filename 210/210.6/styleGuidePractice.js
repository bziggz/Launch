// 1 --------------------------------------

var title = "The Three-Body Problem";

// Should Be

var title = 'The Three-Body Problem';

// 2 -----------------------------------------

var title = 'The Three-Body Problem',
    author = 'Cixin Liu',
    page_count = 400;

// Shoud Be

var title = 'The Three-Body Problem';
var author = 'Cixin Liu';
var pageCount = 400;

// 3 ----------------------------------------

var completed = lastPageRead == 400;

// Should Be

var completed = lastPageRead === 400;

// 4 ----------------------------------------

if (finishedBook())
  console.log('You have finished reading this book');

// Should Be

if (finishedBook()) console.log('You have finished reading this book');

// or

if (finishedBook()) {
  console.log('You have finished reading this book');
}

// 5 --------------------------------------------

function read(pages) {
      console.log('You started reading.');
      for (var i=0; i<pages; i++) {
              var message = 'You read page '+i;
              console.log(message);
      }
}

read(400);

// Should Be

function read(pages) {
  var i;
  var message;

  console.log('You started reading.');
  for (i = 0; i < pages; i += 1) {
    message = 'You read page ' + String(i);
    console.log(message);
  }
}

read(400);
