<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | Calendar</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../plugins/fontawesome-free/css/all.min.css">
  <!-- fullCalendar -->
  <link rel="stylesheet" href="../plugins/fullcalendar/main.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../dist/css/adminlte.min.css">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <style>
    .card-title{
      margin: 0;
    }

    /* Style the container to position the icons on top of each other */
.color-item {
  position: relative;
  display: inline-block;
  cursor: pointer;
}

.color-item .fa-square {
  font-size: 30px; /* Size of the square */
}

.color-item .fa-check {
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%); /* Center the check icon */
  font-size: 20px; /* Size of the check */
  color: white; /* Color of the check */
  display: none; /* Initially hide the check icon */
}

.color-item.checked .fa-check {
  display: block; /* Show the check icon when the item is checked */
}


  </style>
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- Navbar -->
  <jsp:include page="header.jsp" />
  <!-- /.navbar -->

  <!-- Sidebar -->
  <jsp:include page="sidebar.jsp" />
  
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <div class="col-sm-6">
            <h1>Calendar</h1>
          </div>
          <div class="col-sm-6">
            <ol class="breadcrumb float-sm-right">
              <li class="breadcrumb-item"><a href="#">Home</a></li>
              <li class="breadcrumb-item active">Calendar</li>
            </ol>
          </div>
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-md-3">
            <div class="sticky-top mb-3">
              <div class="card">
                <div class="card-header">
                  <h4 class="card-title">My Events</h4>
                </div>
                <div class="card-body">
                  <!-- the events -->
                  <div id="group-list">
                    
                  </div>
                </div>
                <!-- /.card-body -->
              </div>
              <!-- /.card -->
              <div class="card">
                <div class="card-header">
                  <h3 class="card-title">Create Event</h3>
                </div>
                <div class="card-body">
                  <div class="btn-group" style="width: 100%; margin-bottom: 10px;">
                    <ul class="fc-color-picker" id="color-chooser">
                    
                    </ul>
                  </div>
                  <!-- /btn-group -->
                  <input type="hidden" id="eventId">
                  <input type="hidden" id="teamId">
                  <div class="form-group">
                    <label>Event Title</label>
                    <input type="text" class="form-control" placeholder="Enter Event Title" id="new-event" >
                  </div>
                  <div class="form-group">
                    <label>Description</label>
                    <textarea class="form-control" rows="3" placeholder="Enter Description"></textarea>
                  </div>

                  <div class="form-group">
                    <label>Starts At</label>
                    <input type="text" class="form-control datetimepicker" placeholder="Enter Starts At" id="startsAt">
                  </div>
                  <div class="form-group">
                    <label>Ends At</label>
                    <input type="text" class="form-control datetimepicker " placeholder="Enter Ends At" id="endsAt">
                  </div>
                </div>
                <div class="card-footer">
                  <button type="button"  id="add-new-event" class="btn btn-primary">Submit</button>
                </div>
              </div>
            </div>
          </div>
          <!-- /.col -->
          <div class="col-md-9">
            <div class="card card-primary">
              <div class="card-body p-0">
                <!-- THE CALENDAR -->
                <div id="calendar"></div>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div><!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <footer class="main-footer">
    <div class="float-right d-none d-sm-block">
      <b>Version</b> 3.2.0
    </div>
    <strong>Copyright &copy; 2014-2021 <a href="https://adminlte.io">AdminLTE.io</a>.</strong> All rights reserved.
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- Modal Structure -->
<div class="modal fade" id="eventModal" tabindex="-1" aria-labelledby="eventModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="eventModalLabel">Edit Event</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="card-body">
          <div class="btn-group" style="width: 100%; margin-bottom: 10px;">
            <ul class="fc-color-picker" id="md-color-chooser">
              
            </ul>
          </div>

          <input type="hidden" id="md-eventId">
          <input type="hidden" id="md-teamId">

          <div class="form-group">
            <label for="new-event">Event Title</label>
            <input type="text" class="form-control" placeholder="Enter Event Title" id="md-title">
          </div>

          <div class="form-group">
            <label for="event-description">Description</label>
            <textarea class="form-control" rows="3" placeholder="Enter Description" id="md-event-description"></textarea>
          </div>

          <div class="form-group">
            <label for="start-date">Starts At</label>
            <input type="text" class="form-control datetimepicker" placeholder="Enter Starts At" id="md-start-date">
          </div>

          <div class="form-group">
            <label for="end-date">Ends At</label>
            <input type="text" class="form-control datetimepicker" placeholder="Enter Ends At" id="md-end-date">
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-danger" id="delete-event-btn">Delete</button>
        <button type="button" class="btn btn-primary" id="save-event-btn">Save</button>
      </div>
    </div>
  </div>
