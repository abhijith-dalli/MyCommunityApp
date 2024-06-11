// redirect to signup page 
$(document).ready(function(){
	$("#signbtn").click(function(){
		window.location.href= "./views/registrationPage.cfm";	
	});
});

//to show password needs as the user enters password
$(document).ready(function(){
	$("#password").keyup(function(){
		$("#pswderror").css("display","none")
		let pswd=$("#password").val();
		let pregx= (/^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W]).{6,20})$/).test(pswd);
		if(pregx ==0){
			$("#pswderror").css("display","block")
		}
	});
});

//validations for registration form
$(document).ready(function(){
	$("#submitbtn").click(function(){
		$("small").css("display","none");
		let fno=$("#flat").val();
		let fname=$("#firstname").val();
		let lname=$("#lastname").val();
		let apartment=$("#apartment").val();
		let email=$("#email").val();
		let phone=$("#phone").val();
		let pswd=$("#password").val();
		let confirmpswd=$("#confirmpassword").val();
		let phregx= (/^(\+91)?([6-9][0-9]{9})$/).test(phone);
	    let eregx= (/^[a-z 0-9_]+@[a-z 0-9]+\.[a-z]{2,}$/).test(email);
	    let pregx= (/^((?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[\W]).{6,20})$/).test(pswd);
	    let obj={"flat":fno,"firstname":fname.trim(),"lastname":lname.trim(),"apartment":apartment,"phonenum":phone,"phoneregx":phregx,"emailid":email,"emailregx":eregx,"password":pswd,"passwordregx":pregx,"confirmpassword":confirmpswd};
	   // console.log(obj)
	    $.ajax({
	    	url:"registration.cfm",
	    	type: "GET",
	        data: obj,
	        dataType: "json",
	    	success: function(result){
	    		if (result==1){
	    			$("#flaterror1").css("display","block")
	    		}
	    		else if (result==2){
	    			$("#flaterror2").css("display","block")
	    		}
	    		else if (result ==3){
	    			$("#fnameerror").css("display","block")
	    		}
	    		else if (result ==4){
	    			$("#lnameerror").css("display","block")
	    		}
	    		else if (result==5){
	    			$("#locationerror").css("display","block")
	    			$("#apartmenterror").css("display","block")
	    		}
	    		else if (result ==6){
	    			$("#phoneerror").css("display","block")
	    		}
	    		else if (result ==7){
	    			$("#emailerror").css("display","block")
	    		}
	    		else if (result ==8){
	    			$("#emailerror2").css("display","block")
	    		}
	    		else if (result ==9){
	    			$("#pswderror").css("display","block")
	    		}
	    		else if (result ==10){
	    			$("#pswderror2").css("display","block")
	    		}
	    		else if (result ==11){
	    			$("#confirmpswderror").css("display","block")
	    		}
	    		else{
	    			window.location.href="../index.cfm"
	    		}
	    	}
	    });
	});
});


//to change the apartment list as the location changes
$(document).ready(function(){
	$("#location").change(function(){
		$("#defaultopt").nextAll().remove()
		let locationid=$("#location").val()
		$.ajax({
			type:"GET",
			url:"getApartments.cfm",
			data:{"id":locationid},
			success:function(result){
				let apartments=JSON.parse(result).DATA
				//apartmentid apartments[i][0] and apartment name apartments[i][2] 
				for(let i=0;i<apartments.length;i++){
					let option='<option value="'+apartments[i][0]+'">'+apartments[i][2]+'</option>';
					$("#apartment").append(option)
				}
			}
		});
	});
});


//validation for login adn redirecting to appropriate page
$(document).ready(function(){
	$("#loginbtn").click(function(){
		$("small").css("display","none")
		let iemail=$("#inputemail").val();
		let ipswd=$("#inputpswd").val();
		$.ajax({
			url:"views/login.cfm",
			type:"GET",
			data:{"email":iemail,"pswd":ipswd},
			dataType:"json",
			success: function(result){
				if (result ==1){
    				$("#inputemailerror").css("display","block")
    			}
    			else if (result==2){
    				$("#inputpswderror").css("display","block")
    			}
    			else if(result==3){
    				//redirect to the security welcome page
    				window.location.href="views/securityPage.cfm"
    			}
    			else if(result==4){
    				//redirect to the owner welcome page
    				window.location.href="views/activityPage.cfm"
    			}
    			else{
    				//redirect to the admin welcome page
    				window.location.href="views/adminPage.cfm"
    			}
			}
		});
	});
});

