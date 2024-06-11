<cfcomponent>
	<!--- validation for edit profile --->
	<cffunction name="checkValidation" access ="remote" returntype="numeric">
		<cfargument name="fname">
		<cfargument name="lname">
		<cfargument name="phone">
		<cfargument name="phonex">
		<cfargument name="mail">
		<cfargument name="mailx">
		<cfargument name="pswd">
		<cfargument name="pswdx">
		<cfargument name="cpswd">
		<!--- query to check if the mail id already exists while editing --->
		<cfquery name="checkDupMail" datasource="management">
			select * from management.users where email=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.mail#"> and 
			flatno!=<cfqueryparam value="#session.flat#" cfsqltype="cf_sql_varchar">
		</cfquery> 
		<!--- query to check if the password with same combination already exists  while editing--->
		<cfquery name="checkDupPass" datasource="management">
			select * from management.users where pswd=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pswd#">
		</cfquery> 
				<cfif fname eq "">
					<cfreturn 1>
				<cfelseif lname eq "">
					<cfreturn 2>
				<cfelseif phonex eq 0>
					<cfreturn 3>
				<cfelseif mailx eq 0>
					<cfreturn 4>
				<cfelseif checkDupMail.recordcount gt 0>
					<cfreturn 5>
				<cfelseif pswdx eq 0>
					<cfreturn 6>
				<cfelseif checkDupPass.recordcount gt 0>
					<cfreturn 7>
				<cfelseif pswd neq cpswd>
					<cfreturn 8>
				<cfelse>
					<!--- query to insert data into database atfer the validation is successful --->
					<cfquery name="alterUser" datasource="management">
					update management.users set 
						firstname=<cfqueryparam value="#arguments.fname#">,
						lastname=<cfqueryparam value="#arguments.lname#">,
						phone=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.phone#">,
						email=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.mail#">,
						pswd=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pswd#">
						where uid = <cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#">
					</cfquery>
					<cfset session.uname=#arguments.fname#>
					<cfset session.lname=#arguments.lname#>
					<cfset session.email=#arguments.mail#>
					<cfset session.phone=#arguments.phone#>
					<cfreturn 9>
				</cfif>
	</cffunction>
	
	<!--- checking if there are any posts that are not viewed --->
	<cffunction name="checkNotify" access ="remote" returnformat="JSON">
		<cfquery name="checkNumberOfNotify" datasource="management">
			select unseen from management.notifications where userid=<cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#">
		</cfquery>
		<cfreturn serializeJSON(checkNumberOfNotify)>
	</cffunction>

	<!--- update notification to all seen --->
	<cffunction name="updateNotification" access ="remote" returntype="numeric">
		<cfquery name="updateNotify"datasource="management">
		update management.notifications set unseen=0 where 
			userid=<cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#">;
		</cfquery>
		<cfreturn 1>
	</cffunction>

	<!--- to display who entered the flat in activities --->
	<cffunction name="getVisitorsForFlat" access ="remote" returnformat="JSON">
		<cfquery name="visitorsData" datasource="management">
			select * from management.visitors where userid = <cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#"> order by vid desc;
		</cfquery>
		<cfreturn #serializeJSON(visitorsData)#>
	</cffunction>	
</cfcomponent>