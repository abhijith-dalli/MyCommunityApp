<cfset result=application.logandreg.checkValidation(url.flat,url.firstname,url.lastname,url.apartment,url.phonenum,url.phoneregx,url.emailid,url.emailregx,url.password,url.passwordregx,url.confirmpassword)>
<cfoutput>#result#</cfoutput>


