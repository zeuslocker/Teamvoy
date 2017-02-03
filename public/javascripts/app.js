
$(document).ready(function(){
var copyTextareaBtn = document.getElementById('js-copybtn');
copyTextareaBtn.addEventListener('click', function(event) {
  copyTextToClipboard('Jane');
});
});
