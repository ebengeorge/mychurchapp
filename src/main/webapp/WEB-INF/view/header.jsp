<!-- Main navigation bar using Bootstrap classes for styling -->
<nav class="main-header navbar navbar-expand navbar-white navbar-light">
  <!-- Container for right-aligned navbar items -->
  <ul class="navbar-nav ml-auto">

    <!-- Dropdown menu for User Account -->
    <li class="nav-item dropdown">
      <!-- Link that triggers the user account dropdown -->
      <a class="nav-link" data-toggle="dropdown" href="#">
        <!-- Icon representing user account -->
        <i class="far fa-user"></i>
      </a>
      <!-- Dropdown menu container for user account details and actions -->
      <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
        <!-- Header section containing user information -->
        <span class="dropdown-item dropdown-header">
          <div class="media">
            <!-- Container for user info text -->
            <div class="media-body">
              <!-- User login status -->
              <p class="text-sm">Logged In</p>
              <!-- Display the user's name from the session scope -->
              <h3 class="dropdown-item-title">
                ${sessionScope.userName}
              </h3>
              <!-- Display the user's role (capitalized) and organization -->
              <p class="text-sm text-muted">
                <span style="text-transform: capitalize"> ${role}</span> |  ${sessionScope.orgName}
              </p>
            </div>
          </div>
        </span>
        <!-- Divider -->
        <div class="dropdown-divider"></div>
        <!-- Logout link that triggers a logout function -->
        <a href="#" class="dropdown-item dropdown-footer" onclick="submitLogout()">Logout</a>
        <!-- Hidden form for processing logout, submitted via JavaScript -->
        <form id="logoutform" action="logout" method="POST">
          <!-- Hidden input holding the user's ID -->
          <input type="hidden" id="userId" name="userId" value='${sessionScope.userId}'>
        </form>
      </div>
    </li>
  </ul>
  <!-- Hidden input storing user's team data from session -->
  <input type="hidden" value='${sessionScope.teams}' id="user-teams">
</nav>
<!-- End of main navigation bar -->

<!-- Modal for displaying a confirmation dialog -->
<div class="modal fade" id="confirmationBox">
  <div class="modal-dialog">
    <div class="modal-content">
      <!-- Modal header with title and close button -->
      <div class="modal-header">
        <h4 class="modal-title">Confirmation</h4>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <!-- Modal body containing the confirmation message -->
      <div class="modal-body">
        <p>Do you want to proceed?</p>
      </div>
      <!-- Modal footer with action buttons for 'No' and 'Yes' -->
      <div class="modal-footer justify-content-between">
        <!-- Button to cancel and close the modal -->
        <button type="button" class="btn btn-default" data-dismiss="modal">No</button>
        <!-- Button to confirm the action -->
        <button type="button" class="btn btn-primary" id="confirmationYes">Yes</button>
      </div>
    </div>
  </div>
</div>
