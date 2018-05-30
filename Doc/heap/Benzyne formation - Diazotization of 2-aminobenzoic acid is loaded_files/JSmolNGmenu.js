/// Jonathan Gutow's code to create applet size changer popup

function jmol_pulldown(theform) {
    /*
    This is called when the user selects a menu item.  This just
    evaluates the corresponding value, which results in running some
    javascript code to do the action.
    */
    with(theform) {
        eval(options[selectedIndex].value);
        }
    }
	
/// Angel Herraez's code to create unicode special characters
	function labelDot() {
  return 'label "\u2022\";';
}
function labelDotUpArrow() {
  return 'label "\u2022\u2191\";';
}
function labelDotDownArrow() {
  return 'label "\u2022\u2193\";';
}



