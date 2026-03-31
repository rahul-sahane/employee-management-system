<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html class="dark" lang="en">

  <head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Luminous Executive | Smart Employee Management</title>
    <meta name="description" content="Premium employee management dashboard with real-time CRUD operations" />
    <link rel="stylesheet" href="styles.css" />
  </head>

  <body>
    <!-- Toast Container -->
    <div id="toast-container" class="toast-container"></div>

    <!-- Sidebar -->
    <aside class="sidebar">
      <div class="sidebar-brand">
        <div class="brand-icon"><span class="material-symbols-outlined"
            style="font-variation-settings:'FILL' 1">diamond</span></div>
        <div class="brand-text">
          <h1>Luminous</h1>
          <p>Executive Suite</p>
        </div>
      </div>
      <nav>
        <a class="nav-item active" data-route="dashboard" href="#/dashboard">
          <span class="material-symbols-outlined">dashboard</span> Dashboard</a>
        <a class="nav-item" data-route="employees" href="#/employees">
          <span class="material-symbols-outlined">group</span> Employees</a>
        <a class="nav-item" data-route="add-employee" href="#/add-employee">
          <span class="material-symbols-outlined">person_add</span> Add Employee</a>
        <a class="nav-item" data-route="delete-employee" href="#/delete-employee">
          <span class="material-symbols-outlined">person_remove</span> Delete Employee</a>
        <a class="nav-item" data-route="update-employee" href="#/update-employee">
          <span class="material-symbols-outlined">person_edit</span> Update Employee</a>
        <a class="nav-item" data-route="search" href="#/search">
          <span class="material-symbols-outlined">search</span> Search</a>
      </nav>
      <div class="sidebar-footer">
        <div style="display:flex;flex-direction:column;gap:4px;margin-bottom:1rem">
          <a class="nav-item" data-route="settings" href="#/settings">
            <span class="material-symbols-outlined">settings</span> Settings</a>
          <a class="nav-item" data-route="logout" href="#/logout">
            <span class="material-symbols-outlined">logout</span> Logout</a>
        </div>
        <button class="btn btn-primary" style="width:100%;justify-content:center"
          onclick="toast('Support chat coming soon!','info')">Support</button>
      </div>
    </aside>

    <!-- Main Content -->
    <div class="main-content">
      <!-- Top Bar -->
      <header class="topbar">
        <div class="topbar-left">
          <span class="title">Luminous Executive</span>
          <span class="badge-pro">PRO</span>
        </div>
        <div class="topbar-right">
          <div
            style="display:flex;align-items:center;gap:16px;border-right:1px solid rgba(255,255,255,0.1);padding-right:24px">
            <button class="topbar-btn" title="Notifications" onclick="toast('No new notifications','info')">
              <span class="material-symbols-outlined">notifications</span></button>
            <button class="topbar-btn" title="Theme">
              <span class="material-symbols-outlined" style="font-variation-settings:'FILL' 1">dark_mode</span></button>
          </div>
          <div class="user-info" onclick="navigate('settings')">
            <div class="details">
              <p>Mr. Rahul</p>
              <p>Chief Administrator</p>
            </div>
            <div class="user-avatar"><span class="material-symbols-outlined">person</span></div>
          </div>
        </div>
      </header>

      <!-- Page Views -->
      <div class="page-container">
        <div id="view-dashboard" class="view active"></div>
        <div id="view-employees" class="view"></div>
        <div id="view-add-employee" class="view"></div>
        <div id="view-delete-employee" class="view"></div>
        <div id="view-update-employee" class="view"></div>
        <div id="view-search" class="view"></div>
        <div id="view-settings" class="view"></div>
        <div id="view-logout" class="view"></div>
      </div>
    </div>

    <!-- Background Decorations -->
    <div
      style="position:fixed;top:-10%;right:-10%;width:40%;height:40%;background:rgba(143,245,255,0.04);filter:blur(120px);border-radius:50%;z-index:-1">
    </div>
    <div
      style="position:fixed;bottom:-10%;left:-10%;width:30%;height:30%;background:rgba(172,137,255,0.04);filter:blur(100px);border-radius:50%;z-index:-1">
    </div>

    <%-- Backend Toast: Servlet sets session attributes, JSP reads and shows them --%>
      <script>
  <% String msg = (String) session.getAttribute("toastMessage");
     String type = (String) session.getAttribute("toastType");
        session.removeAttribute("toastMessage");
        session.removeAttribute("toastType"); %>
  <% if (msg != null) { %>
          window.addEventListener('DOMContentLoaded', function () { toast("<%= msg %>", "<%= type %>"); });
  <% } %>
      </script>

      <script src="app.js"></script>
  </body>

  </html>