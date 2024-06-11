// upload event picture to the local directory
$(document).ready(function(){
	$("#imgupload").click(function(){
		$("#img").remove()
		var imgfield=$("#image")
		var imgfieldname=imgfield.prop("name")
		var firstfile=imgfield.prop("files")[0]
		//console.log(imgfield,imgfieldname,firstfile)
		var formdata= new FormData()
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
            	console.log(result)
            	let img=$("#image")
				let image=img[0].files[0].name 
            	$("#imgDisplayArea").append("<img id='img' src='../media/"+image+"'></img>")
            }
		});
	});
});


//adding date picker and time picker
$("document").ready(function () {
	    $("#edate").datepicker({
	        numberOfMonths: 1,
	        changeYear: true,
	        changeMonth: true,
	        minDate: new Date(),
	        maxDate: "+1M",
	        dateFormat:"yy-mm-dd"
	    });
	    $('#etime').timepicker({
		    timeFormat: 'h:mm p',
		    interval: 30,
		    minTime: '24',
		    maxTime: '11:59pm',
		    defaultTime: '16',
		    startTime: '12:00',
		    dynamic: false,
		    dropdown: true,
		    scrollbar: false
		});
});

//validation for adding events into database
$(document).ready(function(){
	$("#etime").val("")
	$("#submitbtn").click(function(){
		$("small").css("display","none")
		let eflat=$("#eflat").val()
		let ename=$("#ename").val()
		let img=$("#image")
		let image = 0;
		console.log(img[0].files.length)
		if (img[0].files.length!=0){
			image=img[0].files[0].name
		}
		let uname=$("#uname").val()
		let edate=$("#edate").val()
		let etime=$("#etime").val()
		let edes=$("#edescription").val()
		let eloc=$("#elocation").val()
		let eventObj={"eflat":eflat,"ename":ename,"etime":etime,"edate":edate,"edes":edes,"image":image,"uname":uname,"eloc":eloc};
		$.ajax({
			url:"eventReg.cfm",
			type:"GET",
			data:eventObj,
			dataType:"json",
			success: function(result){
				if (result==1){
					$("#enameerror").css("display","block")
				}
				else if (result==2){
					$("#imageerror").css("display","block")
				}
				else if (result==3){
					$("#unameerror").css("display","block")
				}
				else if (result==4){
					$("#edateerror").css("display","block")
				}
				else if (result==5){
					$("#etimeerror").css("display","block")
				}
				else if (result==6){
					$("#elocationerror").css("display","block")
				}
				else if (result==7){
					$("#edescerror").css("display","block")
				}
				else{
					alert("Event added successful")
					window.location.reload();
				}
			}
		});
	});
});






