<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, 
    initial-scale=1.0">
    <title>My community app</title>
   
    <link rel="stylesheet" type="text/css" href="../styles/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../styles/viewVisitorsForFlat.css">
    <link rel="stylesheet" href="../styles/dataTables.css"/>


    <script type="text/javascript" src="../javascripts/bootstrap.js"></script>
    <script type="text/javascript" src="../javascripts/jquery.js"></script>
    <script type="text/javascript" src="../javascripts/dataTables.js"></script>
    <script type="text/javascript" src="../javascripts/viewData.js"></script>
</head>
 <cfinclude template="adminnavbar.cfm">
<body> 
    <!--- datatable to view all the registred data --->
    <div class="row mt-4" style="width: 100%;">
        <h1>Registered Data</h1>
    </div>
    <div class="container justify-content-center">
        <!--- input fields for search filters --->
         <div class="row justify-content-center">
                <div class="col col-sm-5 col-md-3"> <input type="text" class="form-control" id="filterloc" placeholder="Search by location"></div>
                <div class="col col-sm-5 col-md-3"><input type="text" class="form-control" id="filterapt" placeholder="Search by apartment"></div>
        </div>
    </div>
    <div class="row" style="width: 100%;">
        <div class="col" align="center">
            <table class="table table-hover">
                <thead class="table-dark">
                  <tr>
                    <th> Location </th>
                    <th> Apartment </th> 
                    <th> Manager </th> 
                    <th>  Phone </th> 
                    <th> Mail-id </th>
                  </tr> 
                </thead>
                <tbody >  
                    <!--- written in js code --->
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>