</div>


<!-- jQuery -->
<script src="../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap -->
<script src="../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- jQuery UI -->
<script src="../plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- AdminLTE App -->
<script src="../dist/js/adminlte.min.js"></script>
<!-- fullCalendar 2.2.5 -->
<script src="../plugins/moment/moment.min.js"></script>
<script src="../plugins/fullcalendar/main.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../dist/js/demo.js"></script>
<!-- Bootstrap JS (with Popper.js) -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet"
href=
"https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.min.css" />

<!-- datetimepicker jQuery CDN -->
<script src=
"https://cdnjs.cloudflare.com/ajax/libs/jquery-datetimepicker/2.5.20/jquery.datetimepicker.full.min.js">
</script>


<!-- Page specific script -->
<script>



$(function () {
const colorHexCodes = [
    "#3498db",  // Bright Blue
    "#2ecc71",  // Emerald Green
    "#e74c3c",  // Red
    "#f39c12",  // Orange
    "#9b59b6",  // Purple
    "#16a085",  // Teal
    "#f1c40f",  // Yellow
    "#34495e",  // Dark Slate Gray
    "#1abc9c",  // Light Teal
    "#2c3e50",  // Dark Blue
    "#7f8c8d",  // Gray
    "#c0392b",  // Dark Red
    "#95a5a6",  // Light Gray
    "#2980b9",  // Blue
    "#d35400",  // Pumpkin Orange
    "#8e44ad",  // Violet
    "#34495e"   // Charcoal Blue
];

var teamData = $('#user-teams').val();
var teams = JSON.parse(teamData);
 // Initialize a counter variable
 var counter = 0;
// Loop through the JSON data and create the external-event divs
$.each(teams, function(teamId, teamName) {
  // Create a new external-event div
  var $eventDiv = $('<div class="external-event"></div>');
  // Set the text of the event
  $eventDiv.text(teamName);
  // Apply a background color from the colorHexCodes array based on the counter
  if (colorHexCodes[counter]) {
    $eventDiv.css('background-color', colorHexCodes[counter]);
  }
  // Append the new div to the group-list container
  $('#group-list').append($eventDiv);

  var $li = $('<li></li>');

// Create an <a> tag inside the <li>
var $a = $('<a href="#" class="color-item"></a>');
// Set the background color of the <i> element based on the counter
  if (colorHexCodes[counter]) {
  $a.css('color', colorHexCodes[counter]);
}
$a.attr('data-team-id', teamId); 
// Create the <i> element that will display the color
var $i = $('<i class="fas fa-square"></i><i class="fas fa-check"></i>');

// Set the tooltip text (you can customize this text)
$a.attr('data-toggle', 'tooltip').attr('title', teamName);  // Tooltip text
$a.append($i);
$li.append($a);
$('#color-chooser').append($li);
$('#md-color-chooser').append($li.clone());
$('[data-toggle="tooltip"]').tooltip();
  counter++;
});
$('.color-item').click(function() {
    $('.color-item').removeClass('checked');
    $(this).addClass('checked');
});


var calendarEl = document.getElementById('calendar');
var calendar = new FullCalendar.Calendar(calendarEl, {
    headerToolbar: {
        left  : 'prev,next today',
        center: 'title',
        right : 'dayGridMonth,timeGridWeek,timeGridDay'
    },
    themeSystem: 'bootstrap',
    events: [],  // No events initially loaded
    eventClick: function(e, jsEvent, view) {
      openEditEventModal(e.event.id)
    },
    editable  : false,
    droppable : false, // Don't allow drag and drop for now
    eventDidMount: function(info) {
      var event = info.event;
      var element = info.el;  // The DOM element of the event
      $(element).data('event-id', event.id);
    }
});
// Render the calendar
calendar.render();
function rgbToHex(rgb) {
    // Extract the red, green, and blue components from the rgb string
    var rgbArray = rgb.match(/\d+/g);

    // Convert each component to a hexadecimal string and return the result
    var hex = "#" +
        ("0" + parseInt(rgbArray[0]).toString(16)).slice(-2) + // Red
        ("0" + parseInt(rgbArray[1]).toString(16)).slice(-2) + // Green
        ("0" + parseInt(rgbArray[2]).toString(16)).slice(-2);   // Blue

    return hex;
}
// Function to load events (via AJAX)
function loadEvents() {
    $.ajax({
        url: '/api/event/calendar',  // Replace with your actual URL to fetch events
        dataType: 'json',
        async:false,
        success: function(data) {
            // Convert server response into event format for FullCalendar
            var events = data.map(function(event) {
                
                // Fetch the color associated with the team ID
                var color = $('a.color-item[data-team-id="' + event.team.id + '"]').css('color');
                color = rgbToHex(color);
                
                // Return the event in FullCalendar's expected format
                return {
                    id: event.id,
                    title: event.title,
                    start: new Date(event.startAt),  // Use startAt for the event's start time
                    end: new Date(event.endAt),      // Use endAt for the event's end time
                    description: event.description,
                    createdBy: event.createdBy,  // Add createdBy info (or other fields as needed)
                    backgroundColor: color,  // Use color for the background
                    borderColor: color,      // Use color for the border
                    textColor: '#fff',        // White text for better contrast
                    classNames:["eventId_"+event.id]
                };
            });
            
            // Clear current events and add new ones
            calendar.removeAllEvents();  // Remove any existing events
            calendar.addEventSource(events);  // Add the new events to the calendar

            // Manually ensure that event colors are applied after FullCalendar renders them
            calendar.render();  // Render the calendar to apply the changes

            // Optionally, apply styles manually after render (useful if FullCalendar is overriding them)
            $('#calendar').find('.fc-event').each(function() {
                var event = $(this);
                var dotColor = $(this).find('.fc-daygrid-event-dot').css('border-color');
                // Apply the background color to the event element
                $(this).css('background-color', dotColor);
            });
        }
    });
}


// Call loadEvents initially to load events when the page loads
loadEvents();

/* ADDING EVENTS */
var currColor = '#3c8dbc'; // Red by default
// Color chooser button
$('#color-chooser > li > a').click(function (e) {
    e.preventDefault();
    $(this).addClass("checked");
    // Save the selected color
    currColor = $(this).css('color');
    // Add color effect to button
    $('#add-new-event').css({
        'background-color': currColor,
        'border-color'    : currColor
    });
    $('#teamId').val($(this).data('team-id'));
});
$('.color-item').click(function() {
    // Remove the "checked" class from all items
    $('.color-item').removeClass('checked');
    
    // Add the "checked" class to the clicked item
    $(this).addClass('checked');
  });
$(".datetimepicker").each(function () {
    $(this).datetimepicker();
});
  // Example of how to call the function when you need to retrieve the form values
  $('#add-new-event').on('click', function() {
    if ($('.checked').length == 0) {
      $(document).Toasts('create', {
        class: 'bg-danger',
        title: 'Attention!',
        body: 'Click on the Team for which event is being created',
        autohide: true,
        delay: 1500
      });
      return false;
    }
    var formValues = getFormValues();
    
    $.ajax({
                url: "/api/event/save", // Use the form's action URL
                type: "POST",
                data: formValues,  // convertToJson should serialize your form data appropriately
                dataType: 'json',
                contentType: 'application/json',
                headers: {
                    "Content-Type": "application/json"
                },
                success: function(response) {
                    // Optionally, close the modal and reset the form on success
                    $(document).Toasts('create', {
                        class: 'bg-success',
                        title: 'Success',
                        body: 'New Event created successfully',
                        autohide: true,
                        delay: 1500
                    });
                    loadEvents(); 
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error("Error submitting form:", textStatus, errorThrown);
                    $(document).Toasts('create', {
                    class: 'bg-danger',
                    title: 'Oops!',
                    body: 'Something went wrong, try again!',
                    autohide: true,
                    delay: 1500
                  });
                }
            });
  });


// Save the event (either create or update)
$('#save-event-btn').click(function() {
  $('#md-teamId').val($('#md-color-chooser > li > a.checked').data("team-id"));
    // Create an object to store form values
    var formData = {};
    formData.id = Number($('#md-eventId').val()); 
    formData.team = {};
    formData.team.id = Number($('#md-teamId').val());
    formData.title = $('#md-title').val();
    formData.description = $('#md-event-description').val();
    formData.startAt = convertToCorrectFormat($('#md-start-date').val()); 
    formData.endAt = convertToCorrectFormat($('#md-start-date').val());
    formData.createdBy = {};
    formData.createdBy.id = Number($('#userId').val());
    var eventData = JSON.stringify(formData);

    // Perform AJAX request to save the event (create or update)
    $.ajax({
      url: "/api/event/save", // Use the form's action URL
                type: "POST",
                data: eventData,  // convertToJson should serialize your form data appropriately
                dataType: 'json',
                contentType: 'application/json',
                headers: {
                    "Content-Type": "application/json"
                },
        success: function(response) {
                    loadEvents(); 
            $('#eventModal').modal('hide');
            $(document).Toasts('create', {
                        class: 'bg-success',
                        title: 'Success',
                        body: 'New Event created successfully',
                        autohide: true,
                        delay: 1500
                    });
        },
        error: function(error) {
            console.error('Error saving event:', error);
            $(document).Toasts('create', {
                    class: 'bg-danger',
                    title: 'Oops!',
                    body: 'Something went wrong, try again!',
                    autohide: true,
                    delay: 1500
            });
        }
    });
});

// Delete the event
$('#delete-event-btn').click(function() {
    var eventId = $('#eventId').val();

    // Perform AJAX request to delete the event
    $.ajax({
        url: '/api/event/delete/' + eventId,  // Adjust URL for delete API
        method: 'DELETE',
        success: function(response) {
            console.log('Event deleted successfully');
            $('#eventModal').modal('hide');
            // Optionally, refresh the event list
        },
        error: function(error) {
            console.error('Error deleting event:', error);
        }
    });
});


});
  // Function to read all form values
  function getFormValues() {
    // Create an object to store form values
    var formData = {};
    if ( $('#eventId').val() != "") {
      formData.id = $('#eventId').val(); 
    }
    // Get the value of the hidden field #teamId
    formData.team = {};
    formData.team.id = $('#teamId').val();

    // Get the value of the event title
    formData.title = $('#new-event').val();

    // Get the value of the event description
    formData.description = $('textarea').val();
    const outputDate = 
    // Get the values of the datetimepicker inputs
    formData.startAt = convertToCorrectFormat($('#startsAt').val()); 
    formData.endAt = convertToCorrectFormat($('#endsAt').val());
    formData.createdBy = {};
    formData.createdBy.id = $('#userId').val();
    return JSON.stringify(formData);;
  }

  function convertToCorrectFormat(inputDateStr) {
    const dateParts = inputDateStr.split(' ');
    const dateArray = dateParts[0].split('/');
    const timeArray = dateParts[1].split(':');

    // JavaScript Date format uses MM/DD/YYYY
    const formattedDate = new Date(
        dateArray[0],  // Year
        dateArray[1]-1,  // Month (zero-based, so no need to subtract 1)
        dateArray[2],  // Day
       
        timeArray[0],  // Hour
        timeArray[1],  // Minute
        0  // Second
    );

    // Return the date in ISO 8601 format (e.g., "2025-03-01T11:00:00.000Z")
    return formattedDate.toISOString();
}

