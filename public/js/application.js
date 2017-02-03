$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them
  var copyTextareaBtn = document.getElementById('js-copybtn');
  copyTextareaBtn.addEventListener('click', function(event) {
    copyTextToClipboard('Jane');
  });
  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
