<cfset result=application.admin.insertIssue(url.fname,url.lname,url.email,url.msg)>
<cfoutput>#result#</cfoutput>