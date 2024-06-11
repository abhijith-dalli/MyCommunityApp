<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My community app</title>
    <link rel="stylesheet" type="text/css" href="styles/style.css">
    <link rel="stylesheet" type="text/css" href="styles/bootstrap.css"> 

    <script type="text/javascript" src="javascripts/bootstrap.js"></script>
    <script type="text/javascript" src="javascripts/jquery.js"></script>
    <script type="text/javascript" src="javascripts/index.js"></script>
</head>

<body>
    <!--- login form  --->
    <div class="container ">
        <div class="row justify-content-center">
            <div class="col col-md-5 m-5 shadow-lg  bg-white  p-5">
                <h3 class="pb-3">Login Form</h3>
                <div class="form-style">
                    <form>
                        <div class="form-group pb-3">
                            <input type="email" placeholder="Email" class="form-control" id="inputemail">
                            <div class="px-2">
                            <small id="inputemailerror" class="text-danger">
                                This mail-id didn't registerd, create a new account.
                            </small> 
                            </div>
                        </div>
                        <div class="form-group pb-3">
                            <input type="password" placeholder="Password" class="form-control" id="inputpswd">
                            <div class="px-2">
                            <small id="inputpswderror" class="text-danger">
                               Password Doesnt match.
                            </small> 
                            </div>
                        </div>
                        <div class="pt-2 pb-1">
                            <button type="button" id="loginbtn" class="btn btn-dark w-100 font-weight-bold mt-2" >Submit</button>
                        </div>
                        <div class="pb-2">
                            <button type="button" id="signbtn" class="btn btn-primary w-100 font-weight-bold mt-2">Sign up</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>