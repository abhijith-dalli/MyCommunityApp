// to show the apartments registered inside database
$(document).ready(function(){
	$.ajax({
		url:"getData.cfm",
		type:"GET",
		success: function(result){
			userData=JSON.parse(result);
			let data =userData.DATA;
			//console.log(data[1])
			 for(let i=0;i<data.length;i++){
            let tbody=("<tr>"+
              "<td>"+data[i][13]+"</td>"+
              "<td>"+data[i][11]+"</td>"+
              "<td>"+data[i][2]+" "+data[i][3]+"</td>"+
              "<td>"+data[i][4]+"</td>"+
              "<td>"+data[i][5]+"</td>"+
              "</tr>");
             $("tbody").append(tbody)
          };
          // datatable initialization
           var datatable=$("table").DataTable({
             	paging:true,
             	pageLength:5,
             	ordering: false,
             	sScrollX: "100%",
           });

           // search filters for the table
           $('#filterloc').keyup(function(){
           		datatable.column(0).search(this.value).draw();
           });
           $('#filterapt').keyup(function(){
           		datatable.column(1).search(this.value).draw();
           });
				}
		});
});
