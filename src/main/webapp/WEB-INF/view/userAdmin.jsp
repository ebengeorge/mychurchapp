<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Ministry Web | User Admin</title>
    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/cms/plugins/fontawesome-free/css/all.min.css">
    <!-- DataTables -->
    <link rel="stylesheet" href="/cms/plugins/datatables-bs4/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="/cms/plugins/datatables-responsive/css/responsive.bootstrap4.min.css">
    <link rel="stylesheet" href="/cms/plugins/datatables-buttons/css/buttons.bootstrap4.min.css">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.0.13/dist/css/select2.min.css" rel="stylesheet">
    <!-- Theme style -->
    <link rel="stylesheet" href="/cms/dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
<div class="wrapper">
    <%@ include file="header.jsp" %>
    <%@ include file="sidebar.jsp" %>
    <div class="content-wrapper">
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>User Administration</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="/dashboard.jsp">Home</a></li>
                            <li class="breadcrumb-item active">User Administration</li>
                        </ol>
                    </div>
                </div>
            </div>
        </section>
        <section class="content">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h3 class="card-title">Manage Users</h3>
                                <button type="button" class="btn btn-success btn-sm float-right" id="addUserBtn">Add User</button>
                            </div>
                            <div class="card-body">
                                <table id="userTable" class="table table-bordered table-hover">
                                    <thead>
                                    <tr>
                                        <th>User Name</th>
                                        <th>Email Id</th>
                                        <th>Role</th>
                                        <th>Created On</th>
                                        <th>Actions</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <!-- Data populated via AJAX/DataTables -->
                                    </tbody>
                                    <tfoot>
                                    <tr>
                                        <th>User Name</th>
                                        <th>Email Id</th>
                                        <th>Role</th>
                                        <th>Created On</th>
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

    <!-- User Add/Edit Modal -->
    <div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 id="userModalLabel" class="modal-title"></h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form id="userForm">
                    <div class="modal-body">
                        <input type="hidden" id="userId" name="userId">
                        <div class="form-group">
                            <label for="userName">User Name</label>
                            <input type="text" class="form-control" id="userName" name="userName" required>
                        </div>
                        <div class="form-group">
                            <label for="userEmail">Email Id</label>
                            <input type="email" class="form-control" id="userEmail" name="userEmail" required>
                        </div>
                        <div class="form-group">
                            <label for="userRole">Role</label>
                            <select class="form-control" id="userRole" name="userRole">
                                <option value="admin">Admin</option>
                                <option value="user">User</option>
                            </select>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
                        <button type="button" id="saveUserBtn" class="btn btn-primary">Save Changes</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Confirmation Modal -->
    <div class="modal fade" id="confirmationModal" tabindex="-1" role="dialog" aria-labelledby="confirmationModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="confirmationModalLabel">Confirm Deactivation</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    Are you sure you want to deactivate this user?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal" id="confirmNoBtn">No</button>
                    <button type="button" class="btn btn-danger" id="confirmYesBtn">Yes</button>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Embedded JavaScript -->
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
    $(document).ready(function() {
        var orgId = ${sessionScope.orgId};
        var userTable = $('#userTable').DataTable({
            ajax: {
                url: "/cms/api/user?orgId=" + orgId,
                dataType: 'json',
                dataSrc: ""
            },
            columns: [
                { data: "username" },
                { data: "email" },
                { data: "role" },
                { data: "createdOn" },
                {
                    data: "id",
                    render: function(data, type, row) {
                        return '<button type="button" class="btn btn-primary editUserBtn" data-id="'+ data +'">Edit</button>&nbsp;' +
                            '<button type="button" class="btn btn-danger deactivateUserBtn" data-id="'+ data +'">Deactivate</button>';
                    }
                }
            ]
        });

        // Validate user form similar to admin.jsp validation
        function validateUserForm() {
            var userName = $('#userName').val().trim();
            var userEmail = $('#userEmail').val().trim();
            if (userName === '' || userEmail === '') {
                showDangerToast('User Name and Email are required.');
                return false;
            }
            return true;
        }

        function confirmationBox(callback, id) {
            $('#confirmYesBtn').off('click');
            $('#confirmationModal').modal('show');
            $('#confirmYesBtn').on('click', function() {
                callback(id);
                $('#confirmationModal').modal('hide');
            });
        }

        $("#addUserBtn").click(function(){
            $('#userModalLabel').text("Add New User");
            $('#userForm')[0].reset();
            $('#userId').val('');
            $('#userModal').modal('show');
        });

        $("#saveUserBtn").click(function() {
            if (!validateUserForm()) {
                return;
            }
            var userData = {
                username: $('#userName').val(),
                email: $('#userEmail').val(),
                role: $('#userRole').val(),
                org: { id: orgId }
            };
            var userId = $('#userId').val();
            if (userId && userId !== "") {
                userData.id = userId;
            }
            $.ajax({
                url: "/cms/api/user/save",
                type: 'POST',
                data: JSON.stringify(userData),
                contentType: 'application/json',
                dataType: 'json',
                success: function(res) {
                    $('#userModal').modal('hide');
                    $(document).Toasts('create', {
                        class: 'bg-success',
                        title: 'Success',
                        body: 'User saved successfully',
                        autohide: true,
                        delay: 1500
                    });
                    $('#userTable').DataTable().ajax.reload(null, false);
                },
                error: function(xhr, status, error) {
                    $(document).Toasts('create', {
                        class: 'bg-danger',
                        title: 'Error',
                        body: 'Error saving user',
                        autohide: true,
                        delay: 1500
                    });
                }
            });
        });

        $('#userTable tbody').on('click', '.editUserBtn', function(){
            var userId = $(this).attr("data-id");
            $.ajax({
                url: "/cms/api/user/" + userId,
                type: 'GET',
                dataType: 'json',
                success: function(res) {
                    $('#userModalLabel').text("Edit User: " + res.username);
                    $('#userId').val(res.id);
                    $('#userName').val(res.username);
                    $('#userEmail').val(res.email);
                    $('#userRole').val(res.role);
                    $('#userModal').modal('show');
                },
                error: function(xhr, status, error) {
                    console.error("Error retrieving user data:", error);
                }
            });
        });

        $('#userTable tbody').on('click', '.deactivateUserBtn', function(){
            var userId = $(this).attr("data-id");
            confirmationBox(deactivateUser, userId);
        });

        function deactivateUser(userId) {
            $.ajax({
                url: "/cms/api/user/" + userId,
                type: 'DELETE',
                success: function(response) {
                    $(document).Toasts('create', {
                        class: 'bg-success',
                        title: 'Deactivated',
                        body: 'User deactivated successfully',
                        autohide: true,
                        delay: 1500
                    });
                    userTable.ajax.reload(null, false);
                },
                error: function(xhr, status, error) {
                    $(document).Toasts('create', {
                        class: 'bg-danger',
                        title: 'Error',
                        body: 'Error deactivating user',
                        autohide: true,
                        delay: 1500
                    });
                }
            });
        }
    });
</script>
</body>
</html>
