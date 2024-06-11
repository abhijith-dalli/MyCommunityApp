<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My community app</title>

    <link rel="stylesheet" type="text/css" href="../styles/bootstrap.css"> 
    <link rel="stylesheet" type="text/css" href="../styles/stylesforsecurity.css"> 
    <link rel="stylesheet" type="text/css" href="../styles/ownerPage.css">

    <script type="text/javascript" src="../javascripts/bootstrap.js"></script>
    <script type="text/javascript" src="../javascripts/fontAwesome.js"></script>
    <script type="text/javascript" src="../javascripts/jquery.js"></script>
    <script type="text/javascript" src="../javascripts/ownerPage.js"></script>

</head>
<cfif session.utype eq "owner">
    <cfinclude template="ownernavbar.cfm">
<cfelse>
    <cfinclude template="navbar.cfm">
</cfif>
<body>
<!--- display events section --->
<div class="container mt-1">
    <h1>Upcoming Events</h1>
</div>
<!--- events uploaded section --->
<div class="container">
    <div class="row mt-n5 justify-content-center" id="insertDiv">
    <!--- this code was appended inside the javascripts code --->
        <!--- <div class="col-md-4 col-lg-4 col-sm-6 mt-4">
            <div class="blog-grid">
                <div class="blog-grid-text p-4">
                    <h3 class="mb-3">Event name</h3>
                    <p class="display-50">There are no any upcoming events. We'll keep you posted if there is any event soon.</p>
                    <div class="meta meta-style">
                    <ul>
                        <li><i class="fas fa-calendar-alt"></i>  Date,Time</li>
                        <li><i class="fas fa-user"></i>User</li>
                        <li><i class="fa-solid fa-building"></i></li>
                        <li><i class="fa-solid fa-phone"></i>phone number</li>
                        <li><i class="fa-solid fa-location-dot"></i>Location</li>
                    </ul>
                    </div>
                </div>
            </div>
        </div> --->
    </div>
</div>


<!--- reviews uploaded section --->
<div id="testimonials">
    <div class="testimonial-heading">
        <h1>Service Reviews</h1>
    </div>
    <div class="testimonial-box-container" id="insertService">
    <!--- this code was appended inside the javascripts code --->
    <!--- <div class="testimonial-box">
            <div class="box-top">
                <div class="profile">
                    <div class="name-user">
                        <strong>Review person name (Service)</strong>
                        <span>@Owner name (Flat No.)</span>
                    </div>
                </div>
                <div class="reviews">
                    <p>Rating: (?/5.0)</p>
                </div>
            </div>
            <div class="client-comment">
                <p>There are no reviews that anyone has uploaded.
                You can view reviews when someone has uploaded .</p>
            </div>
            <div class="meta meta-style-2">
                <ul>
                    <li><i class="fa-solid fa-phone"></i> Phone Number.</li>
                    <li><i class="fa-solid fa-calendar-alt"></i> Date of review.</li>
                </ul>
            </div>
        </div>  --->
    </div>
</div>

<!--- resport an issue section --->
<div class="container mt-5 mb-4">
    <h1>Repost an issue</h1>
</div>
    <div class="container">
        <div class="row justify-content-center text-center">
            <div class="col-md-8">
                <p class="lead">If there is any problem that you are facing with the website feel free to report us. You can also provide some suggestions to improve your experience with the website.</p>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-10 col-lg-6 mt-2">
                <form>
                    <div class="row justify-content-center">
                        <div class="col-10 col-md-5 col-sm-10">
                            <div class="mb-1">
                                <input class="form-control bg-light" placeholder="First name" id="fname" type="text">
                            </div>
                            <div class="px-2 pb-2" >
                                <small id="fnameerror" class="text-danger">Please enter the first name.</small> 
                            </div>
                        </div>
                        <div class="col-10 col-md-5 col-sm-10">
                            <div class="mb-1">
                                <input class="form-control bg-light" placeholder="Last name" id="lname" type="text">
                            </div>
                            <div class="px-2 pb-2">
                                <small id="lnameerror" class="text-danger">Please enter the last name.</small> 
                            </div>
                        </div>
                        <div class="col-10 col-md-10 col-sm-10">
                            <div class="mb-1">
                                <input class="form-control bg-light" placeholder="Enter your email-id" id="email" type="text">
                            </div>
                            <div class="px-2 pb-2">
                                <small id="emailerror" class="text-danger">Please enter the a valid mail id.</small> 
                            </div>
                        </div>
                        <div class="col-10 col-md-10  col-sm-10">
                            <div class="mb-1">
                                <textarea class="form-control bg-light" id="msg"
                                placeholder="Your message..." rows="4"></textarea>
                            </div>
                            <div class="px-2 pb-2">
                                <small id="msgerror" class="text-danger">You need to enter some issue.</small> 
                            </div>
                        </div>
                        <div class="col-10 col-sm-10 col-md-4">
                            <div class="d-grid">
                                <button class="btn btn-primary" type="button" id="issuebtn">Send message</button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</html>