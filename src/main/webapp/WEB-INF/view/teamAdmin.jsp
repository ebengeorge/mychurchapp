<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <!-- Metadata and responsive configuration -->
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title> Ministry Web | Team Admin</title>
  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome for icon fonts -->
  <link rel="stylesheet" href="/cms/plugins/fontawesome-free/css/all.min.css">
  <!-- DataTables CSS for table styling -->
  <link rel="stylesheet" href="/cms/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="/cms/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="/cms/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- Select2 CSS for enhanced select dropdowns -->
  <link href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css" rel="stylesheet">
  <!-- AdminLTE Theme style -->
  <link rel="stylesheet" href="/cms/dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <%@ include file="header.jsp" %>
  <%@ include file="sidebar.jsp" %>
  <div class="content-wrapper">
    <!-- Content Header Section -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
          <!-- Breadcrumbs or page title can be added here -->
        </div>
      </div>
    </section>
    <!-- Main content section -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <!-- Card container for managing teams -->
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Manage Teams</h3>
                <button type="button" class="btn btn-success btn-sm float-right" id="addTeamBtn">Add Team</button>
              </div>
              <div class="card-body">
                <table id="teamTable" class="table table-bordered table-hover">
                  <thead>
                  <tr>
                    <th>Team Name</th>
                    <th>Description</th>
                    <th>Actions</th>
                  </tr>
                  </thead>
                  <tbody>
                  <!-- Table body will be dynamically filled -->
                  </tbody>
                  <tfoot>
                  <tr>
                    <th>Team Name</th>
                    <th>Description</th>
                    <th>Actions</th>
                  </tr>
                  </tfoot>
                </table>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>

  <!-- Modal for adding or editing a team -->
  <div class="modal fade" id="teamModal" tabindex="-1" role="dialog" aria-labelledby="teamModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-xl" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 id="teamModalLabel" class="modal-title"></h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <form id="teamForm">
          <div class="modal-body">
            <input type="hidden" id="teamId" name="teamId">
            <div class="form-group">
              <label for="teamName">Team Name</label>
              <input type="text" class="form-control" id="teamName" name="teamName" required>
            </div>
            <div class="form-group">
              <label for="teamDescription">Description</label>
              <textarea class="form-control" id="teamDescription" name="teamDescription" rows="3" required></textarea>
            </div>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
            <button type="button" id="saveTeamBtn" class="btn btn-primary">Save Changes</button>
          </div>
        </form>
      </div>
    </div>
  </div>

  <!-- Modal for assigning users to a team -->
  <div class="modal fade" id="assignUserModal" tabindex="-1" aria-labelledby="assignUserModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="assignUserModalLabel">Assign Users to Team</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <input type="hidden" id="teamSelect" value="">
          <div class="form-group">
            <label for="userSelect">Select Users</label>
            <select id="userSelect" class="form-control" multiple="multiple" style="width: 100%;">
              <!-- Options will be dynamically populated via AJAX -->
            </select>
          </div>
          <div id="userListSection" class="mb-3">
            <h5>Mapped Users</h5>
            <ul id="userList" class="list-group">
              <!-- User list items added dynamically -->
            </ul>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- External JavaScript libraries and plugins -->
