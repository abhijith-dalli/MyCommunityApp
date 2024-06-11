<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name
    ="viewport" content="width=device-width, initial-scale=1.0">
    <title>My community app</title>

    <link rel="stylesheet" type="text/css" href="../styles/bootstrap.css"> 
    <link rel="stylesheet" type="text/css" href="../styles/stylesforsecurity.css"> 
    <link rel="stylesheet" href="../javascripts/jqueryui/jquery-ui.css">
    <link rel="stylesheet" href="../javascripts/jqueryui/jquery-ui.structure.css">
    <link rel="stylesheet" href="../javascripts/jqueryui/jquery-ui.theme.css">
    <link rel="stylesheet" type="text/css" href="../styles/timepicker.css"> 
    <link rel="stylesheet" type="text/css" href="../styles/ownerPage.css">
    
    <script type="text/javascript" src="../javascripts/bootstrap.js"></script> 
    <script type="text/javascript" src="../javascripts/jquery.js"></script>
    <script type="text/javascript" src="../javascripts/jqueryui/jquery-ui.js"></script>
    <script type="text/javascript" src="../javascripts/timepicker.js"></script>
    <script type="text/javascript" src="../javascripts/event.js"></script>
    <script type="text/javascript" src="../javascripts/fontAwesome.js"></script>
</head>
<cfif session.utype eq "owner">
    <cfinclude template="ownernavbar.cfm">
<cfelse>
    <cfinclude template="navbar.cfm">
</cfif>
<body>
    <!--- add event section --->
    <div class="bodyContainer">
        <div class="row justify-content-center" id="row">
        <div class="col-10 col-md-6 col-sm-8 col-lr-2"> 
            <div class="content">
            <div class="container  py-3 my-5" id="container">
                <div class="container my-3">
                    <p id="heading">CREATE NEW EVENT</p>
                </div>
                <form >
                <div class="mb-3" id="eachInput">
                    <label for="eflat" class="form-label">Flat No:</label>
                    <input type="number" class="form-control" id="eflat" placeholder="Enter Flat Number" 
                    value="<cfoutput>#session.flat#</cfoutput>" disabled>
                </div>
                <div class="mb-3" id="eachInput">
                    <label for="ename" class="form-label">Event Name:</label>
                    <input type="text" class="form-control" id="ename" placeholder="Enter the event Name">
                    <div class="px-2">
                        <small id="enameerror" class="text-danger">Please enter event name.</small> 
                    </div>
                </div>
                <div class="mb-3" id="eachInput">
                   <label>Upload Image :
                        <input name="image" type="file"  id="image" accept="image/png, image/gif, image/jpeg"> 
                   </label>
                   <input type="button" id="imgupload" value="Upload">
                   <div id="imgDisplayArea"></div>
                   <div class="px-2">
                        <small id="imageerror" class="text-danger">You need to upload the picture of the event.
                        </small> 
                    </div>
                </div>
                <div class="mb-3" id="eachInput">
                    <label for="uname" class="form-label">Organizer Name:</label>
                    <input type="text" class="form-control" id="uname" placeholder="Enter Organizer's Name">
                    <div class="px-2">
                        <small id="unameerror" class="text-danger">Please enter Organizer name.</small> 
                    </div>
                </div>
                <div class="mb-3" id="eachInput">
                    <label for="edate" class="form-label">Date of event:</label>
                    <input type="text" class="form-control" id="edate" placeholder="Select Date">
                    <div class="px-2">
                        <small id="edateerror" class="text-danger">Please select the date.</small> 
                    </div>
                </div> 
                <div class="mb-3" id="eachInput">
                    <label for="etime" class="form-label">Time of event:</label>
                    <input type="text" class="form-control" id="etime" placeholder="Select Time">
                    <div class="px-2">
                        <small id="etimeerror" class="text-danger">Please select the time.</small> 
                    </div>
                </div>
                <div class="mb-3" id="eachInput">
                    <label for="elocation" class="form-label">Location:</label>
                    <input type="text" class="form-control" id="elocation" placeholder="Enter the location">
                    <div class="px-2">
                        <small id="elocationerror" class="text-danger">Please enter the location of event.</small> 
                    </div>
                </div>
                <div class="mb-3" id="eachInput">
                    <label for="edescription" class="form-label">Description:</label>
                    <textarea class="form-control" id="edescription" placeholder="Enter the occasion.." rows="3"></textarea>
                    <div class="px-2">
                        <small id="edescerror" class="text-danger">Give some description for the event.</small> 
                    </div>
                </div>  
             </form>
                <button type="button" id="submitbtn" class="btn btn-success">Upload</button>
            </div>
        </div>
        </div>   
    </div>
</div>

<!--- to show the previously uploaded events --->
<div class="container mt-1">
    <h1>Uploaded Events</h1>
</div>
<div class="container">
    <div class="row mt-n5 justify-content-center" id="insertDiv">
    <!--  query to get the events uploaded by this user --->
    <cfquery name="getEventsByUser" datasource="management">
        select * from management.events as eve join management.users as usr on eve.userid=usr.uid join management.apartments as apt on usr.aptid=apt.aid where userid=<cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#">;
    </cfquery>

    <!--- to show events if there are events uploaded by user --->
    <cfif getEventsByUser.recordcount gt 0>
        <cfloop query="getEventsByUser">
        <div class="col-md-4 col-lg-4 col-sm-6 mt-4">
            <div class="blog-grid">
                <div class="blog-grid-text p-4">
                    <h3 class="mb-3">
                        <cfoutput>#getEventsByUser.ename#</cfoutput>
                    </h3>
                    <p class="display-50"><cfoutput>#getEventsByUser.description#</cfoutput></p>
                    <div class="meta meta-style">
                        <ul>
                            <li><i class="fas fa-calendar-alt"></i>  <cfoutput>#getEventsByUser.edate#</cfoutput>, <cfoutput>#getEventsByUser.etime#</cfoutput></li>
                            <li><i class="fas fa-user"></i><cfoutput>#getEventsByUser.uname#</cfoutput></li>
                            <li><i class="fa-solid fa-building"></i><cfoutput>#getEventsByUser.flat#</cfoutput> </li>
                            <li><i class="fa-solid fa-location-dot"></i><cfoutput>#getEventsByUser.elocation#</cfoutput></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        </cfloop>
    <!--- to display message if user didnt upload any events till present --->
    <cfelse>
        <div class="col-md-4 col-lg-4 col-sm-6 mt-4">
            <div class="blog-grid">
                <div class="blog-grid-text p-4">
                    <h3 class="mb-3">No Events uploaded</h3>
                    <p class="display-50">There are no events you've posted. You need to upload some post for it to appear here.</p>
                    <div class="meta meta-style">
                        <ul>
                            <li><i class="fas fa-calendar-alt"></i>  Date,Time</li>
                            <li><i class="fas fa-user"></i>User</li>
                            <li><i class="fa-solid fa-building"></i>Flat No. </li>
                            <li><i class="fa-solid fa-location-dot"></i>Location</li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </cfif>
    </div>
</div>
</body>
</html>