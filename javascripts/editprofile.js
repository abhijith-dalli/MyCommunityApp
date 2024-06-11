// to save the change after editing the profile data
$(document).ready(function(){
	$("#savechangebtn").click(function(){
		$("small").css("display","none");
		let fname=$("#firstname").val();
		let lname=$("#lastname").val();
		let email=$("#email").val();
		let phone=$("#phone").val()
		let pswd=$("#password").val();
		let confirmpswd=$("#confirmpassword").val();
		let phregx= (/^(\+91)?([6-9][0-9]{9})$/).test(phone);
	    let eregx= (/^[a-z 0-9_]+@[a-z 0-9]+\.[a-z]{2,}$/).test(email);
	    let pregx= (/^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W]).{6,20})$/).test(pswd);
	    let obj={"firstname":fname.trim(),"lastname":lname.trim(),"phonenum":phone,"phoneregx":phregx,"emailid":email,"emailregx":eregx,"password":pswd,"passwordregx":pregx,"confirmpassword":confirmpswd};
	    //console.log(obj)
	    $.ajax({
	    	url:"editprofile.cfm",
	    	type: "GET",
	        data: obj,
	        dataType: "json",
	    	success: function(result){
	    		if (result ==1){
	    			$("#fnameerror").css("display","block")
	    		}
	    		else if (result ==2){
	    			$("#lnameerror").css("display","block")
	    		}
	    		else if (result ==3){
	    			$("#phoneerror").css("display","block")
	    		}
	    		else if (result ==4){
	    			$("#emailerror").css("display","block")
	    		}
	    		else if (result ==5){
	    			$("#emailerror2").css("display","block")
	    		}
	    		else if (result ==6){
	    			$("#pswderror").css("display","block")
	    		}
	    		else if (result ==7){
	    			$("#pswderror2").css("display","block")
	    		}
	    		else if (result ==8){
	    			$("#confirmpswderror").css("display","block")
	    		}
	    		else{
	    			//alert("Saved changes successfully")
	    			$('#editprofile').modal('toggle');
	    			$("#password").val("");
					$("#confirmpassword").val("");
	    		}
	    	}
	    });
  	});
});
