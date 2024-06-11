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
    <script type="text/javascript" src="../javascripts/editprofile.js"></script>


</head>
<cfif session.utype eq "owner">
    <cfinclude template="ownernavbar.cfm">
<cfelse>
    <cfinclude template="navbar.cfm">
</cfif>
<body>
    <!--- section to show user details --->
    <div class="bodyContainer">
        <div class="row justify-content-center" id="row">
        <div class="col-10 col-md-6 col-sm-8 col-lr-2"> 
            <div class="content">
            <div class="container  py-3 my-5" id="container">
                <div class="container my-3">
                    <p id="heading"> USER PROFILE </p>
                </div>
                <form >
                <div class="mb-1" id="eachInput">
                    <label for="eflat" class="form-label">Flat No:</label>
                    <input type="number" class="form-control" id="eflat" 
                    value="<cfoutput>#session.flat#</cfoutput>" disabled>
                </div>

                <div class="mb-1" id="eachInput">
                    <label for="fname" class="form-label">First Name:</label>
                    <input type="text" class="form-control" id="fname" value="<cfoutput>#session.uname#</cfoutput>" disabled>
                </div>

                <div class="mb-1" id="eachInput">
                    <label for="lname" class="form-label">Last Name:</label>
                    <input type="text" class="form-control" id="lname" value="<cfoutput>#session.lname#</cfoutput>" disabled>
                </div>
            
                <div class="mb-1" id="eachInput">
                    <label for="ph" class="form-label">Phone:</label>
                    <input type="phone" class="form-control" id="ph" value="<cfoutput>#session.phone#</cfoutput>" disabled>
                </div>

                <div class="mb-1" id="eachInput">
                    <label for="eid" class="form-label">Email-id:</label>
                    <input type="text" class="form-control" id="eid" value="<cfoutput>#session.email#</cfoutput>" disabled>
                </div>

                <div class="mb-3" id="eachInput">
                    <label for="utype" class="form-label">User Type:</label>
                    <input style="text-transform: capitalize;" type="text" class="form-control" id="utype" value="<cfoutput>#session.utype#</cfoutput>" disabled>
                </div>
             </form>
             <!--- button to edit user data --->
                <button type="button" id="editbtn" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#editprofile">Edit Profile?</button>
            </div>
        </div>
        </div>   
    </div>
</div>

<!-- modal box to edit profile  -->
<div class="modal fade" id="editprofile" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h1 class="modal-title fs-5" id="editprofileLabel">Edit your profile</h1>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
            <form>
                <div class="mb-3 mt-0" id="eachInput">
                    <label for="firstname" class="form-label">First Name:</label>
                    <input type="text" placeholder="First name" class="form-control" id="firstname" value="<cfoutput>#session.uname#</cfoutput>">
                    <div class="px-2">
                        <small id="fnameerror" class="text-danger">You must enter first name.
                        </small> 
                    </div>
                </div>
                <div class="mb-3" id="eachInput">
                    <label for="lastname" class="form-label">Last Name:</label>
                    <input type="text" placeholder="Last name" class="form-control" id="lastname" value="<cfoutput>#session.lname#</cfoutput>">
                    <div class="px-2">
                        <small id="lnameerror" class="text-danger">You must enter last name.
                        </small>  
                    </div>
                </div>
                <div class="mb-3" id="eachInput">
                    <label for="phone" class="form-label">Phone Number:</label>
                    <input type="phone" placeholder="Phone number" class="form-control" id="phone" value="<cfoutput>#session.phone#</cfoutput>">
                    <div class="px-2">
                        <small id="phoneerror" class="text-danger">You must enter a valid phone number.
                        </small>  
                    </div>
                </div> 
                <div class="mb-3" id="eachInput">
                    <label for="email" class="form-label">Email Id:</label>
                    <input type="email" placeholder="E-mail" class="form-control" id="email" value="<cfoutput>#session.email#</cfoutput>">
                    <div class="px-2">
                        <small id="emailerror" class="text-danger">Enter a valid mail id.
                        </small>   
                        <small id="emailerror2" class="text-danger">An account with this email already exists.
                        </small> 
                    </div>
                </div>  
                <div class="mb-3" id="eachInput">
                    <label for="password" class="form-label">Password:</label>
                    <input type="password" placeholder="Password" class="form-control" id="password">
                    <div class="px-2">
                        <small id="pswderror" class="text-danger">Password must have a special character, a capital letter, a number and 6-20 in length.
                        </small>
                        <small id="pswderror2" class="text-danger">Password with this combination already exists.
                        </small>   
                    </div>
                </div> 
                <div class="mb-3" id="eachInput">
                    <label for="confirmpassword" class="form-label">Confirm password:</label>
                    <input type="password" placeholder="Confirm password" class="form-control" id="confirmpassword">
                    <div class="px-2">
                        <small id="confirmpswderror" class="text-danger">Both passwords must be same.
                        </small>   
                    </div>
                </div>  
            </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
        <button type="button" id="savechangebtn" class="btn btn-danger">Save change</button>
      </div>
    </div>
  </div>
</div>
</body>
</html>