
 $(function() {

    $('.text_people').autocomplete({
        source: "include/check_people.php",
        minLength: 3,
        select: function(event, ui) {
            var test = $(this);
            var oldid = test[0].id;
            var newid = oldid.toString().replace("peoplesearch", "pidsearch");
            console.log(newid);
            var pid = ui.item.id;
            if(pid != '#') {
                document.getElementById(newid).value=pid;
            }
        },
 
        html: true, // optional (jquery.ui.autocomplete.html.js required)
 
      // optional (if other layers overlap autocomplete list)
        open: function(event, ui) {
            $(".ui-autocomplete").css("z-index", 99999);
        }
    });
 });

 $(function() {

    $('.text_people_main').autocomplete({
        source: "include/check_people.php",
        minLength: 3,
        select: function(event, ui) {
            var pid = ui.item.id;
            console.log(pid);
            if(pid != '#') {
                document.getElementById("pidconn").value=pid;
            }
        },
 
        html: true, // optional (jquery.ui.autocomplete.html.js required)
 
      // optional (if other layers overlap autocomplete list)
        open: function(event, ui) {
            $(".ui-autocomplete").css("z-index", 999999);
        }
    });
 });

  $(function() {

    $('.text_people_index').autocomplete({
        source: "neurotree/include/check_people.php",
        minLength: 3,
        select: function(event, ui) {
            var pid = ui.item.id;
            console.log(pid);
            if(pid != '#') {
                //document.getElementById("pid").value=pid;
                window.location.href="/neurotree/peoplelist.php?searchname="+encodeURI(ui.item.value)+"&searchalltrees=1";
            }
        },
 
        html: true, // optional (jquery.ui.autocomplete.html.js required)
 
      // optional (if other layers overlap autocomplete list)
        open: function(event, ui) {
            $(".ui-autocomplete").css("z-index", 1000);
        }
    });
 });
 $(function() {

    $('.text_people_top').autocomplete({
        source: "include/check_people.php",
        minLength: 3,
        select: function(event, ui) {
            var pid = ui.item.id;
            console.log(pid);
            if(pid != '#') {
                //document.getElementById("pidconn").value=pid;
                window.location.href="peoplelist.php?searchname="+encodeURI(ui.item.value)+"&searchalltrees=1";

            }
        },

        html: true, // optional (jquery.ui.autocomplete.html.js required)

      // optional (if other layers overlap autocomplete list)
        open: function(event, ui) {
            $(".ui-autocomplete").css("z-index", 1000);
        }
    });
 });


 $(function() {

    $('.text_people_distance1').autocomplete({
        source: "include/check_people.php",
        minLength: 3,
        select: function(event, ui) {
            var pid = ui.item.id;
            console.log(pid);
            if(pid != '#') {
                document.getElementById("pid1").value=pid;
            }
        },
 
        html: true, // optional (jquery.ui.autocomplete.html.js required)
 
      // optional (if other layers overlap autocomplete list)
        open: function(event, ui) {
            $(".ui-autocomplete").css("z-index", 1000);
        }
    });
 });
 $(function() {

    $('.text_people_distance2').autocomplete({
        source: "include/check_people.php",
        minLength: 3,
        select: function(event, ui) {
            var pid = ui.item.id;
            console.log(pid);
            if(pid != '#') {
                document.getElementById("pid2").value=pid;
            }
        },
 
        html: true, // optional (jquery.ui.autocomplete.html.js required)
 
      // optional (if other layers overlap autocomplete list)
        open: function(event, ui) {
            $(".ui-autocomplete").css("z-index", 1000);
        }
    });
 });

$(function() {
 
    $(".text_loc").autocomplete({
        source: "include/check_loc.php",
        minLength: 3,
        select: function(event, ui) {            
            var locid = ui.item.id;
            if(locid != '#') {
                document.getElementById("locid").value=locid;
                
            }
        },
 
        html: true, // optional (jquery.ui.autocomplete.html.js required)
 
        // optional (if other layers overlap autocomplete list)
        open: function(event, ui) {
            $(".ui-autocomplete").css("z-index", 99999);
        }
    });
});

$(function() {
 
    $(".text_loc_edit").autocomplete({
        source: "include/check_loc.php",
        minLength: 3,
        select: function(event, ui) {
            // var test = $(this).parent().parent().parent().parent().parent();
            // console.log(test);
            // var oldid = test.find('input[name="locid"]').val();
            // var newid = oldid.toString().replace("peoplesearch", "pidsearch");
            var test = $(this);
            var oldid = test[0].id;
            var newid = oldid.toString().replace("locsearch", "locid");
            console.log(newid);

            
            var locid = ui.item.id;
            if(locid != '#') {
                // console.log(locid);
                document.getElementById(newid).value=locid;
                
            }
        },
 
        html: true, // optional (jquery.ui.autocomplete.html.js required)
 
        // optional (if other layers overlap autocomplete list)
        open: function(event, ui) {
            $(".ui-autocomplete").css("z-index", 999999);
        }
    });
    //$("#text_loc").keyup(function() {
    //   document.getElementById('locid').innerHTML='No match yet';
    //});
 
});

$(function() {
 
    $(".text_loc_add").autocomplete({
        source: "include/check_loc.php",
        minLength: 3,
        select: function(event, ui) {
            // var test = $(this).parent().parent().parent().parent().parent();
            // console.log(test);
            // var oldid = test.find('input[name="locid"]').val();
            // var newid = oldid.toString().replace("peoplesearch", "pidsearch");
            var test = $(this);
            var oldid = test[0].id;
            var newid = oldid.toString().replace("locid", "locsearch");
            console.log(newid);

            
            // var locid = ui.item.id;
            // if(locid != '#') {
            //     // console.log(locid);
            //     document.getElementById(newid).value=locid;
                
            // }
        },
 
        html: true, // optional (jquery.ui.autocomplete.html.js required)
 
        // optional (if other layers overlap autocomplete list)
        open: function(event, ui) {
            $(".ui-autocomplete").css("z-index", 999999);
        }
    });
    //$("#text_loc").keyup(function() {
    //   document.getElementById('locid').innerHTML='No match yet';
    //});
 
});


$(document).ready(function() {
    var page = $( window ).width();
    if (page < 768) {
        $("nav").addClass("boxfloat");
    }
});



$( window ).resize(function() {
    var page = $( window ).width();
    if (page < 768) {
        $("nav").addClass("boxfloat");
    } else {
        $("nav").removeClass("boxfloat");
    }
});

