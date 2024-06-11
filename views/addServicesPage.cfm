<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name
    ="viewport" content="width=device-width, initial-scale=1.0">
    <title>My community app</title>
    <link rel="stylesheet" type="text/css" href="../styles/bootstrap.css"> 
    <link rel="stylesheet" type="text/css" href="../styles/stylesforsecurity.css"> 
    <link rel="stylesheet" type="text/css" href="../styles/ownerPage.css">
    
    

    <script type="text/javascript" src="../javascripts/bootstrap.js"></script> 
    <script type="text/javascript" src="../javascripts/jquery.js"></script>
    <script type="text/javascript" src="../javascripts/service.js"></script>
    <script type="text/javascript" src="../javascripts/fontAwesome.js"></script>


</head>
<cfif session.utype eq "owner">
    <cfinclude template="ownernavbar.cfm">
<cfelse>
    <cfinclude template="navbar.cfm">
</cfif>
<body>
    <!--- upload a review section --->
    <div class="bodyContainer">
        <div class="row justify-content-center" id="row">
        <div class="col-10 col-md-6 col-sm-8 col-lr-2"> 
            <div class="content">
            <div class="container  py-3 my-5" id="container">
                <div class="container my-3">
                    <p id="heading">UPLOAD A REVIEW</p>
                </div>
                <form >
                <div class="mb-3" id="eachInput">
                    <label for="flat" class="form-label">Flat No:</label>
                    <input type="number" class="form-control" id="flat"
                    value="<cfoutput>#session.flat#</cfoutput>" disabled>
                </div>
                <div class="mb-3" id="eachInput">
                    <label for="name" class="form-label">Name:</label>
                    <input type="text" class="form-control" id="name" placeholder="Enter the name.">
                    <div class="px-2">
                        <small id="nameerror" class="text-danger">Please enter the name of service provider.</small> 
                    </div>
                </div>
                <div class="mb-3" id="eachInput">
                    <label for="service" class="form-label">Service:</label>
                    <input type="text" class="form-control" id="service" placeholder="Enter service provided.">
                    <div class="px-2">
                        <small id="serviceerror" class="text-danger">Please enter the service provided.</small> 
                    </div>
                </div>
                <div class="mb-3" id="eachInput">
                    <label for="rating" class="form-label">Rating:</label>
                    <select class="form-select form-select-sm" id="rating" >
                      <option selected value="0" style="color:grey;">Choose rating out of 5.</option>
                      <option value="1">One</option>
                      <option value="2">Two</option>
                      <option value="3">Three</option>
                      <option value="4">Four</option>
                      <option value="5">Five</option>
                    </select>
                    <div class="px-2">
                        <small id="ratingerror" class="text-danger">You need to give some rating.</small> 
                    </div>
                </div>
                <div class="mb-3" id="eachInput">
                    <label for="phone" class="form-label">Phone:</label>
                    <input type="phone" class="form-control" id="phone" placeholder="Enter number of service provided.">
                    <div class="px-2">
                        <small id="Phoneerror" class="text-danger">Please give valid phone number.</small> 
                    </div>
                </div>
                <div class="mb-3" id="eachInput">
                    <label for="desc" class="form-label">Description:</label>
                    <textarea class="form-control" id="desc" placeholder="Give some description.." rows="3"></textarea>
                    <div class="px-2">
                        <small id="descerror" class="text-danger">Give some description about the service.</small> 
                    </div>
                </div>  
             </form>
                <button type="button" id="uploadbtn" class="btn btn-dark">Upload</button> 
            </div>
        </div>
        </div>   
    </div>
</div>

<!--- to show the previously uploaded reviews--->
<div id="testimonials">
    <div class="testimonial-heading">
        <h1>Uploaded Reviews</h1>
    </div>
    <div class="testimonial-box-container" id="insertService">
    <!--  query to get the events uploaded by this user --->
    <cfquery name="getreviewsByUser" datasource="management">
        select * from management.services as eve join management.users as usr 
        on eve.userid=usr.uid join management.apartments as apt 
        on usr.aptid=apt.aid 
        where userid=<cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#">;
    </cfquery>
    <!--- to show events that user uploaded--->
    <cfif getreviewsByUser.recordcount gt 0>
        <cfloop query="getreviewsByUser">
        <div class="testimonial-box">
            <div class="box-top">
                <div class="profile">
                    <div class="name-user">
                        <strong><cfoutput>#getreviewsByUser.sname#</cfoutput> (<cfoutput>#getreviewsByUser.service#</cfoutput>)</strong>
                        <span>@<cfoutput>#getreviewsByUser.firstname#</cfoutput> <cfoutput>#getreviewsByUser.lastname#</cfoutput> (<cfoutput>#getreviewsByUser.flat#</cfoutput>)</span>
                    </div>
                </div>
                <div class="reviews">
                    <p>Rating: (<cfoutput>#getreviewsByUser.rating#</cfoutput>.0/5.0)</p>
                </div>
            </div>
            <div class="client-comment">
                <p><cfoutput>#getreviewsByUser.description#</cfoutput>.</p>
            </div>
            <div class="meta meta-style-2">
                <ul>
                    <li><i class="fa-solid fa-building"></i>  <cfoutput>#getreviewsByUser.apartment#</cfoutput></li>
                    <li><i class="fa-solid fa-phone"></i> <cfoutput>#getreviewsByUser.phone#</cfoutput></li>
                </ul>
            </div>
        </div>
        </cfloop>
        <!--- to show message if user didnt upload any events --->
     <cfelse>
        <div class="testimonial-box">
            <div class="box-top">
                <div class="profile">
                    <div class="name-user">
                        <strong>No Reviews Uploaded (Service)</strong>
                        <span>@OwnerName</span>
                    </div>
                </div>
                <div class="reviews">
                    <p>Rating: (?/5.0)</p>
                </div>
            </div>
            <div class="client-comment">
                <p>There are no reviews that you've uploaded. You need to post a review to display it here.</p>
            </div>
            <div class="meta meta-style-2">
                <ul>
                    <li><i class="fa-solid fa-building"></i> Flat No.</li>
                    <li><i class="fa-solid fa-phone"></i> Phone Number.</li>
                    <li><i class="fa-solid fa-calendar-alt"></i> Date of review.</li>
                </ul>
            </div>
        </div>
    </cfif>
    </div>
</div>
</body>
</html>