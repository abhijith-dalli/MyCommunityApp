<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name
    ="viewport" content="width=device-width, initial-scale=1.0">
    <title>My community app</title>
    
    <link rel="stylesheet" type="text/css" href="../styles/bootstrap.css"> 
    <link rel="stylesheet" type="text/css" href="../styles/stylesforsecurity.css"> 

    <script type="text/javascript" src="../javascripts/smtpjs.js"></script>
    <script type="text/javascript" src="../javascripts/bootstrap.js"></script> 
    <script type="text/javascript" src="../javascripts/jquery.js"></script>
    <script type="text/javascript" src="../javascripts/security.js"></script>


</head>
<cfinclude template="navbar.cfm">
<body>
    <!--- security page...to register a new visitor --->
    <div class="bodyContainer">
        <div class="row justify-content-center" id="row">
        <div class="col-10 col-md-6 col-sm-8 col-lr-2"> 
            <div class="content">
            <div class="container  py-3 my-5" id="container">
                <div class="container my-3">
                    <p id="heading">REGISTER A VISITOR</p>
                </div>
                <form >
                <div class="mb-3" id="eachInput">
                    <label for="flat" class="form-label">Flat No:</label>
                    <select class="form-select" 
                    id="flat" >
                    <cfquery name="getFlatFromFlatid" datasource="management">
                        select flatno from management.users where aptid=<cfqueryparam cfsqltype="cf_sql_integer" value="#session.apartment#"> and usertype='owner' order by flatno;
                    </cfquery>
                         <option selected value="0">Choose a Flat</option>
                         <cfloop query="getFlatFromFlatid">
                            <option value="<cfoutput>#getFlatFromFlatid.flatno#</cfoutput>"><cfoutput>#getFlatFromFlatid.flatno#</cfoutput></option>
                         </cfloop>
                    </select>
                    <div class="px-2">
                        <small id="flaterror" class="text-danger">You need to select a flat.</small>
                    </div>
                </div>
                <div class="mb-3" id="eachInput">
                    <label for="name" class="form-label">Visitor's Name:</label>
                    <input type="text" class="form-control" id="name" placeholder="Enter Visitors Name">
                    <div class="px-2">
                        <small id="nameerror" class="text-danger">Please enter the visitor's name.</small> 
                    </div>
                </div>
                <div class="mb-3" id="eachInput">
                   <label>Upload Image:
                        <input name="image" type="file"  id="image" accept="image/png, image/gif, image/jpeg"> 
                   </label>
                   <input type="button" id="imgupload" value="Upload">
                   <div id="imgDisplayArea"></div>
                   <div class="px-2">
                        <small id="imageerror" class="text-danger">You need to upload the picture of the visitor.
                        </small> 
                    </div>
                </div>
                <div class="mb-3" id="eachInput">
                    <label for="time" class="form-label">Time of Entry:</label>
                    <input type="text" class="form-control" id="time" placeholder="Select Time" disabled>
                </div>
                <div class="mb-3" id="eachInput">
                    <label for="date" class="form-label">Date of Entry:</label>
                    <input type="text" class="form-control" id="date" placeholder="Select Date" disabled>
                </div>
                <div class="mb-3" id="eachInput">
                    <label for="rel" class="form-label">Relationship:</label>
                    <select class="form-select" id="rel">
                      <option selected value="0">Open this select menu</option>
                      <option value="Friend">Friend</option>
                      <option value="Family">Family</option>
                      <option value="Guest">Guest</option>
                      <option value="Delivery">Delivery</option>
                      <option value="Other">Other</option>
                    </select>
                    <div class="px-2">
                        <small id="relerror" class="text-danger">Enter the relation with the user.</small> 
                    </div> 
                </div>   
                <div class="mb-3" id="eachInput">
                    <label for="description" class="form-label">Description:</label>
                    <textarea class="form-control" id="description"  placeholder="Enter the reason of entry.." rows="3"></textarea>
                    <div class="px-2">
                        <small id="descerror" class="text-danger">Give some description for the reason of entry.</small> 
                    </div>
                </div> 
             </form>
                <button type="button" id="submitbtn" class="btn btn-danger mt-3">Submit</button> 
            </div>
        </div>
        </div>   
    </div>
</div>
</body>
</html>