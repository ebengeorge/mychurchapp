<!DOCTYPE html>
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
                        <div class="timeline" id="cmstimeline">
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
     function timeAgo(timestamp) {
        const now = new Date();
        const date = new Date(timestamp);
        
        const seconds = Math.floor((now - date) / 1000);
        const minutes = Math.floor(seconds / 60);
        const hours = Math.floor(minutes / 60);
        const days = Math.floor(hours / 24);
        const months = Math.floor(days / 30); // approx 30 days in a month
        const years = Math.floor(days / 365); // approx 365 days in a year
        
        const rtf = new Intl.RelativeTimeFormat('en', { numeric: 'auto' });

        if (seconds < 60) {
            return rtf.format(-seconds, 'second');
        } else if (minutes < 60) {
            return rtf.format(-minutes, 'minute');
        } else if (hours < 24) {
            return rtf.format(-hours, 'hour');
        } else if (days < 30) {
            return rtf.format(-days, 'day');
        } else if (months < 12) {
            return rtf.format(-months, 'month');
        } else {
            return rtf.format(-years, 'year');
        }
    }

    $(document).ready(function() {

        $.ajax({
            url: '/api/post/timeline',  // URL to your API endpoint
            type: 'GET',
            dataType: 'json',
            success: function(posts) {
                renderTimelinePosts(posts);
            },
            error: function(xhr, status, error) {
                console.error("Error fetching posts:", error);
            }
        });
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
    function renderTimelinePosts(posts) {
        var container = $('#cmstimeline'); // The container where posts will be rendered
        container.empty(); // Clear any existing content

        $.each(posts, function(index, post) {
            // Create the outer div
            var postDiv = $('<div></div>');

            // Add envelope icon
            postDiv.append($('<i></i>').addClass('fas fa-envelope bg-blue'));

            // Create timeline item div
            var timelineItem = $('<div></div>').addClass('timeline-item');

            // Create and append the time span
            var timeSpan = $('<span></span>')
                .addClass('time')
                .append($('<i></i>').addClass('fas fa-clock'))
                .append(' ' + timeAgo(post.createdAt));
            timelineItem.append(timeSpan);

            // Create and append the header with the author's username
            var header = $('<h4></h4>')
                .addClass('timeline-header');
            var authorLink = $('<a></a>')
                .attr('href', '')
                .text(post.author.username);

            var isEvent = false;
            if (post.title.startsWith('#EVENT#')) {
                isEvent = true;
            }
            if (isEvent) {
                header.append(authorLink).append(' created new event for <strong>' + post.team.name + '</strong>');
            } else {
                header.append(authorLink).append(' posted in <strong>' + post.team.name + '</strong>');
            }
            timelineItem.append(header);

            var bodyDiv = '';
            if (isEvent) {
                console.log(post.content);
                console.log(JSON.parse(post.content));
               var content = JSON.parse(post.content);
               var t = post.title.split("#EVENT#")[1]
               postTxt = "<h4 class='badge bg-primary' style='font-size:100%'>"+t+"</h4><br>";
               postTxt += '<div class="row"><div class="col-12 col-sm-4"><div class="info-box bg-light"><div class="info-box-content">'
               + ' <span class="info-box-text text-center text-muted">Details</span>'
               + ' <span class="info-box-number text-center text-muted mb-0">'+content.desc+'</span>'      
               + '</div></div></div>' ;
               postTxt += '<div class="col-12 col-sm-4"><div class="info-box bg-light"><div class="info-box-content">'
               + ' <span class="info-box-text text-center text-muted">Starts At</span>'
               + ' <span class="info-box-number text-center text-muted mb-0">'+content.from+'</span>'      
               + '</div></div></div>' ;
               postTxt += '<div class="col-12 col-sm-4"><div class="info-box bg-light"><div class="info-box-content">'
               + ' <span class="info-box-text text-center text-muted">Ends At</span>'
               + ' <span class="info-box-number text-center text-muted mb-0">'+content.to+'</span>'      
               + '</div></div></div></div>' ;
                
            } else {
                postTxt = "<h4 class='badge bg-primary' style='font-size:100%'>"+post.title+"</h4><br><span>"+post.content+"</span>";
            }

            bodyDiv = $('<div></div>')
                .addClass('timeline-body')
                .html(postTxt);

            timelineItem.append(bodyDiv);

            // Create and append the footer with buttons
            var footerDiv = $('<div></div>').addClass('timeline-footer');

            var upvoteBtn = $('<a></a>')
                .addClass('btn btn-success btn-sm')
                .attr('href', '')
                .append($('<i></i>').addClass('fa fa-thumbs-up'))
                .append(' Upvote');

            var downvoteBtn = $('<a></a>')
                .addClass('btn btn-danger btn-sm')
                .attr('href', '')
                .append($('<i></i>').addClass('fa fa-thumbs-down'))
                .append(' Downvote');

            var commentBtn = $('<a></a>')
                .addClass('btn btn-info btn-sm')
                .attr('href', '')
                .append($('<i></i>').addClass('fa fa-comment'))
                .append(' Comment');

            footerDiv.append(upvoteBtn)
                .append(' ')
                .append(downvoteBtn)
                .append(' ')
                .append(commentBtn);
            timelineItem.append(footerDiv);

            // Append the timeline item to the outer div
            postDiv.append(timelineItem);

            // Append the post to the container
            container.append(postDiv);
        });
    }

</script>
</body>
</html>
