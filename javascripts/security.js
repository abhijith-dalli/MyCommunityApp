//set deault time and date
$(document).ready(function(){
    let currentdate= new Date();
	let currentdatestring=currentdate.getDate() + "/"+ (currentdate.getMonth()+1)  + "/" + currentdate.getFullYear()
	$("#date").val(currentdatestring)
	let currenttimestring=currentdate.getHours() + " hr : "+ currentdate.getMinutes() +" min";
	$("#time").val(currenttimestring)
});


// upload picture to the local directory
$(document).ready(function(){
	$("#imgupload").click(function(){
		$("#img").remove()
		var imgfield=$("#image") //selecting the image element
		var imgfieldname=imgfield.prop("name") //image
		var firstfile=imgfield.prop("files")[0] //get file name and other properties
		var formdata= new FormData()
		console.log(formdata.entries())
		formdata.append('fieldname',imgfieldname)
		formdata.append(imgfieldname,firstfile)
		$.ajax({
			url:"uploadPic.cfm",
			type:"POST",
			data:formdata,
			enctype: 'multipart/form-data',
			contentType:false,
			processData: false,
            success:function(result){
            	//console.log(result)
            	let img=$("#image")
				let image=img[0].files[0].name 
            	$("#imgDisplayArea").append("<img id='img' src='../media/"+image+"'></img>")
            }
		});
	});
});


//taking the visitor data and inserting it in database and sending message to the owner the details of the visitor
$(document).ready(function(){
	$("#submitbtn").click(function(){
		$("small").css("display","none");
		let flat=$("#flat").val()
		let name=$("#name").val()
		let img=$("#image")
		let image = 0;
		//console.log(img[0].files.length)
		if (img[0].files.length!=0){
			image=img[0].files[0].name
		}
		let time=$("#time").val()
		let date=$("#date").val()
		let rel=$("#rel").val()
		let des=$("#description").val()
		dataObj={"flat":flat,"name":name,"time":time,"date":date,"rel":rel,"des":des,"image":image};
		$.ajax({
			url:"visitorReg.cfm",
			type:"GET",
			data:dataObj,
			dataType:"json",
			success: function(result){
				if (result==1){
					$("#flaterror").css("display","block");
				}
				else if (result==2) {
					$("#nameerror").css("display","block");
				}
				else if (result==3) {
					$("#imageerror").css("display","block");
				}
				else if (result==4) {
					$("#relerror").css("display","block");
				}
				else if (result==5) {
					$("#descerror").css("display","block");
				}
				else{
					// console.log(result.DATA)
					$("#flat").val("0")
					$("#name").val("")
					$("#rel").val("0");
					$("#description").val("")
					$("#image").val("")
					$("#img").remove()
					//alert("Visitor was registered successfully");
					let vid= result.DATA[0][0]
					let umail= result.DATA[0][4]
					let uflat= result.DATA[0][1]
					let uname= result.DATA[0][2]
					let uphone=result.DATA[0][3]
					let msgbody='<b>'+name+' wants to enter your flat: '+uflat+' .Do you want to let them in? <a href="http://localhost:8500/ApartmentManagementWebsite/views/mailMessage.cfm?id='+vid+'">click on the link</a>'
					Email.send({
					    SecureToken : "e61209ab-84b2-475b-9d5a-b28b775d0f7a",
					    To : umail,
					    From : "dalliabhi1@gmail.com",
					    Subject : "Message from the security",
					    Body : msgbody
					}).then(
					  message => alert('Mail was sent succesfully')
					);
					let interval=setInterval(function checkAccess(){
						$.ajax({
							url:"checkingAccess.cfm",
							type:"GET",
							data:{"vid":vid},
							success:function(result){
								if(result==1){
									clearInterval(interval);
									alert("Owner wants to allow "+name+" to flat no: "+flat);
								}
								else if(result==2){
									clearInterval(interval);
									alert("Owner Doesn't want to allow "+name+" to flat no: "+flat);
								}
							}
						});
					},3000);
				}
			}
		});
	});
});




