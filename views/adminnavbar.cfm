<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My community app</title>
    <link rel="stylesheet" href="../styles/navbarstyles.css" />
    
    <script src="../javascripts/admin.js"></script>
</head>
<body>
  <!--- navigation bar for the admin  --->
  <!--- this code will be included inside admin pages --->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid  pt-2">
      <img src="../media/logo.jpg" alt="Logo not available" width="70" height="50" id="logo">
    <h2 class="navbar-brand" >Welcome 
      <cfoutput>#session.uname#</cfoutput> <cfoutput>#session.lname#</cfoutput>  (ADMIN)
    </h2>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span></button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav ">
        <div class="px-5 pb-1">
          <li class="nav-item">
            <a class="nav-link active" href="adminPage.cfm">Register</a>
         </li>
        </div>

        <div class="px-5 pb-1">
          <li class="nav-item">
           <a class="nav-link active" href="adminViewPage.cfm">View</a>
         </li>
        </div>

        <div class="px-5 pb-1">
          <li class="nav-item">
            <a class="nav-link active" href="viewIssuesPage.cfm">Issues</a> 
         </li>
        </div>

        <div class="px-5 py-1 pb-1">
          <li class="nav-item">
           <button type="button" class="btn btn-outline-danger" id="logoutbtn">Logout</button>
         </li>
        </div>
      </ul>
    </div >
  </div>
</nav>
</body>
</html>