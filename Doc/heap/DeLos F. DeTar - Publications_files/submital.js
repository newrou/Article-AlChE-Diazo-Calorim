/**
* submital.js
*
* Contains front-end X back-end communication functionality for
** Adding/Editting a person
** Adding/Editting a connection
** Crosslisting a person
** Adding a majorarea
** Rollingback a person/connection
*
* Created July 8th, 2015 by Will Chertoff
* 
*/



var App={};
App.connection={};
App.person={};
App.returned={};
App.deleter={};
App.crosslist={};
App.publication={};
App.signup={};

$.fn.serializeObject = function()
{
    var o = {};
    var a = this.serializeArray();
    $.each(a, function() {
        if (o[this.name] !== undefined) {
            if (!o[this.name].push) {
                o[this.name] = [o[this.name]];
            }
            o[this.name].push(this.value || '');
        } else {
            o[this.name] = this.value || '';
        }
    });
    return o;
};




// Generic ajax submital functionality
function runAjax(data) {

  $body=$('body');
  // Add css loading screen during ajax call
  $body.addClass("loading");

  // Set up base data

   if (typeof data.url === 'undefined') { data.url = 'include/add_edit.php'; } else {
  }



  /* Send the data using post */
  dataJSON = $.param(data);
  request = $.ajax({
    url: data.url,
    type: "post",
    data: dataJSON
  });

  // Callback handler that will be called on success
  request.done(function (response, textStatus, jqXHR){

    // Remove css loading screen
    $body.removeClass("loading");

    App.returned=JSON.parse(response);
    if (! App.returned.errormsg) { // check for error 
      if (App.returned.callback) {
        callbackHandler();
      }
      else if (App.returned.path) {
        $('.modal').hide();
        // if path is set, redirect to url=obj.path
        document.location.href=App.returned.path;
      } else {
        $('.modal').hide();
        // reload current location 
        location.reload();
      }
    }  else {
      // obj.errormsg exists, send obj to error handler 
      errorHandler(App.returned);
    }

  });

  // Callback handler that will be called on failure
  request.fail(function (jqXHR, textStatus, errorThrown){
  // Log the error to the console
  console.error(
    "The following error occurred: "+
    textStatus, errorThrown
    );
  });



  // Callback handler that will be called regardless if the request failed or succeeded
  request.always(function () {
  });

} // end runAjax

function errorHandler(data) {
  console.log(data);
  $('.response').html("");
  $('.response').append("<div class=\"alert alert-danger alert-dismissible fade in\" role=\"alert\">"+data.errormsg+"</div>");
  $('.response').show();

  if (data.possible_matches) { // possible matches to person entered on edit_person.php
    for (index = 0; index < data.possible_matches.length; ++index) {
        console.log(''+data.possible_matches[index]+'');
      $('.alert').append(data.possible_matches[index]);
	}
  }

  if (data.action) {
    $('.alert').append(data.action);
  }
  $('html, body').animate({
    scrollTop: $(".response").offset().top-20
  }, 2);
} // end errorHandler 

// LISTENERS //////////////////////////////////////////

$('#formsubmit').click(function(event){ // gather data submitted from people_edit.php form
  event.preventDefault();
  var form = $(this).parent().parent();
  App.person = form.serializeObject();
  if (App.person.pid >0) {
    addPerson();
  } else {
    delete App.person.action;
    validatePerson();
    $('html, body').scrollTop(0);
  }
})

$(".execute_edit").click(function(event) { // listen for edit/add connection click

console.log('running execute_edit')
  event.preventDefault();
  var $form = $(this).parent().parent();
  var $inputs = $form.find("input, select, textarea");
  App.connection = $($inputs).serializeObject();
  validateConnection();

});

// END LISTENERS ////////////////////////////////////////

function validatePerson() {

  App.person.call = 'validate_person';
  console.log(App.person);
  runAjax(App.person);
  
}

function validateConnection() {

  App.connection.call = 'validate_connection';
  console.log(App.connection);
  runAjax(App.connection);
  
}

