//to take off the notification batch once the page is visited
$(document).ready(function(){
   $.ajax({
	  url:"checkNotifySeen.cfm",
	  type:"GET",
	  success: function(result){
	     $(".button_badge").css("display","none")
     		}
   	});
 });

//to append card on each event iteration.
$(document).ready(function(){
	let currentdate= new Date();
	let currentdatestring=currentdate.getFullYear()+"-"+("0" + (currentdate.getMonth() + 1)).slice(-2)+"-"+("0" + (currentdate.getDate())).slice(-2)
	//console.log(currentdatestring)
		$.ajax({
			type:"GET",
			url:"appendEvent.cfm",
			data:{"date":currentdatestring},
			success: function(result){
				let eventdata = JSON.parse(result).DATA
				//console.log(eventdata.length)
				if(eventdata.length >0){
					for(let i=0;i<eventdata.length;i++){
						//console.log(eventdata)
						let card = '<div class="col-md-4 col-lg-4 col-sm-6 mt-4"> <div class="blog-grid"><div class="blog-grid-img position-relative"><img alt="img" src="../media/'+eventdata[i][11]+'"></div> <div class="blog-grid-text p-4"> <h3 class="mb-3">'+eventdata[i][12]+'</h3> <p class="display-50">'+eventdata[i][14]+'.</p> <div cla s="meta meta-style"> <ul> <li><i class="fas fa-calendar-alt"></i> '+eventdata[i][15]+' , '+eventdata[i][16]+'</li> <li><i class="fas fa-user"></i>'+eventdata[i][13]+'</li> <li><i class="fa-solid fa-building"></i>'+eventdata[i][21]+' ('+eventdata[i][10]+')</li> <li><i class="fa-solid fa-phone"></i>'+eventdata[i][4]+'</li> <li><i class="fa-solid fa-location-dot"></i>'+eventdata[i][17]+'</li> </ul> </div> </div> </div> </div>';
						$("#insertDiv").append(card)
					}
				}
				else{
						//empty card to display
						let card ='<div class="col-md-4 col-lg-4 col-sm-6 mt-4" > <div class="blog-grid"> <div class="blog-grid-text p-4"> <h3 class="mb-3">Event name</h3> <p class="display-50">There are no any upcoming events. We will keep you posted if there is any event soon.</p> <div class="meta meta-style"> <ul> <li><i class="fas fa-calendar-alt"></i>  Date,Time</li> <li><i class="fas fa-user"></i>User</li> <li><i class="fa-solid fa-building"></i>FlatNo: </li> <li><i class="fa-solid fa-location-dot"></i>Location</li> </ul> </div> </div> </div> </div>';
						$("#insertDiv").append(card)
				}
			}
	});
});

//to append a box on each service iteration.
$(document).ready(function(){
	let currentdate= new Date();
	let currentdatestring=currentdate.getFullYear()+"-"+("0" + (currentdate.getMonth())).slice(-2)+"-"+("0" + (currentdate.getDate())).slice(-2)
		$.ajax({
			type:"GET",
			url:"appendService.cfm",
			data:{"date":currentdatestring},
			success: function(result){
				let servicedata = JSON.parse(result).DATA
				if(servicedata.length >0){
					for(let i=0;i<servicedata.length;i++){
						//console.log(servicedata)
						let servicecard = '<div class="testimonial-box"> <div class="box-top"> <div class="profile"> <div class="name-user"><strong>'+servicedata[i][12]+' ('+servicedata[i][13]+')</strong> <span>@'+servicedata[i][2].replace(" ","")+''+servicedata[i][3].replace(" ","")+'</span> </div> </div> <div class="reviews"> <p>Rating: ('+servicedata[i][14]+'.0/5.0)</p> </div> </div> <div class="client-comment"> <p>'+servicedata[i][15]+'</p> </div> <div class="meta meta-style-2"> <ul> <li><i class="fa-solid fa-building"></i>  '+servicedata[i][21]+' ('+servicedata[i][10]+')</li> <li><i class="fa-solid fa-phone"></i>  '+servicedata[i][17]+'</li> <li><i class="fa-solid fa-calendar-alt"></i>  '+servicedata[i][16]+'</li> </ul> </div> </div>'
						$("#insertService").append(servicecard)
					}
				}
				else{
					// empty card to display
					let servicecard = '<div class="testimonial-box"> <div class="box-top"> <div class="profile"> <div class="name-user"> <strong>Review person name (Service)</strong> <span>@Owner name (Flat No.)</span> </div> </div> <div class="reviews"> <p>Rating: (?/5.0)</p> </div> </div> <div class="client-comment"> <p>There are no reviews that anyone has uploaded. You can view reviews when someone has uploaded .</p> </div> <div class="meta meta-style-2"> <ul> <li><i class="fa-solid fa-phone"></i> Phone Number.</li> <li><i class="fa-solid fa-calendar-alt"></i> Date of review.</li> </ul> </div> </div>'
					$("#insertService").append(servicecard)
				}
		}
	});
});

//to report an issue and insert it into database.
$(document).ready(function(){
	$("#issuebtn").click(function(){
		$("small").css("display","none")
		if($("#fname").val()==""){
			$("#fnameerror").css("display","block")
		}
		else if($("#lname").val()==""){
			$("#lnameerror").css("display","block")
		}
		else if((/^[a-z 0-9_]+@[a-z 0-9]+\.[a-z]{2,}$/).test($("#email").val())==""){
			$("#emailerror").css("display","block")
		}
		else if($("#msg").val()==""){
			$("#msgerror").css("display","block")
		}
		else{
			$.ajax({
				type:"GET",
				url:"insertIssue.cfm",
				data:{"fname":$("#fname").val(),"lname":$("#lname").val(),"email":$("#email").val(),"msg":$("#msg").val()},
				success:function(result){
					alert("Thank you for your response");
					$("input").val("")
					$("textarea").val("")
				}
			});
		}
	});
});
