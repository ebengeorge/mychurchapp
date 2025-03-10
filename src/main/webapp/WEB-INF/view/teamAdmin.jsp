<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>CMS | Organization Dashboard</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="../../plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="../../plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- Navbar (reuse your existing navbar code) -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light" style="margin: 0;">
    <h4 style="margin: 5px;"> CMS Organization Admin</h4>
    <ul class="navbar-nav ml-auto">
      <li class="nav-item dropdown">
        <a class="nav-link" data-toggle="dropdown" href="#">
          <i class="far fa-user"></i>
        </a>
        <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
          <span class="dropdown-item dropdown-header">
            <div class="media">
              <div class="media-body">
                <p class="text-sm">Logged In</p>
                <h3 class="dropdown-item-title">
                  ${sessionScope.userName}
                </h3>
                <p class="text-sm text-muted"><span style="text-transform: capitalize"> ${role}</span> | ${sessionScope.orgName}</p>
              </div>
            </div>
          </span>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer" onclick="submitLogout()">Logout</a>
          <form id="logoutform" action="logout" method="POST">
            <input type="hidden" name="userId" value="${sessionScope.userName}">
          </form>
        </div>
      </li>
    </ul>
  </nav>
  <!-- Content Wrapper -->
  <div class="content-wrapper" style="margin: 0 !important;">
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2"></div>
      </div>
    </section>
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
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

  <!-- Team Modal -->
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
              <textarea class="form-control" id="teamDescription" name="teamDescription" rows="3"></textarea>
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


  <!-- Footer / Additional Modals can be added here if needed -->
</div>

<!-- Embedded JavaScript -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="../../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../../plugins/datatables-bs4/js/dataTables.bootstrap4.min.js"></script>
<script src="../../plugins/datatables-responsive/js/dataTables.responsive.min.js"></script>
<script src="../../plugins/datatables-responsive/js/responsive.bootstrap4.min.js"></script>
<script src="../../plugins/datatables-buttons/js/dataTables.buttons.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.bootstrap4.min.js"></script>
<script src="../../plugins/jszip/jszip.min.js"></script>
<script src="../../plugins/pdfmake/pdfmake.min.js"></script>
<script src="../../plugins/pdfmake/vfs_fonts.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.html5.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.print.min.js"></script>
<script src="../../plugins/datatables-buttons/js/buttons.colVis.min.js"></script>
<script src="../../dist/js/adminlte.min.js"></script>
<script src="app.js"></script>
<script>
  $(function () {
    // Get the organization id from the session
    var orgId = ${sessionScope.orgId};

    // Initialize the DataTable for teams
    var table = $('#teamTable').DataTable({
      ajax: {
        url: "/api/team?orgId=" + orgId,  // This endpoint should filter teams by orgId
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
                    '<button type="button" class="btn btn-danger deleteTeamBtn" data-id="'+ data +'">Delete</button>';
          }
        }
      ]
    });

    $(document).ready(function() {

      // Delegate event for Edit team buttons
      $('#teamTable tbody').on('click', '.editTeamBtn', function() {
        var teamId = $(this).attr("data-id");
        $.ajax({
          url: "/api/team/" + teamId,  // Assumes GET returns team details in JSON
          type: 'GET',
          dataType: 'json',
          success: function(res) {
            // Populate modal fields with team data
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

      // Delegate event for Delete team buttons
      $('#teamTable tbody').on('click', '.deleteTeamBtn', function() {
        var teamId = $(this).attr("data-id");
        if (confirm("Are you sure you want to delete this team?")) {
          $.ajax({
            url: "/api/team/" + teamId,  // Assumes DELETE endpoint for team admin
            type: 'DELETE',
            success: function(response) {
              $(document).Toasts('create', {
                class: 'bg-success',
                title: 'Deleted',
                body: 'Team deleted successfully',
                autohide: true,
                delay: 1500
              });
              // Reload the team table (assuming your DataTable instance variable is "table")
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
      });

      // Open modal for adding a new team
      $("#addTeamBtn").click(function(){
        $('#teamModalLabel').text("New Team");
        // Clear the form fields
        $('#teamForm')[0].reset();
        $('#teamId').val('');
        $('#teamModal').modal('show');
      });

      // When the Save Changes button is clicked in the team modal
      $("#saveTeamBtn").click(function() {
        var teamData = {
          name: $('#teamName').val(),
          description: $('#teamDescription').val()
        };
        var teamId = $('#teamId').val();
        // If editing, include the team ID (for simplicity, using POST for both create/update)
        if (teamId && teamId !== "") {
          teamData.id = teamId;
        }
        teamData.org = {id:orgId};
        $.ajax({
          url: "/api/team",  // Endpoint to save team for organization admin
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
            // Reload the team DataTable
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

      // Optionally, clear form fields when modal is hidden
      $('#teamModal').on('hidden.bs.modal', function () {
        $('#teamForm')[0].reset();
        $('#teamId').val('');
      });
    });


  });
</script>
</body>
</html>
