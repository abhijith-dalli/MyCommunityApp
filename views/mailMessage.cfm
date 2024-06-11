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
    <script type="text/javascript" src="../javascripts/mail.js"></script>
    
</head>
<body>
    <!--- section to display after user opens the link in mail --->
    <div class="bodyContainer">
        <div class="row justify-content-center" id="row">
        <div class="col-10 col-md-6 col-sm-8 col-lr-2">
            <div class="content">
            <div class="container  py-3 my-5" id="container">
                <div class="container my-2">
                    <p id="heading">Visitor Details</p>
                </div>
                <div class="mb-3" id="imgdiv">
                    <!--- <img src=""></img> 
                    code was written in the js --->
                </div>
                <form >
                <div class="mb-3" id="eachInput">
                    <input type="hidden" class="form-control" id="vid">
                </div>

                <div class="mb-3" id="eachInput">
                    <label class="form-label">Visitor's Name:</label>
                    <input type="text" class="form-control" id="vname" disabled>
                </div>
                <div class="mb-3" id="eachInput">
                    <label class="form-label">Time of Entry:</label>
                    <input type="text" class="form-control" id="vtime"  disabled>
                </div>
                <div class="mb-3" id="eachInput">
                    <label class="form-label">Date of Entry:</label>
                    <input type="text" class="form-control" id="vdate"disabled>
                </div>
                <div class="mb-3" id="eachInput">
                    <label class="form-label">Relationship:</label>
                    <input type="text" class="form-control" id="vrel" disabled> 
                </div>   
                <div class="mb-3" id="eachInput">
                    <label class="form-label">Description:</label>
                    <textarea class="form-control" id="vdescription" rows="3" disabled></textarea>
                </div>  
             </form>
                <button type="button" id="declinebtn" value="Decline"class="btn btn-danger">Decline</button>
                <button type="button" id="allowbtn" value="Allow" class="btn btn-success">Allow</button> 
            </div>
        </div>
        </div>   
    </div>
</div>

</body>
</html>