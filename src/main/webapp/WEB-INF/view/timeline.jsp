<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title> Ministry Web | Timeline</title>

    <!-- Google Font: Source Sans Pro -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
    <!-- Font Awesome -->
    <link rel="stylesheet" href="/cms/plugins/fontawesome-free/css/all.min.css">
    <!-- AdminLTE CSS -->
    <link rel="stylesheet" href="/cms/dist/css/adminlte.min.css">
    <style>
        .user-initial {
            width: 30px;  /* Adjust the size of the circle */
            height: 30px;  /* Adjust the size of the circle */
            background-color: #007bff;  /* Background color for the circle */
            color: white;  /* Text color inside the circle */
            display: flex;
            justify-content: center;  /* Horizontally center the text */
            align-items: center;  /* Vertically center the text */
            border-radius: 50%;  /* Makes it circular */
            font-size: 18px;  /* Font size for the letter */
            font-weight: bold;
        }
        
   
       /* Style the button */
        .upvoteBtn {
            display: inline-block; /* Make sure the button behaves like an inline element */
            color: #999 !important; /* Default icon and text color */
            transition: all 0.3s ease; /* Smooth transition */
            cursor: pointer; /* Indicate that it's clickable */
        }

        /* Style for the icon inside the button */
        .upvoteBtn i {
            color: #999; /* Default icon color */
            transition: all 0.3s ease; /* Smooth transition for color and border changes */
            font-weight: 100 !important;
        }

        /* Change icon and border color when upvoted (active) */
        .upvoteBtn.active i {
            color: #28a745; /* Red color for active state */
            border-color: #28a745; /* Red border for the icon */
            font-weight: 900 !important;
        }

        /* Hover effect for the button */
        .upvoteBtn:hover {
            color: #28a745; /* Change text color on hover */
        }

        /* Hover effect for the icon */
        .upvoteBtn:hover i {
            color: #28a745; /* Change icon color on hover */
            font-weight: 900 !important;
        }

        .downvoteBtn {
            display: inline-block; /* Make sure the button behaves like an inline element */
            color: #999 !important; /* Default icon and text color */
            transition: all 0.3s ease; /* Smooth transition */
            cursor: pointer; /* Indicate that it's clickable */
       }

        /* Style for the icon inside the button */
        .downvoteBtn i {
            color: #999; /* Default icon color */
            transition: all 0.3s ease; /* Smooth transition for color and border changes */
            font-weight: 100 !important;
        }

        /* Change icon and border color when upvoted (active) */
        .downvoteBtn.active i {
            color: #dc3545; /* Red color for active state */
            border-color: #dc3545; /* Red border for the icon */
            font-weight: 900 !important;
        }

        /* Hover effect for the button */
        .downvoteBtn:hover {
            color: #dc3545; /* Change text color on hover */
        }

        /* Hover effect for the icon */
        .downvoteBtn:hover i {
            color: #dc3545; /* Change icon color on hover */
            font-weight: 900 !important;
        }

        .cmnt-btn {
            display: inline-block; /* Make sure the button behaves like an inline element */
            color: #999 !important; /* Default icon and text color */
            transition: all 0.3s ease; /* Smooth transition */
            cursor: pointer; /* Indicate that it's clickable */
        }

        /* Style for the icon inside the button */
        .cmnt-btn i {
            font-weight: 100 !important; 
            color: #999; /* Default icon color */
            transition: all 0.3s ease; /* Smooth transition for color and border changes */
            font-weight: 100 !important;
        }

        /* Hover effect for the button */
        .cmnt-btn:hover {
            color: #007bff; /* Change text color on hover */
            
        }

        /* Hover effect for the icon */
        .cmnt-btn:hover i {
            color: #007bff; /* Change icon color on hover */
            font-weight: 900 !important;
        }
    </style>
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
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#createPostModal" id="create-post">
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
                            </select>
                            <input type="hidden" name="author.id" value='${sessionScope.userId}'>
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

    <div class="modal fade" id="commentsModal" tabindex="-1" role="dialog" aria-labelledby="commentsModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="commentsModalLabel">Comments for Post</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <!-- Comments List -->
                    <div id="commentsList" class="card-comments card-body">
                        <!-- Dynamic content will be injected here -->
                    </div>
                    <div class="card-footer">
                        <form action="#" method="post" id="commentform">
                          <div class="input-group">
                            <input type="hidden" name="post.id" id="cmntPostId">
                            <input type="hidden" name="user.id" id="cmntUsrId"  value='${sessionScope.userId}'>
                            <input type="text" name="content" id="cmntContent" placeholder="Comment here ..." class="form-control">
                            <span class="input-group-append">
                              <button type="submit" id="sbtComment" class="btn btn-primary">Comment</button>
                            </span>
                          </div>
                        </form>
                      </div>
                </div>
            </div>
        </div>
    </div>

    <footer class="main-footer">
        <div class="float-right d-none d-sm-block">
            <b>Version</b> 3.2.0
        </div>
        <a href="https://adminlte.io"></a>
    </footer>

    <!-- Control Sidebar -->
    <aside class="control-sidebar control-sidebar-dark">
        <!-- Control sidebar content goes here -->
    </aside>
    <!-- /.control-sidebar -->
