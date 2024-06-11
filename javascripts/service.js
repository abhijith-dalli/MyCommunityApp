//to insert the services in database and validating
$(document).ready(function(){
	$("#uploadbtn").click(function(){
		$("small").css("display","none")
		let name= $("#name").val()
		let service=$("#service").val()
		let rating= $("#rating").val()
		let desc= $("#desc").val()
		let phone= $("#phone").val()
		let currentdate= new Date();
		let date=currentdate.getFullYear()+"-"+("0" + (currentdate.getMonth() + 1)).slice(-2)+"-"+("0" + (currentdate.getDate())).slice(-2)
		console.log(date)
		$.ajax({
			url:"serviceReg.cfm",
			type:"GET",
			data:{"name":name,"service":service,"rating":rating,"desc":desc,"date":date,"phone":phone},
			success: function(result){
				if (result == 1){
					$("#nameerror").css("display","block")
				}
				else if (result==2){
					$("#serviceerror").css("display","block")
				}
				else if (result==3){
					$("#ratingerror").css("display","block")
				}
				else if (result==4){
					$("#phoneerror").css("display","block")
				}
				else if (result==5){
					$("#descerror").css("display","block")
				}
				else{
					alert("Review uploaded successfully.")
					window.location.reload();				}
			}
		});
	});
});
