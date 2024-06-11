//to show password needs as the admin enters password
$(document).ready(function(){
	$("#gpswd").keyup(function(){
		$("#gpswderror2").css("display","none")
		let pswd=$("#gpswd").val();
		let pregx= (/^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W]).{6,20})$/).test(pswd);
		if(pregx ==0){
			$("#gpswderror2").css("display","block")
		}
	});
});

//validation for the admin page registrtion form and add it into database.
$(document).ready(function(){
	$("#addbtn").click(function(){
		$("small").css("display","none")
		let location=$("#location").val()
		let apartment=$("#aptname").val()
		let fname=$("#guardfname").val()
		let lname=$("#guardlname").val()
		let phone=$("#gphone").val()
		let mail=$("#gemail").val()
		let pswd=$("#gpswd").val()
		let confirmpswd=$("#gcpswd").val()
		let phregx= (/^(\+91)?([6-9][0-9]{9})$/).test(phone);
	  let eregx= (/^[a-z 0-9_]+@[a-z 0-9]+\.[a-z]{2,}$/).test(mail);
	  let pregx= (/^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W]).{6,20})$/).test(pswd);
		let obj={"location":location,"apartment":apartment,"fname":fname,"lname":lname,"phone":phone,"phonex":phregx,"email":mail,"mailx":eregx,"password":pswd,"pswdx":pregx,"cpswd":confirmpswd}
		$.ajax({
			type:"GET",
			url:"validateAdmin.cfm",
			data:obj,
			success:function(result){
				if(result==1){
					$("#locationerror").css("display","block")
				}
				else if(result==2){
					$("#aptnameerror").css("display","block")
				}
				else if(result==3){
					$("#guardfnameerror").css("display","block")
				}
				else if(result==4){
					$("#guardlnameerror").css("display","block")
				}
				else if(result==5){
					$("#gphoneerror1").css("display","block")
				}
				else if(result==6){
					$("#gphoneerror2").css("display","block")
				}
				else if(result==7){
					$("#gemailerror1").css("display","block")
				}
				else if(result==8){
					$("#gemailerror2").css("display","block")
				}
				else if(result==9){
					$("#gpswderror1").css("display","block")
				}
				else if(result==10){
					$("#gpswderror2").css("display","block")
				}
				else if(result==11){
					$("#gcpswderror").css("display","block")
				}
				else{
					window.location.reload()
				}
			}
		});
	});
});

//To add new area into the database.
$(document).ready(function(){
	$("#addareabtn").click(function(){
		let area=$("#areaname").val();
		$.ajax({
			type:"GET",
			url:"setNewArea.cfm",
			data:{"areaname":area},
			success:function(result){
				if(result==1){
					$("#areanameerror1").css("display","block")
				}
				else if (result==2){
					$("#areanameerror2").css("display","block")
				}
				else{
					window.location.reload();
				}
			}
		});
	});
});

// clear the card in database after clicking the clear 
function clearIssue(issueid){
	$.ajax({
		url:"clearIssue.cfm",
		type:"GET",
		data:{"issueid":issueid},
		success:function(result){
			window.location.reload();
		}
	});
}

//logout redirect button
$(document).ready(function(){
  $("#logoutbtn").click(function(){
    window.location.replace("../index.cfm")
  });
});
