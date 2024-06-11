//datatable to display the visitor data in seccurity page
$(document).ready(function(){
	$.ajax({
		url:"getVisitorsData.cfm",
		type:"GET",
		success: function(result){
			userData=JSON.parse(result);
			let data =userData.DATA;
			//console.log(data[1])
			 for(let i=0;i<data.length;i++){
			 	let obj={"vid":data[i][0],"vrel":data[i][6],"vdes":data[i][7],"vimg":data[i][3],'vname':data[i][2]}
                let tbody=("<tr>"+
                  "<td>"+data[i][0]+"</td>"+
                  "<td>"+data[i][1]+"</td>"+
                  "<td>"+data[i][2]+"</td>"+
                  "<td>"+data[i][4]+"</td>"+
                  "<td>"+data[i][5]+"</td>"+
                  "<td>"+data[i][8]+"</td>"+
                  "<td> <button type='button' class='btn btn-info' data-bs-toggle='modal' data-bs-target='#viewModal' onclick='viewData("+JSON.stringify(obj)+")' >View</button> </td>"+
                  "</tr>");
                 $("#tbody").append(tbody)
              };
               let datatable=$("#table").DataTable({
               	order: [[0, 'desc']],
               	paging:true,
               	pageLength:5,
            		aLengthMenu: [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
            		// aoColumns: [ { sWidth: '40%' } ,{ sWidth: '10%' },{ sWidth: '10%' },{ sWidth: '10%' },{ sWidth: '10%' },{ sWidth: '10%' },{ sWidth: '10%' } ]
               });

		           // search filters for the table
		           $('#filterflat').change(function(){
		           		datatable.column(1).search(this.value).draw();
		           });
		           $('#filtername').keyup(function(){
		           		datatable.column(2).search(this.value).draw();
		           });
		           $('#filteraccess').change(function(){
		           		datatable.column(5).search(this.value).draw();
		           });
				}
		});
});

//view button data display
function viewData(result){
	$("#vimageid").remove()
	$("#vimgdisplay").append("<img id='vimageid'></img>")
	$("#vimageid").attr("src","../media/"+result.vimg+"")
	$(".modal-title").html(result.vname)
	$("#viewrel").val(result.vrel)
	$("#viewdescription").val(result.vdes)

}