function openEditEventModal(eventId) {
    // Set modal fields with event data
    $.ajax({
        url: "/api/event/" + eventId,
        type: 'GET',
        dataType: 'json',
        success: function(eventData) {
          console.log(eventData);
          // Populate modal fields with the retrieved organization data
          $('#modal-header').text(eventData.title);
          $('#md-eventId').val(eventData.id);
          $('#md-color-chooser').find('[data-team-id="' + eventData.team.id + '"]').click();
          $('#md-teamId').val(eventData.teamId);
          $('#md-title').val(eventData.title);
          $('#md-event-description').val(eventData.description);
          $('#md-start-date').val(formatDateTime(eventData.startAt));
          $('#md-end-date').val(formatDateTime(eventData.endAt));
          $('#eventModal').modal('show');
        }
      });
}

function formatDateTime(dateStr) {
    const date = new Date(dateStr);
    if (isNaN(date)) {
      // If the date is invalid
      return 'Invalid Date';
    }
    const year = date.getUTCFullYear();
    const month = String(date.getUTCMonth() + 1).padStart(2, '0'); // 0-indexed, so add 1
    const day = String(date.getUTCDate()).padStart(2, '0');
    const hours = String(date.getUTCHours()).padStart(2, '0');
    const minutes = String(date.getUTCMinutes()).padStart(2, '0');
    var str = year+"/"+month+"/"+day+" "+hours+":"+minutes;
    return str;
}

</script>
</body>
</html>
