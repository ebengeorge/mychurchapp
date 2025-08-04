<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>CMS | Admin Dashboard</title>

  <!-- Google Font: Source Sans Pro -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="/cms/plugins/fontawesome-free/css/all.min.css">
  <!-- DataTables -->
  <link rel="stylesheet" href="/cms/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
  <link rel="stylesheet" href="/cms/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
  <link rel="stylesheet" href="/cms/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
  <link rel="stylesheet" href="/cms/plugins/bootstrap-colorpicker/css/bootstrap-colorpicker.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="/cms/dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
  <!-- Navbar -->
  <nav class="main-header navbar navbar-expand navbar-white navbar-light" style="margin: 0;">
<h4 style="margin: 5px;"> CMS Admin</h4>     
    <!-- Right navbar links -->
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
              <p class="text-sm text-muted"><span style="text-transform: capitalize"> ${role}</span> |  ${sessionScope.orgName}</p>
            </div>
          </div>
        </span>
          <div class="dropdown-divider"></div>
          <a href="#" class="dropdown-item dropdown-footer" onclick="submitLogout()">Logout</a>
          <form id="logoutform" action="logout" method="POST">
            <input type="hidden" name="userId" value='${sessionScope.userName}'>
          </form>
        </div>
      </li>
    </ul>
  </nav>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" style="margin: 0 !important;">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <div class="container-fluid">
        <div class="row mb-2">
        
        </div>
      </div><!-- /.container-fluid -->
    </section>

    <!-- Main content -->
    <section class="content">
      <div class="container-fluid">
        <div class="row">
          <div class="col-12">
            <div class="card">
              <div class="card-header">
                <h3 class="card-title">Manage Organizations</h3> <button type="button" class="btn btn-success btn-sm float-right" id="addBtn">Add</button>
              </div>
              <!-- /.card-header -->
              <div class="card-body">
                <table id="orgTable" class="table table-bordered table-hover">
                  <thead>
                  <tr>
                    <th>Organization Name</th>
                    <th>Address</th>
                    <th>Created On</th>
                    <th>Actions</th>
                  </tr>
                  </thead>
                  <tbody>

                  </tbody>
                  <tfoot>
                  <tr>
                    <th>Organization Name</th>
                    <th>Address</th>
                    <th>Created On</th>
                    <th>Actions</th>
                  </tr>
                  </tfoot>
                </table>
              </div>
              <!-- /.card-body -->
            </div>
            <!-- /.card -->
            <!-- /.card -->
          </div>
          <!-- /.col -->
        </div>
        <!-- /.row -->
      </div>
      <!-- /.container-fluid -->
    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->
  <footer class="main-footer">
  
  </footer>

  <!-- Control Sidebar -->
  <aside class="control-sidebar control-sidebar-dark">
    <!-- Control sidebar content goes here -->
  </aside>
  <!-- /.control-sidebar -->
</div>

<!-- Modal Structure -->
<div class="modal fade" id="modal-xl">
  <div class="modal-dialog modal-xl">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title" id="modal-header">Extra Large Modal</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="orgSave">
          <input type="hidden" id="id" name="id">
          <input type="hidden" id="isExclusive" name="isExclusive" value="0">
          <div class="card-body">
            <div class="form-group">
              <label for="orgName">Organization Name</label>
              <input type="text" name="orgName" class="form-control" id="orgName" placeholder="Enter Organization Name">
            </div>
            <div class="form-group">
              <label for="orgAddress">Address</label>
              <input type="text" name="address" class="form-control" id="orgAddress" placeholder="Enter Address">
            </div>
            <!-- Admin User field, initially hidden -->
            <div class="form-group" id="adminUserField" style="display: none;">
              <label for="adminUser">Admin User</label>
              <input type="text" name="adminUser" class="form-control" id="adminUser" placeholder="Enter Admin User">
            </div>
            <!-- New Logo Upload Field -->
            <div class="form-group">
              <label for="orgLogo">Logo</label>
              <input type="file" name="orgLogo" class="form-control" id="orgLogo" accept="image/*">
            </div>
            <!-- New Theme Color Picker Field -->
            <div class="form-group">
              <label for="orgTheme">Theme</label>
              <select name="theme" id="orgTheme" class="form-control">
                <option value="light" selected>Light</option>
                <option value="dark">Dark</option>
              </select>
            </div>


          </div>
          <!-- /.card-body -->
        </form>
      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" id="submitBtn">Save changes</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>
<!-- /.modal -->
<!-- confirmation box -->
<div class="modal fade" id="confirmationBox">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h4 class="modal-title">Delete Organization</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <p>Do you want to Proceed Now?</p>
      </div>
      <div class="modal-footer justify-content-between">
        <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        <button type="button" class="btn btn-primary" id="confirmationYes">Yes</button>
      </div>
    </div>
    <!-- /.modal-content -->
  </div>
  <!-- /.modal-dialog -->
</div>

<!-- ./wrapper -->

<!-- jQuery -->
<script src="/cms/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/cms/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- DataTables  & Plugins -->
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
<!-- AdminLTE App -->
<script src="/cms/dist/js/adminlte.min.js"></script>

