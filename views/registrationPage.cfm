<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My community app</title>

    <link rel="stylesheet" type="text/css" href="../styles/style.css">
    <link rel="stylesheet" type="text/css" href="../styles/bootstrap.css"> 

    <script type="text/javascript" src="../javascripts/bootstrap.js"></script>
    <script type="text/javascript" src="../javascripts/jquery.js"></script>
    <script type="text/javascript" src="../javascripts/index.js"></script>
</head>

<body>
    <!--- sign up form to register a new owner --->
    <div class="container ">
        <div class="row justify-content-center">
            <div class="col col-md-5 m-5 shadow-lg  bg-white  p-5">
                <h3 class="pb-3">Registeration Form</h3>
                <div class="form-style">
                    <form>
                        <div class="form-group pb-3">
                            <input type="text" placeholder="Flat no." class="form-control" id="flat">
                            <div class="px-2">
                                <small id="flaterror1" class="text-danger">Enter a valid flat number.</small>
                                <small id="flaterror2" class="text-danger">Account with that flat already exists.</small> 
                            </div>
                            
                        </div>
                        <div class="form-group pb-3">
                            <input type="text" placeholder="First name" class="form-control" id="firstname">
                            <div class="px-2">
                                <small id="fnameerror" class="text-danger">
                                You must enter first name.
                            </small> 
                            </div>
                        </div>
                        <div class="form-group pb-3">
                            <input type="text" placeholder="Last name" class="form-control" id="lastname">
                            <div class="px-2">
                            <small id="lnameerror" class="text-danger">
                                You must enter last name.
                            </small> 
                            </div>
                        </div>
                        <div class="mb-3" id="eachInput">
                            <select class="form-select " id="location" >
                                <cfquery name="getLocation" datasource="management">
                                    select * from management.locations;
                                </cfquery>
                                 <option selected value="0">Choose a Location</option>
                                 <cfloop query="getLocation">
                                    <option value="<cfoutput>#getLocation.lid#</cfoutput>"><cfoutput>#getLocation.locality#</cfoutput></option>
                                 </cfloop>
                            </select>
                            <div class="px-2">
                                <small id="locationerror" class="text-danger">You need to select a location.</small>
                            </div>
                        </div>
                        <div class="mb-3" id="eachInput">
                            <select class="form-select " id="apartment" >
                                 <option selected value="0" id="defaultopt">Choose your apartment</option>
                            </select>
                            <div class="px-2">
                                <small id="apartmenterror" class="text-danger">You need to select a apartment.</small>
                            </div>
                        </div>
                        <div class="form-group pb-3">
                            <input type="phone" placeholder="Phone number" class="form-control" id="phone">
                            <div class="px-2">
                            <small id="phoneerror" class="text-danger">
                                You must enter a valid phone number.
                            </small> 
                            </div>
                        </div>
                        <div class="form-group pb-3">
                            <input type="email" placeholder="E-mail" class="form-control" id="email">
                            <div class="px-2">
                            <small id="emailerror" class="text-danger">
                                Enter a valid mail id.
                            </small> 
                            <small id="emailerror2" class="text-danger">
                                An account with this email already exists.
                            </small> 
                            </div>
                        </div>
                        <div class="form-group pb-3">
                            <input type="password" placeholder="Password" class="form-control" id="password">
                            <div class="px-2">
                            <small id="pswderror" class="text-danger">Password must have a special character, a capital letter, a number and 6-20 in length.
                            </small>
                            <small id="pswderror2" class="text-danger">
                                Password with this combination already exists.
                            </small>       
                            </div>
                        </div>
                        <div class="form-group pb-3">
                            <input type="password" placeholder="Confirm password" class="form-control" id="confirmpassword">
                            <div class="px-2">
                            <small id="confirmpswderror" class="text-danger">
                                Both passwords must be same.
                            </small> 
                            </div>
                        </div>
                        <div class="pb-2">
                            <button type="button" id="submitbtn" class="btn btn-dark w-100 font-weight-bold mt-2">Submit
                            </button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>

</html>