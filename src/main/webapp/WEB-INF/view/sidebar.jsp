<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">

  <!-- Brand Logo: The organization's logo and name -->
  <a href="/cms/" class="brand-link">
    <!-- Dynamically load the organization's logo from the database -->
    <img data-imgUrl="${sessionScope.orgLogo}" alt="Organization Logo" id="orglogo" class="brand-image img-circle elevation-3" style="opacity: .8">
    <!-- Display the organization's name (if you wish, otherwise you can hardcode or use another dynamic value) -->
    <span class="brand-text font-weight-light">${sessionScope.orgName}</span>
  </a>

  <!-- Sidebar Container Profile Pic-->
  <div class="sidebar">

    <!-- Sidebar user panel (optional): Shows the user's image and name -->
    <div class="user-panel mt-3 pb-3 mb-3 d-flex align-items-center justify-content-center">
      <!-- Container for the user's information -->
      <div class="info">
        <!-- Username as a clickable link -->
        <a href="#" class="d-block"><strong>${sessionScope.userName}</strong></a>
      </div>
    </div>

    <!-- Sidebar Menu -->
    <nav class="mt-2">
      <!-- Unordered list representing the sidebar menu items with treeview behavior -->
      <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false" id="userMenu">

        <!-- Navigation Header for Examples -->
        <li class="nav-header">DASHBOARD</li>

        <!-- Calendar Menu Item -->
        </li>
        <li class="nav-item">
          <a href="/cms/timeline" class="nav-link">
            <i class="far fa-circle nav-icon"></i>
            <p>Timeline</p>
          </a>
        </li>
        <li class="nav-item">
          <a href="/cms/calendar" class="nav-link">
            <i class="nav-icon far fa-calendar-alt"></i>
            <p>Calendar</p>
          </a>
        </li>
        <li class="nav-item">
          <a href="/cms/users" class="nav-link">
            <i class="far fa-circle nav-icon"></i>
            <p>User Management</p>
          </a>
        </li>
        <li class="nav-item">
          <a href="/cms/teams" class="nav-link">
            <i class="nav-icon far fa-calendar-alt"></i>
            <p>
              Team Management
            </p>
          </a>
        </li>
      </ul>
    </nav>
    <!-- End of Sidebar Menu -->
  </div>
  <!-- End of Sidebar Container -->
</aside>
