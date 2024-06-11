<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name
    ="viewport" content="width=device-width, initial-scale=1.0">
    <title>My community app</title>
    <link rel="stylesheet" type="text/css" href="../styles/bootstrap.css"> 
    <link rel="stylesheet" type="text/css" href="../styles/stylesforsecurity.css"> 
    
    <script type="text/javascript" src="../javascripts/bootstrap.js"></script> 
    <script type="text/javascript" src="../javascripts/jquery.js"></script>
    <script type="text/javascript" src="../javascripts/admin.js"></script>
</head>
<cfinclude template="adminnavbar.cfm">
<body>
    <!--- query to get all the locations registered --->
    <cfquery name="getLocation" datasource="management">
        select * from management.locations;
    </cfquery>

    <!--- apartment registration section --->
    <div class="bodyContainer">
        <div class="row justify-content-center" id="row">
        <div class="col-10 col-md-6 col-sm-8 col-lr-2"> 
            <div class="content">
            <div class="container  py-3 my-5" id="container">
                <div class="container my-3">
                    <p id="heading">REGISTER A NEW APARTMENT</p>
                </div>
                
                <!--- button to add new area --->
                <button id="areamodalbtn" type="button" class="btn btn-secondary" data-bs-toggle="modal" data-bs-target="#addareamodal">Add Location</button>
                <form >
                <div class="mb-3" id="eachInput">
                    <label for="location" class="form-label">Location:</label>
                    <select class="form-select " id="location" >
                         <option selected value="0" style="color:grey;">Choose a Location</option>
                         <cfloop query="getLocation">
                            <option value="<cfoutput>#getLocation.lid#</cfoutput>"><cfoutput>#getLocation.locality#</cfoutput></option>
                         </cfloop>
                    </select>
                    <div class="px-2">
                        <small id="locationerror" class="text-danger">You need to select a location.</small>
                    </div>
                </div>

                <div class="mb-3" id="eachInput">
                    <label for="aptname" class="form-label">Apartment Name:</label>
                    <input type="text" class="form-control" id="aptname" placeholder="Enter the name of apartment.">
                    <div class="px-2">
                        <small id="aptnameerror" class="text-danger">Please enter the name of the apartment.</small> 
                    </div>
                </div>
                <div class="mb-3" id="eachInput">
                    <label for="guardfname" class="form-label"> Manager First Name:</label>
                    <input type="text" class="form-control" id="guardfname" placeholder="Enter the first name.">
                    <div class="px-2">
                        <small id="guardfnameerror" class="text-danger">Please enter the first name.</small> 
                    </div>
                </div>
                <div class="mb-3" id="eachInput">
                    <label for="guardlname" class="form-label">Lastname:</label>
                    <input type="text" class="form-control" id="guardlname" placeholder="Enter the last name.">
                    <div class="px-2">
                        <small id="guardlnameerror" class="text-danger">PLease enter the security last name.</small> 
                    </div>
                </div>
                <div class="mb-3" id="eachInput">
                    <label for="gphone" class="form-label">Phone number:</label>
                    <input type="phone" class="form-control" id="gphone" placeholder="Enter the contact number.">
                    <div class="px-2">
                        <small id="gphoneerror1" class="text-danger">Please enter the phone number.</small> 
                        <small id="gphoneerror2" class="text-danger">Invalid phone number.</small>
                    </div>
                </div>  
                <div class="mb-3" id="eachInput">
                    <label for="gemail" class="form-label">Email-ID:</label>
                    <input type="email" class="form-control" id="gemail" placeholder="Enter the mail id.">
                    <div class="px-2">
                        <small id="gemailerror1" class="text-danger">Please enter a valid mail id.</small> 
                        <small id="gemailerror2" class="text-danger">This email already exists in the Database.</small>
                    </div>
                </div>
                <div class="mb-3" id="eachInput">
                    <label for="gpswd" class="form-label">Password:</label>
                    <input type="password" class="form-control" id="gpswd" placeholder="Enter the password.">
                    <div class="px-2">
                        <small id="gpswderror1" class="text-danger">Please enter the password.</small> 
                        <small id="gpswderror2" class="text-danger">Password must have a special character, a capital letter, a number and 6-20 in length.</small> 
                    </div>
                </div>   
                <div class="mb-2" id="eachInput">
                    <label for="gcpswd" class="form-label">Confirm passcode:</label>
                    <input type="password" class="form-control" id="gcpswd" placeholder="Enter the passcode again.">
                    <div class="px-2">
                        <small id="gcpswderror" class="text-danger">Password doesn't match.</small> 
                    </div>
                </div> 
             </form>
                <button type="button" id="addbtn" class="btn btn-danger">Create</button> 
            </div>
        </div>
        </div>   
    </div>
</div>

<!-- Modal to add new area -->
<div class="modal fade" id="addareamodal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="addareamodalLabel">Wanna add new area?</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close" id="close"></button>
      </div>
      <div class="modal-body">
            <form >
                <div  id="eachInput">
                    <label for="areaname" class="form-label">Area Name:</label>
                    <input type="text" class="form-control" id="areaname" placeholder="Enter the area name.">
                    <div class="px-2">
                        <small id="areanameerror1" class="text-danger">Please enter new area you want to create.</small>
                        <small id="areanameerror2" class="text-danger">Area already exists in the site.</small>
                    </div>
                </div>
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal" id="close">Close</button>
        <button type="button" class="btn btn-primary" id="addareabtn">Add</button>
      </div>
    </div>
  </div>
</div>


</body>
</html>
