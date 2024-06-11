//showing the details of the visitor to the owner and take data to allow or dont allow
$(document).ready(function(){
	let params = new URLSearchParams(document.location.search);
	let vid=params.get("id")
	//console.log(vid)
	$.ajax({
		url:"visitorDetailsmail.cfm",
		type:"GET",
		data:{"vid":vid},
		dataType:"json",
		success: function(result){
			console.log(result)
			let vname=result.DATA[0][1]
			let vtime=result.DATA[0][2]
			let vdate=result.DATA[0][3]
			let vrel=result.DATA[0][4]
			let vdes=result.DATA[0][5]
			$("#vname").val(vname)
			$("#vtime").val(vtime)
			$("#vdate").val(vdate)
			$("#vrel").val(vrel)
			$("#vdescription").val(vdes)
			$("#vid").val(vid)
			$("#imgdiv").append("<img id='img'></img>")
			$("img").attr("src","../media/"+result.DATA[0][6]+"")
		}	
	});
});

//update the database with mail responce from owner declinebtn
$(document).ready(function(){
	$("#allowbtn").click(function(){
		let access= $("#allowbtn").val()
		let vid=$("#vid").val()
		// console.log(vid)
		$.ajax({
			url:"accessAllow.cfm",
			type:"GET",
			data:{"access":access,"vid":vid},
			dataType:"json",
			success: function(result){
				alert("We are gonna allow the visitor to your flat");
				window.location.replace("http://localhost:8500/ApartmentManagementWebsite/")
			}
		});
	});
});


//update the database with mail responce from owner declinebtn
$(document).ready(function(){
	$("#declinebtn").click(function(){
		let access= $("#declinebtn").val()
		let vid=$("#vid").val()
		$.ajax({
			url:"accessDecline.cfm",
			type:"GET",
			data:{"access":access,"vid":vid},
			dataType:"json",
			success: function(result){
				alert("We are not gonna allow the visitor to your flat");
				window.location.replace("http://localhost:8500/ApartmentManagementWebsite/")
			}
		});
	});
});