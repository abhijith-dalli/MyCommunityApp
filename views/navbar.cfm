<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My community app</title>
    <link rel="stylesheet" type="text/css" href="../styles/navbarstyles.css">
     
    <script src="../javascripts/ownernavbar.js"></script>
</head>
<body>
  <!--- nav bar for security page --->
  <!--- this code will be later included inside the security pages --->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
  <div class="container-fluid pt-2">
    <img src="../media/logo.jpg" alt="Logo not available" width="70" height="50" id="logo">
      <h2 class="navbar-brand" style="text-transform: uppercase;">
        <cfoutput>#session.aptname#</cfoutput> ( <cfoutput>#session.utype#</cfoutput> )
      </h2>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span></button>
    <div class="collapse navbar-collapse justify-content-end" id="navbarNav">
      <ul class="navbar-nav ">
        <div class="px-5 pb-1" id="home">
          <li class="nav-item">
            <a class="nav-link active" href="homePage.cfm">Home <span class="notification_badge"></span></a>
          </li>
        </div>
        <div class="px-5 pb-1">
          <li class="nav-item">
            <a class="nav-link active" href="securityPage.cfm">New visitor</a>
          </li>
        </div>
        <div class="px-5 pb-1">
          <li class="nav-item">
            <a class="nav-link active"  href="viewVisitorsPage.cfm">View visitors</a>
          </li>
        </div>
        <div class="px-5 pb-1">
          <li class="nav-item dropdown">
              <a class="nav-link dropdown-toggle active" href="#" id="navbarDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">Action</a>
              <ul class="dropdown-menu">
                <li><a class="dropdown-item" href="addEventPage.cfm">Upload event</a></li>
                <li><a class="dropdown-item" href="addServicesPage.cfm">Upload review</a></li>
                <li><a class="dropdown-item" href="editProfilePage.cfm">Edit Profile</a></li>
              </ul>
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

