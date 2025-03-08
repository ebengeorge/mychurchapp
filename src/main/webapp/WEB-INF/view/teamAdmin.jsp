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
                    <th>Default</th>
                    <th>Actions</th>
                  </tr>
                  </thead>
                  <tbody>
                  </tbody>
                  <tfoot>
                  <tr>
                    <th>Team Name</th>
                    <th>Description</th>
                    <th>Default</th>
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
        url: "/api/team/list",  // This endpoint should filter teams by orgId
        data: { orgId: orgId },
        dataSrc: ""
      },
      columns: [
        { data: "name" },
        { data: "description" },
        { data: "isDefault", render: function(data) {
            return data === 1 ? "Yes" : "No";
          }
        },
        {
          data: "id",
          render: function(data, type, row) {
            return '<button type="button" class="btn btn-primary editTeamBtn" data-id="'+ data +'">Edit</button>&nbsp;' +
                    '<button type="button" class="btn btn-danger deleteTeamBtn" data-id="'+ data +'">Delete</button>';
          }
        }
      ]
    });

    // Edit team event
    $('#teamTable tbody').on('click', '.editTeamBtn', function() {
      var teamId = $(this).attr("data-id");
      // Implement AJAX call to get team details and show in a modal for editing
      console.log("Edit team with id:", teamId);
    });

    // Delete team event
    $('#teamTable tbody').on('click', '.deleteTeamBtn', function() {
      var teamId = $(this).attr("data-id");
      // Implement confirmation and AJAX call to delete the team
      console.log("Delete team with id:", teamId);
    });

    // Add team button event
    $("#addTeamBtn").click(function(){
      // Show modal for adding a new team
      console.log("Show add team modal");
    });
  });
</script>
</body>
</html>
