function movePage() {
  var EventStatus = event.srcElement.tagName;
  if(EventStatus!='INPUT'&&EventStatus!='TEXTAREA') {

  if (event.keyCode=='96') location.href="index.html";
  if (event.keyCode=='49') location.href="book1.html";
  if (event.keyCode=='50') location.href="book2.html";
  if (event.keyCode=='51') location.href="book3.html";


  }
}
document.onkeypress=movePage;
