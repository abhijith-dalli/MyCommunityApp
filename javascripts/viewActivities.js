//appending custom input field to the row above the datatable
$(document).ready(function(){
	$(".dt-end").append('<input type="text" placeholder="Search by name." id="searchbyname"> <input type="text" placeholder="Search by date." id="searchbydate">')
	$.ajax({
		url:"getVisitorsForFlat.cfm",
		type:"GET",
		success: function(result){
			userData=JSON.parse(result);
			let data =userData.DATA;
			//console.log(data[1])
			 for(let i=0;i<data.length;i++){
			 	let obj={"vid":data[i][0],"vrel":data[i][6],"vdes":data[i][7],"vimg":data[i][3],'vname':data[i][2]}
                let tbody=("<tr>"+
                  "<td>"+data[i][2]+"</td>"+
                  "<td>"+data[i][4]+"</td>"+
                  "<td>"+data[i][5]+"</td>"+
                  "<td>"+data[i][8]+"</td>"+
                  "<td> <button type='button' class='btn btn-info' data-bs-toggle='modal' data-bs-target='#viewModal' onclick='viewData("+JSON.stringify(obj)+")' >View</button> </td>"+
                  "</tr>");
                 $("tbody").append(tbody)
              };
              //datatable initialization
                let datatable=$("table").DataTable({
		                paging:true,
		               	ordering: false,
		               	pageLength:5,
		            		aLengthMenu: [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
		            	  aoColumns: [ { sWidth: '30%' } ,{ sWidth: '30%' },{ sWidth: '20%' },{ sWidth: '10%' },{ sWidth: '10%' } ]
		               });
                
               //filters for input fields
               $('#filtername').keyup(function(){
		           		datatable.column(0).search(this.value).draw();
		           });
               $('#filteraccess').change(function(){
		           		datatable.column(3).search(this.value).draw();
		           });
				}
		});
});

// data to be displayed after clicking view button
function viewData(result){
	$("#vimageid").remove()
	$("#vimgdisplay").append("<img id='vimageid'></img>")
	$("#vimageid").attr("src","../media/"+result.vimg+"")
	$(".modal-title").html(result.vname)
	$("#viewrel").val(result.vrel)
	$("#viewdescription").val(result.vdes)
}