<script src="/cms/plugins/jquery/jquery.min.js"></script>
<script src="/cms/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="/cms/plugins/datatables/jquery.dataTables.min.js"></script>
<script src="/cms/plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="/cms/plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="/cms/plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="/cms/plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="/cms/plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="/cms/plugins/jszip/jszip.min.js"></script>
<script src="/cms/plugins/pdfmake/pdfmake.min.js"></script>
<script src="/cms/plugins/pdfmake/vfs_fonts.js"></script>
<script src="/cms/plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="/cms/plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="/cms/plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<script src="/cms/dist/js/adminlte.min.js"></script>
<script src="app.js"></script>
<script src="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/js/select2.min.js"></script>
<script>
  // Function to set team data and open the assign user modal
  function setTeamAndOpenModal(teamId, teamName) {
    $('#teamSelect').val(teamId);
    $('#assignUserModalLabel').text('Assign Users to ' + teamName);
    $('#userList').empty();
    $.ajax({
      url: '/cms/api/user/team/' + teamId,
      method: 'GET',
      dataType: 'json',
      success: function(data) {
        $('#userList').empty();
        if (data.length === 0) {
          $('#userList').append('<strong class="list-group-item">No users mapped to this team.</strong>');
        } else {
          data.forEach(function(user) {
            var userItem = $('<li class="list-group-item" data-id="'+ user.id +'"></li>');
            userItem.text(user.username);
            var removeButton = $('<button class="btn btn-danger btn-sm ml-2 float-right rmv-mapping">Remove</button>');
            removeButton.on('click', function() {
              var btn = $(this);
              $.ajax({
                url: '/cms/api/userTeam/' + $(btn).parents('li').data('id') + "/" +  teamId,
                method: 'DELETE',
                success: function(response) {
                  $(btn).parents('li').remove();
                  if ($('#userList li').length == 0) {
                    $('#userList').append('<strong class="list-group-item">No users mapped to this team.</strong>');
                  }
                },
                error: function(error) {
                  console.error('Error deleting mapping:', error);
                }
              });
            });
            userItem.append(removeButton);
            $('#userList').append(userItem);
          });
        }
      },
      error: function(error) {
        console.error("Error fetching mapped users:", error);
        alert("Error fetching mapped users.");
      }
    });
    $.ajax({
      url: '/cms/api/user/team/unassigned/' + teamId,
      method: 'GET',
      dataType: 'json',
      success: function(data) {
        $('#userSelect').empty();
        data.forEach(function(user) {
          var option = new Option(user.username, user.id, false, false);
          $('#userSelect').append(option);
        });
        $('#userSelect').select2({
          placeholder: "Select users",
          allowClear: true,
          multiple: false
        });
        $('#userSelect').val(null).trigger('change');
      },
      error: function(error) {
        console.error("Error fetching users:", error);
        alert("Error fetching users.");
      }
    });
    $('#assignUserModal').modal('show');
  }

  // Validate team form fields similar to admin.jsp validation
  function validateTeamForm() {
    var teamName = $('#teamName').val().trim();
    var teamDescription = $('#teamDescription').val().trim();
    if (teamName === '' || teamDescription === '') {
      showDangerToast('Team Name and Description are required.');
      return false;
    }
    return true;
  }

  $(function () {
    var orgId = ${sessionScope.orgId};
    var table = $('#teamTable').DataTable({
      ajax: {
        url: "/cms/api/team?orgId=" + orgId,
        dataType: 'json',
        dataSrc: ""
      },
      columns: [
        { data: "name" },
        { data: "description" },
        {
          data: "id",
          render: function(data, type, row) {
            return '<button type="button" class="btn btn-primary editTeamBtn" data-id="'+ data +'">Edit</button>&nbsp;' +
                    '<button type="button" class="btn btn-danger deleteTeamBtn" data-id="'+ data +'">Delete</button>&nbsp;' +
                    '<button type="button"'
                    + '  class="btn btn-success assignBtn"'
                    + '  data-id   ="'+ row.id   +'"'
                    + '  data-name ="'+ row.name +'">'
                    + '  Assign'
                    + '</button>';
          }
        }
      ]
    });

    // Bind once up front: when a user is selected, assign them and update the list
    $('#userSelect').on('select2:select', function(e) {
      var user     = e.params.data;
      var userId   = user.id;
      var username = user.text;

      // 1) POST to map the user
      $.post('/cms/api/userTeam/' + userId + '/' + $('#teamSelect').val())
              .done(function() {
                $(document).Toasts('create', {
                  class: 'bg-success',
                  title: 'Assigned',
                  body: username + ' added',
                  autohide: true,
                  delay: 1500
                });
              })
              .fail(function() {
                $(document).Toasts('create', {
                  class: 'bg-danger',
                  title: 'Error',
                  body: 'Could not assign ' + username,
                  autohide: true,
                  delay: 1500
                });
              });

      // 2) Add them to the UI list
      var $li = $('<li>')
              .addClass('list-group-item d-flex justify-content-between')
              .attr('data-id', userId)
              .text(username);

      var $btn = $('<button>')
              .addClass('btn btn-danger btn-sm')
              .text('Remove')
              .on('click', function() {
                $.ajax({
                  url: '/cms/api/userTeam/' + userId + '/' + $('#teamSelect').val(),
                  method: 'DELETE'
                }).done(function() {
                  $li.remove();
                  if (!$('#userList li').length) {
                    $('#userList').append(
                            '<li class="list-group-item"><strong>No users mapped to this team.</strong></li>'
                    );
                  }
                });
              });

      $li.append($btn);
      if (!$('#userList li').length) $('#userList').empty();
      $('#userList').append($li);
    });


    $('#teamTable tbody').on('click', '.editTeamBtn', function() {
      var teamId = $(this).attr("data-id");
      $.ajax({
        url: "/cms/api/team/" + teamId,
        type: 'GET',
        dataType: 'json',
        success: function(res) {
          $('#teamModalLabel').text("Edit Team: " + res.name);
          $('#teamId').val(res.id);
          $('#teamName').val(res.name);
          $('#teamDescription').val(res.description);
          $('#teamModal').modal('show');
        },
        error: function(xhr, status, error) {
          console.error("Error retrieving team data:", error);
        }
      });
    });

    $('#teamTable tbody').on('click', '.deleteTeamBtn', function() {
      var teamId = $(this).attr("data-id");
      confirmationBox(deleteTeam, teamId);
    });

    function deleteTeam(teamId) {
      $.ajax({
        url: "/cms/api/team/" + teamId,
        type: 'DELETE',
        success: function(response) {
          $(document).Toasts('create', {
            class: 'bg-success',
            title: 'Deleted',
            body: 'Team deleted successfully',
            autohide: true,
            delay: 1500
          });
          $('#teamTable').DataTable().ajax.reload(null, false);
        },
        error: function(xhr, status, error) {
          $(document).Toasts('create', {
            class: 'bg-danger',
            title: 'Error',
            body: 'Error deleting team',
            autohide: true,
            delay: 1500
          });
        }
      });
    }

    $('#teamTable tbody').on('click', '.assignBtn', function() {
      const teamId   = $(this).data('id');
      const teamName = $(this).data('name');
      setTeamAndOpenModal(teamId, teamName);
    });


    $("#addTeamBtn").click(function(){
      $('#teamModalLabel').text("New Team");
      $('#teamForm')[0].reset();
      $('#teamId').val('');
      $('#teamModal').modal('show');
    });

    $("#saveTeamBtn").click(function() {
      if (!validateTeamForm()) {
        return;
      }
      var teamData = {
        name: $('#teamName').val(),
        description: $('#teamDescription').val()
      };
      var teamId = $('#teamId').val();
      if (teamId && teamId !== "") {
        teamData.id = teamId;
      }
      teamData.org = { id: orgId };
      $.ajax({
        url: "/cms/api/team",
        type: 'POST',
        data: JSON.stringify(teamData),
        contentType: 'application/json',
        dataType: 'json',
        success: function(res) {
          $('#teamModal').modal('hide');
          $(document).Toasts('create', {
            class: 'bg-success',
            title: 'Success',
            body: 'Team saved successfully',
            autohide: true,
            delay: 1500
          });
          $('#teamTable').DataTable().ajax.reload(null, false);
        },
        error: function(xhr, status, error) {
          $(document).Toasts('create', {
            class: 'bg-danger',
            title: 'Error',
            body: 'Error saving team',
            autohide: true,
            delay: 1500
          });
        }
      });
    });

    $('#teamModal').on('hidden.bs.modal', function () {
      $('#teamForm')[0].reset();
      $('#teamId').val('');
    });
  });
</script>
</body>
</html>