<script src="app.js"></script>
<script src="/cms/plugins/bootstrap-colorpicker/js/bootstrap-colorpicker.min.js"></script>
<!-- Page specific script -->
<script>
  $(function () {
    // Initialize the DataTable with AJAX loading
    var table = $('#orgTable').DataTable({
      ajax: {
        url: "/cms/api/org",
        dataSrc: ""
      },
      columns: [
        { data: "orgName" },
        { data: "address" },
        { data: "createdOn" },
        {
          data: "id",
          render: function(data, type, row) {
            return '<button type="button" class="btn btn-primary edtBtn" data-id="'+ data +'">Edit</button>&nbsp;' +
                    '<button type="button" class="btn btn-danger dltBtn" data-id="'+ data +'">Delete</button>';
          }
        }
      ]
    });

    $('.my-colorpicker2').colorpicker()

    $('.my-colorpicker2').on('colorpickerChange', function(event) {
      $('.my-colorpicker2 .fa-square').css('color', event.color.toString());
    })

    // Delegate event for Edit buttons
    $('#orgTable tbody').on('click', '.edtBtn', function() {
      var orgId = $(this).attr("data-id");
      $.ajax({
        url: "/cms/api/org/" + orgId,
        type: 'GET',
        dataType: 'json',
        success: function(res) {
          // Populate modal fields with the retrieved organization data
          $('#modal-header').text(res.orgName);
          $('#id').val(orgId);
          $('#orgName').val(res.orgName);
          $('#isExclusive').val("0");
          $('#orgAddress').val(res.address);
          $('#orgTheme').val(res.theme);
        }
      });
      $('#adminUserField').hide();
      $('#modal-xl').modal('show');
    });

    // Delegate event for Delete buttons (if needed)
    $('#orgTable tbody').on('click', '.dltBtn', function() {
      var orgId = $(this).attr("data-id");
      confirmationBox(deleteOrganization, orgId);
    });
    function deleteOrganization(orgId) {
      $.ajax({
        url: "/cms/api/org/" + orgId,  // Your delete endpoint
        type: 'DELETE',
        success: function(response) {
          // Show a success toast
          $(document).Toasts('create', {
            class: 'bg-success',
            title: 'Deleted',
            body: 'Organization deleted successfully',
            autohide: true,
            delay: 1500
          });
          // Reload the DataTable to reflect the deletion
          table.ajax.reload(null, false);
        },
        error: function(xhr, status, error) {
          // Show an error toast in case of failure
          $(document).Toasts('create', {
            class: 'bg-danger',
            title: 'Error',
            body: 'Error deleting organization',
            autohide: true,
            delay: 1500
          });
        }
      });
    }

    // Open modal for adding a new organization
    $("#addBtn").click(function(){
      $('#modal-header').text('New Organization');
      $('#adminUserField').show();
      $('#modal-xl').modal('show');
     });

     $('#modal-xl').on('hidden.bs.modal', function () {
     $('#orgSave input[type="text"]').val('');

    // Clear all hidden inputs
    $('#orgSave input[type="hidden"]').val('');

    // Clear any select dropdowns
    $('#orgSave select').val('').trigger('change');

    // Clear all checkboxes and radio buttons
    $('#orgSave input[type="checkbox"], #orgSave input[type="radio"]').prop('checked', false);

    // If you have any textarea fields
    $('#orgSave textarea').val('');
    });


    $("#submitBtn").click(function() {
      // Call validation for the add form
      if (!validateAddForm()) {
        return; // Stop the AJAX call if validation fails
      }

      var fileInput = document.getElementById("orgLogo");
      if (fileInput.files.length > 0) {
        var file = fileInput.files[0];
        if (!file.type.startsWith("image/")) {
          alert("Please select a valid image file.");
          return;
        }
        if (file.size > 5 * 1024 * 1024) {  // 5MB limit
          alert("The file size should not exceed 5MB.");
          return;
        }
      }

      var formElement = document.getElementById("orgSave");
      var formData = new FormData(formElement);

      var apiUrl = "/cms/api/org/save";
      if ($('#adminUserField').is(":visible")) {
        apiUrl = apiUrl + "?adminUserId=" + $('#adminUser').val();
      }

      $.ajax({
        type: "POST",
        url: apiUrl,
        data: formData,
        processData: false,
        contentType: false,
        dataType: 'json',
        success: function(data) {
          $('#modal-xl').modal('hide');
          $(document).Toasts('create', {
            class: 'bg-success',
            title: 'Success',
            body: 'Organization saved successfully',
            autohide: true,
            delay: 1500
          });
          table.ajax.reload(null, false);
        },
        error: function(xhr, status, error) {
          showDangerToast("Error saving organization");
        }
      });
    });


    // Validate mandatory fields for the add function
    function validateAddForm() {
      // Assuming your input fields have these IDs: orgName, address, adminUser, logo, theme
      var orgName = $('#orgName').val().trim();
      var address = $('#orgAddress').val().trim();
      var adminUser = $('#adminUser').val().trim();
      var logo = $('#orgLogo').val().trim();
      var theme = $('#orgTheme').val().trim();
      if ($('#adminUserField').is(":visible")) {
       if ( adminUser === '') {
        showDangerToast('Admin User is required.');
        return false;
       }
      }

      if (orgName === '' || address === '' ||  logo === '' || theme === '') {
        showDangerToast('All fields (Org Name, Address, Logo, Theme) are required.');
        return false;
      }
      return true;
    }

    // Validate mandatory fields for the edit function
    function validateEditForm() {
      // Use the same selectors or adjust if your edit form has different IDs
      var orgName = $('#orgName').val().trim();
      var address = $('#orgAddress').val().trim();
      var adminUser = $('#adminUser').val().trim();
      var logo = $('#orgLogo').val().trim();
      var theme = $('#orgTheme').val().trim();


      if (orgName === '' || address === '' || adminUser === '' || theme === '') {
        showDangerToast('Please fill in all fields before updating.');
        return false;
      }
      return true;
    }

    $('#addForm').on('submit', function(e) {
      if (!validateAddForm()) {
        e.preventDefault();
      }
    });

    $('#editForm').on('submit', function(e) {
      if (!validateEditForm()) {
        e.preventDefault();
      }
    });

  });
</script>
</body>
</html>