</div>
<!-- ./wrapper -->

<!-- jQuery -->
<script src="/cms/plugins/jquery/jquery.min.js"></script>
<!-- Bootstrap 4 -->
<script src="/cms/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
<!-- AdminLTE App -->
<script src="/cms/dist/js/adminlte.min.js"></script>
<!-- AdminLTE for demo purposes -->
<script src="/cms/dist/js/demo.js"></script>
<script src="/cms/app.js"></script>
<script>
var teamData = $('#user-teams').val();
var teams = JSON.parse(teamData);

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

    function saveReaction(postId, reaction) {
        var dataObj = {};
        dataObj.reactionType = reaction;
        dataObj.post =  {id:postId};
        dataObj.user = {id:$('#userId').val()};
        $.ajax({
                url: '/cms/api/reaction/save', 
                type: 'POST',
                data:  JSON.stringify(dataObj),
                dataType : 'json',
                contentType: 'application/json',
                success: function(response) {
                                    
                },
                error: function() {
                    $(document).Toasts('create', {
                                class: 'bg-danger',
                                title: 'Error',
                                body: 'Error saving reaction',
                                autohide: true,
                                delay: 1500
                            });
                }
        });
    }

    
    function removeReaction(postId, reaction) {
        var dataObj = {};
        dataObj.reactionType = reaction;
        dataObj.post =  {id:postId};
        dataObj.user = {id:$('#userId').val()};
        $.ajax({
                url: '/cms/api/reaction/delete',
                type: 'DELETE',
                data:  JSON.stringify(dataObj),
                dataType : 'json',
                contentType: 'application/json',
                success: function(response) {
                                    
                },
                error: function() {
                    $(document).Toasts('create', {
                                class: 'bg-danger',
                                title: 'Error',
                                body: 'Error removing reaction',
                                autohide: true,
                                delay: 1500
                            });
                }
        });
    }
    function loadPosts(groups){
        $.ajax({
            url: '/cms/api/post/timeline',  // URL to your API endpoint
            type: 'POST',
            dataType: 'json',
            data: JSON.stringify(groups),
            contentType: 'application/json',
            async: 'false',
            success: function(posts) {
                renderTimelinePosts(posts);
            },
            error: function(xhr, status, error) {
                $(document).Toasts('create', {
                                class: 'bg-danger',
                                title: 'Error',
                                body: 'Error fetching posts',
                                autohide: true,
                                delay: 1500
                            });
                console.error("Error fetching posts:", error);
            }
        });
    }


    $(document).ready(function() {
        var groups = [];
      
        $.each(teams, function(teamId, teamName) {
            groups.push(parseInt(teamId));
        });

        $.each(teams, function(teamId, teamName) {
            $('#modalPostTo').append( $('<option></option>').val(teamId).text(teamName));
        });

        loadPosts(groups);

        $(document).on('click', '.cmnt-btn', function(e) {
                e.preventDefault();
                const postId = $(this).data('id');  // Get the post ID from button data attribute
                loadComments(postId);  // Load comments for the selected post
        });

        // $(document).on('click', '.downvoteBtn', function(e) {
        //     const postId = $(this).data('id'); 
        //     saveReaction(postId, 'N');
        //     $(this).toggleClass('active'); 
        // });

        $(document).on('click', '.downvoteBtn', function(e) {
            const postId = $(this).data('id'); 
            if ($(this).hasClass('active')) {
                $(this).removeClass('active'); 
                removeReaction(postId, 'N');
            } else {
                var  upvoteBtn = $('.upvoteBtn[data-id="' + postId + '"]');
                if ($(upvoteBtn).hasClass('active')) {
                    (upvoteBtn).removeClass('active');
                    removeReaction(postId, 'Y');
                }
                saveReaction(postId, 'N');
                $(this).addClass('active'); 
            }
        });

        // $(document).on('click', '.upvoteBtn', function(e) {
        //     const postId = $(this).data('id'); 
        //     saveReaction(postId, 'Y');
        //     $(this).toggleClass('active'); 
        // });

        $(document).on('click', '.upvoteBtn', function(e) {
            const postId = $(this).data('id'); 
            if ($(this).hasClass('active')) {
                $(this).removeClass('active'); 
                removeReaction(postId, 'Y');
            } else {
                var  downvoteBtn = $('.downvoteBtn[data-id="' + postId + '"]');
                if ($(downvoteBtn).hasClass('active')) {
                    (downvoteBtn).removeClass('active');
                    removeReaction(postId, 'N');
                }
                saveReaction(postId, 'Y');
                $(this).addClass('active'); 
            }
        });

       

        // Attach a submit handler to the form in the modal
        $("#createPostModal form").submit(function(e) {
            e.preventDefault(); // Prevent the default form submission
            var form = $(this);
            $.ajax({
                url: "/cms/api/post/save", // Use the form's action URL
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
                        body: 'Posted Successfully',
                        autohide: true,
                        delay: 1500
                    });
                    loadPosts(groups);
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    $(document).Toasts('create', {
                                class: 'bg-danger',
                                title: 'Error',
                                body: 'Error saving post',
                                autohide: true,
                                delay: 1500
                            });
                    console.error("Error submitting form:", textStatus, errorThrown);
                }
            });
        });


        $('#sbtComment').click(function(e) {
            e.preventDefault();
                $.ajax({
                        type: "POST",
                        url: "/cms/api/comment/save",  
                        data: convertToJson("commentform"),  
                        dataType: 'json',
                        contentType: 'application/json',
                        success: function(data) {
                            $('#modal-xl').modal('hide');
                            $(document).Toasts('create', {
                                class: 'bg-success',
                                title: 'Success',
                                body: 'Comment saved Successfully',
                                autohide: true,
                                delay: 1500
                            });
                            $('#cmntContent').val("");
                            loadComments($('#cmntPostId').val());
                        },
                        error: function(xhr, status, error) {
                            // Show an error toast in case of failure
                            $(document).Toasts('create', {
                                class: 'bg-danger',
                                title: 'Error',
                                body: 'Error saving comment',
                                autohide: true,
                                delay: 1500
                            });
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

            // var upvoteBtn = $('<a></a>')
            //     .addClass('btn upvoteBtn')
            //     .attr('data-id', post.id)
            //     .append(post.cupvote + "&nbsp;&nbsp;")
            //     .append($('<i></i>').addClass('fa fa-thumbs-up'));
            // if(post.upvoted) {
            //     upvoteBtn.addClass('active')
            // }

            // Assuming post.id, post.cupvote, and post.upvoted are defined
            var upvoteBtn = $('<a></a>')
                .addClass('btn upvoteBtn')
                .attr('data-id', post.id);

            var countSpan = $('<span></span>')
                .addClass('count')
                .text(post.cupvote);

            upvoteBtn
                .append(countSpan)         // add the count span
                .append("&nbsp;&nbsp;")     // add two non-breaking spaces
                .append($('<i></i>').addClass('fa fa-thumbs-up')); // add the icon

            if (post.upvoted) {
                upvoteBtn.addClass('active');
            }


            // Assuming post.id, post.cdownvote, and post.downvoted are defined
            var downvoteBtn = $('<a></a>')
                .addClass('btn downvoteBtn')
                .attr('data-id', post.id);

            var countSpan = $('<span></span>')
                .addClass('count')
                .text(post.cdownvote);  // for example, -1

            downvoteBtn
                .append(countSpan)         // add the count span
                .append("&nbsp;&nbsp;")     // add two non-breaking spaces
                .append($('<i></i>').addClass('fa fa-thumbs-down')); // add the icon

            if (post.downvoted) {
                downvoteBtn.addClass('active');
            }


            var commentBtn = $('<a></a>')
                .addClass('btn cmnt-btn float-right')
                .attr('data-id', post.id)
                .append(post.ccomment + "&nbsp;&nbsp;")
                .append($('<i></i>').addClass('fa fa-comment'));

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

            function loadComments(postId) {
                const apiUrl = `/cms/api/post/comments/`+postId;
                $.ajax({
                    url: apiUrl,
                    method: 'GET',
                    success: function(comments) {
                        $('#cmntPostId').val(postId);
                        generateComments(comments);  // Call function to generate HTML for comments
                        $('#commentsModal').modal('show');  // Show the modal
                    },
                    error: function() {
                        alert('Failed to load comments.');
                    }
                });
            }

            // Function to generate comments dynamically in HTML
            function generateComments(comments) {
                // Empty the comments container
                $('#commentsList').empty();
                if(comments.length == 0) {
                    $('#commentsList').append('<div class="alert alert-light">No comments on this post yet.</div>');
                } else {
                    comments.forEach(function(comment) {
                        const userInitial = comment.user.username.charAt(0).toUpperCase();  // Get the first letter of the user's name
                        var html = '<div class="card-comment">';
                        html += '<!-- User initial inside a circle -->';
                        html += '<div class="user-initial img-circle img-sm">' + (userInitial) + '</div>';
                        html += '<div class="comment-text">';
                        html += '<span class="username">' + comment.user.username;
                        html += '<span class="text-muted float-right">' + timeAgo(comment.createdAt) + '</span>';
                        html += '</span><!-- /.username -->';
                        html += '<p>' + comment.content + '</p>';
                        html += '</div><!-- /.comment-text -->';
                        html += '</div><!-- /.card-comment -->';
                        $('#commentsList').append(html);
                    });
                }   
            }

</script>
</body>
</html>
