$(document).ready(function() {
$("#header-top label").overlabel();
});

<SCRIPT LANGUAGE=JavaScript>
intImage = 2;
function swapImage() {
switch (intImage) {
 case 1:
   IMG1.src = "/webguru/sites/all/themes/everhooddesign_webguru/img/check.png"
   intImage = 2
   return(false);
case 2:
   IMG1.src = "/webguru/sites/all/themes/everhooddesign_webguru/img/nocheck.png"
   intImage = 1
   return(false);
 }
}
</SCRIPT>