<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>AdminLTE 3 | Timeline</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="../../plugins/fontawesome-free/css/all.min.css">
    <!-- AdminLTE CSS -->
    <link rel="stylesheet" href="../../dist/css/adminlte.min.css">
</head>
<body class="hold-transition sidebar-mini">
<!-- Site wrapper -->
<div class="wrapper">

    <!-- Preloader -->
    <div class="preloader flex-column justify-content-center align-items-center">
        <img class="animation__shake" src="dist/img/AdminLTELogo.png" alt="AdminLTELogo" height="60" width="60">
    </div>

    <jsp:include page="header.jsp" />

    <!-- Sidebar -->
    <jsp:include page="sidebar.jsp" />

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="container-fluid">
                <div class="row mb-2">
                    <div class="col-sm-6">
                        <h1>Timeline</h1>
                    </div>
                    <div class="col-sm-6">
                        <ol class="breadcrumb float-sm-right">
                            <li class="breadcrumb-item"><a href="#">Home</a></li>
                            <li class="breadcrumb-item active">Timeline</li>
                        </ol>
                    </div>
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>

        <!-- Main content -->
        <section class="content">
            <div class="container-fluid">
                <!-- Button to trigger Create Post modal -->
                <div class="mb-3">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createPostModal">
                        Create New Post
                    </button>
                </div>

                <!-- Timeline example -->
                <div class="row">
                    <div class="col-md-12">
                        <!-- The timeline -->
                        <div class="timeline">
                            <!-- timeline time label -->
                            <div class="time-label">
                                <span class="bg-red">10 Feb. 2014</span>
                            </div>
                            <!-- /.timeline-label -->
                            <!-- timeline item -->
                            <div>
                                <i class="fas fa-envelope bg-blue"></i>
                                <div class="timeline-item">
                                    <span class="time"><i class="fas fa-clock"></i> 12:05</span>
                                    <h3 class="timeline-header"><a href="#">Support Team</a> sent you an email</h3>
                                    <div class="timeline-body">
                                        Etsy doostang zoodles disqus grouplin oooj voxy zoodles, weebly ning heekya handango imeem plugg dopplr jibjab, movity jajah plickers sifteo edmodo ifttt zimbra. Babblely odeo kaboodle quora plaxo ideeli hulu weebly balihoo...
                                    </div>
                                    <div class="timeline-footer">
                                        <a class="btn btn-primary btn-sm">Read more</a>
                                        <a class="btn btn-danger btn-sm">Delete</a>
                                    </div>
                                </div>
                            </div>
                            <c:forEach var="post" items="${posts}">
                                <div>
                                    <i class="fas fa-envelope bg-blue"></i>
                                    <div class="timeline-item">
                                        <span class="time"><i class="fas fa-clock"></i> ${post.time}</span>
                                        <h3 class="timeline-header">
                                            <a href="">${post.author.username}</a> posted in 
                                        </h3>
                                        <div class="timeline-body">
                                                ${post.body}
                                        </div>
                                        <div class="timeline-footer">
                                            <a class="btn btn-primary btn-sm" href="${post.readMoreLink}">Read more</a>
                                            <a class="btn btn-danger btn-sm" href="${post.deleteLink}">Delete</a>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                            <div>
                                <i class="fas fa-clock bg-gray"></i>
                            </div>
                        </div>
                    </div>
                    <!-- /.col -->
                </div>
            </div>
            <!-- /.container-fluid -->
        </section>
        <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Create Post Modal -->
    <div class="modal fade" id="createPostModal" tabindex="-1" role="dialog" aria-labelledby="createPostModalLabel" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="createPostModalLabel">Create New Post</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form role="form" action="/post" method="post" id="createPostForm">
                    <div class="modal-body">
                        <div class="form-group">
                            <label for="modalPostTitle">Title</label>
                            <input type="text" class="form-control" id="modalPostTitle" name="title" placeholder="Enter post title">
                        </div>
                        <div class="form-group">
                            <label for="modalPostContent">Content</label>
                            <textarea class="form-control" id="modalPostContent" name="content" rows="3" placeholder="What's on your mind?"></textarea>
                        </div>
                        <div class="form-group">
                            <label for="modalPostTo">Post To</label>
                            <select class="form-control" id="modalPostTo" name="team.id">
                                <option value="1">Timeline</option>
                                <option value="2">Announcements</option>
                                <option value="3">Events</option>
                            </select>
                            <input type="hidden" name="author.id" value="1">
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="submit" class="btn btn-primary" name="sbtBtn">Post</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- End Create Post Modal -->

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

<!-- jQuery -->
<script src="../../plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="../../plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="../../dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="../../dist/js/demo.js"></script>
<script src="app.js"></script>
<script>
    $(document).ready(function() {
        // Attach a submit handler to the form in the modal
        $("#createPostModal form").submit(function(e) {
            e.preventDefault(); // Prevent the default form submission

            var form = $(this);

            $.ajax({
                url: "/api/post/save", // Use the form's action URL
                type: "POST",
                data: convertToJson("createPostForm"),  // convertToJson should serialize your form data appropriately
                dataType: 'json',
                contentType: 'application/json',
                success: function(response) {
                    console.log("Post submitted successfully:", response);
                    // Optionally, close the modal and reset the form on success
                    $("#createPostModal").modal("hide");
                    form.trigger("reset");
                    $(document).Toasts('create', {
                        class: 'bg-success',
                        title: 'Success',
                        body: 'Changes saved Successfully',
                        autohide: true,
                        delay: 1500
                    });
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    console.error("Error submitting form:", textStatus, errorThrown);
                }
            });
        });
    });
</script>
</body>
</html>