function connectionCallback(pidconn,newperson,event) {


  event = event || window.event;
  event.preventDefault();
  
if (newperson==1) {
    var name = App.connection.name.split(" ");
    if (name.length >2) {
      App.person.firstname=name[0];
      App.person.middlename=name[1];
      App.person.lastname=name[2];
    } else {
      App.person.firstname=name[0];
      App.person.middlename='';
      App.person.lastname=name[1];
    }
    if (App.connection.basepid=="pid2") {
       App.person.startdate='';
       App.person.stopdate='';
    } else {
       App.person.startdate=App.connection.startdate;
       App.person.stopdate=App.connection.stopdate;
    }
    App.person.location=App.connection.location;
    App.person.locid=App.connection.locid;
    App.person.department=App.connection.department;
    App.person.call="add_person_add_connection";

    runAjax(App.person);
} else {
    App.connection.pidconn=pidconn;
    addConnection();
  }
}

function addConnection() {
  
  App.connection.call="add_connection";
  runAjax(App.connection);
}

function addPerson() {  

  App.person.call="add_person";
  runAjax(App.person);

}

function editName() {
  var name = App.connection.name.split(" ");
  if (name.length >2) {
    App.person.firstname=name[0];
    App.person.middlename=name[1];
    App.person.lastname=name[2];
  } else {
    App.person.firstname=name[0];
    App.person.middlename='';
    App.person.lastname=name[1];
  }

  App.person.pid=App.connection.pidconn;
  App.person.call="edit_name";
  runAjax(App.person);
}

function callbackHandler() {

  if (App.returned.callback = 'add_connection') {
    App.connection.pidconn=App.returned.pid;
    App.connection.call="add_connection";
    runAjax(App.connection);
  }
  
}

function rollbackPerson(pid,id) {
  // RollbackPerson rolls back a person to a given id 
    App.deleter.pid=pid;
    App.deleter.id=id
    App.deleter.call="rollback_person";
    runAjax(App.deleter);

}

function deletePerson(pid,event) {
  
  event = event || window.event;
  event.preventDefault();

  App.deleter.pid=pid;
  App.deleter.call="delete_person";

  runAjax(App.deleter);

}
function deleteConnection(id,event) {
  event = event || window.event;
  event.preventDefault();

  App.deleter.id=id;
  App.deleter.call="delete_connection";

  runAjax(App.deleter);
}

function rollbackConnection(id,event) {
  // RollbackConnection rolls back a connection to a given id 
  event = event || window.event;
  event.preventDefault();

  App.deleter.id=id;
  App.deleter.call="rollback_connection";

  runAjax(App.deleter);
}


function errorCallback() {
  var $inputs = $('body').find("input,button,textarea");
  $inputs.prop("disabled", false);
  $(".response").html("");
}

function addMajorArea(pid,area,path) {
  // addMajorArea add's a specific major area to pid
  App.crosslist.pid=pid;
  App.crosslist.majorarea=area;
  App.crosslist.call="add_major_area";
    if (typeof path === 'undefined') { path = false; } else {
      // path is used for url redirection callback
      App.crosslist.path=path;
    }
    runAjax(App.crosslist);
}

function deleteMajorArea(pid,area) {
  // addMajorArea deletes a specific major area from a pid
  App.crosslist.pid=pid;
  App.crosslist.majorarea=area;
  App.crosslist.call="delete_major_area";
  runAjax(App.crosslist);
}

function savePublication(event) {
  event = event || window.event;
  event.preventDefault();

  var form = $('#pub-form').find('input');
  App.publication=form.serializeObject();
  App.publication.url = 'include/publication_edit_ajax.php';
  runAjax(App.publication);

}

function removePublication(pid,pubid,event) {
  event = event || window.event;
  event.preventDefault();

  App.publication={pid: pid, pubid: pubid};
  App.publication.call='removePublication';
  App.publication.url = 'include/publication_edit_ajax.php';
  runAjax(App.publication);
}

function validateNewUser(event) {

  event = event || window.event;
  event.preventDefault();

  form = $('#sign-up-modal-container').find('input');
  App.signup = form.serializeObject();
  App.signup.url='include/signup_check.php'
  runAjax(App.signup);

}

function checkForName(event) {
  event = event || window.event;
  event.preventDefault();
  form = $('#name-exist').find('input');
  App.signup=[]; 
  App.signup = form.serializeObject();
App.signup.url='include/signup_check.php';
  runAjax(App.signup);
}

function addPersonRegistration(event) {

  event = event || window.event;
  event.preventDefault();

  form = $('#registration-new-person').find('input');
  App.signup = form.serializeObject();
  console.log(form);
  App.signup.url='include/signup_check.php';
  runAjax(App.signup);
}

function linkAccount(pid,event) {
  event = event || window.event;
  event.preventDefault();


  App.signup.pidtolink = pid;
  App.signup.url='include/signup_check.php';
  runAjax(App.signup);

}
