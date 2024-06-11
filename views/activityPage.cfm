<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, 
    initial-scale=1.0">
    <title>My community app</title>
   
    <link rel="stylesheet" type="text/css" href="../styles/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="../styles/viewVisitorsForFlat.css">
    <link rel="stylesheet" href="../styles/dataTables.css" />
    
    <script type="text/javascript" src="../javascripts/bootstrap.js"></script>
    <script type="text/javascript" src="../javascripts/jquery.js"></script>
    <script type="text/javascript" src="../javascripts/dataTables.js"></script>
    <script type="text/javascript" src="../javascripts/viewActivities.js"></script>
</head>
 <cfinclude template="ownernavbar.cfm">
<body> 
    <!-- visitors datatable -->
    <div class="row mt-3" style="width: 100%;">
        <h1>Visitors Visited</h1>
    </div>
    <div class="container justify-content-center">      
        <!--- input field to search filters  --->
         <div class="row justify-content-center">
                <div class="col col-sm-5 col-md-3"> <input type="text" class="form-control" id="filtername" placeholder="Search by name"></div>
                <div class="col col-sm-5 col-md-3"><select class="form-select" id="filteraccess">
                    <option selected value="">Search by access</option>
                    <option value="Allow">Allow</option>
                    <option value="Decline">Decline</option>
                    <option value="Null">Null</option>
                </select></div>
        </div>
    </div>
    <div class="row" style="width: 100%;">
        <div class="col" align="center">
            <table class="table table-hover">
            <thead class="table-dark">
              <tr>  
                <th> Visitor's Name </th>
                <th> Time </th> 
                <th> Date </th>
                <th> Access </th>
                <th> Other </th>
              </tr> 
            </thead>
            <tbody>  
                <!--- written in js code --->
            </tbody>
        </table>
        </div>
    </div>
    <!--- modal to display after clicking other --->
    <div class="modal fade" id="viewModal" tabindex="-1" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title"></h5>
            <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
          </div>
          <div class="modal-body">
                <div id="vimgdisplay"></div>
                <div class="mb-3" id="eachInput">
                    <label class="form-label">Relationship:</label>
                    <input type="text" class="form-control" id="viewrel" disabled>
                </div>   
                <div class="mb-3" id="eachInput">
                    <label class="form-label">Description:</label>
                    <textarea class="form-control" id="viewdescription" rows="3" disabled>
                    </textarea>
                </div>
          </div>
        </div>
      </div>
    </div>
</body>
</html>