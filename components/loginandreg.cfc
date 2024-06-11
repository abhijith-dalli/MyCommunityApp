<cfcomponent>
	<!--- validation for registration form --->
	<cffunction name="checkValidation" access ="remote" returntype="numeric">
		<cfargument name="flatno">
		<cfargument name="fname">
		<cfargument name="lname">
		<cfargument name="apartment">
		<cfargument name="phone">
		<cfargument name="phonex">
		<cfargument name="mail">
		<cfargument name="mailx">
		<cfargument name="pswd">
		<cfargument name="pswdx">
		<cfargument name="cpswd">
	<!--- query to check if the flat already registered in that particular apartmnet --->
	<cfquery name="checkDupFlat" datasource="management">
		select * from management.users
		where flatno=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.flatno#"> and aptid=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.apartment#">
	</cfquery>
	<!--- query to check if the mail id already exists --->
	<cfquery name="checkDupMail" datasource="management">
		select * from management.users where email=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.mail#">
	</cfquery> 
	<!--- query to check if the password with same combination already exists --->
	<!--- <cfquery name="checkDupPass" datasource="management">
		select * from management.users where pswd=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pswd#">
	</cfquery> --->
			<cfif arguments.flatno eq "">
				<cfreturn 1>
			<cfelseif checkDupFlat.recordcount gt 0>
				<cfreturn 2>
			<cfelseif arguments.fname eq "">
				<cfreturn 3>
			<cfelseif arguments.lname eq "">
				<cfreturn 4>
			<cfelseif arguments.apartment eq 0>
				<cfreturn 5>
			<cfelseif arguments.phonex eq 0>
				<cfreturn 6>
			<cfelseif arguments.mailx eq 0>
				<cfreturn 7>
			<cfelseif checkDupMail.recordcount gt 0>
				<cfreturn 8>
			<cfelseif arguments.pswdx eq 0>
				<cfreturn 9>
			<!--- <cfelseif checkDupPass.recordcount gt 0>
				<cfreturn 10> --->
			<cfelseif arguments.pswd neq arguments.cpswd>
				<cfreturn 11>
			<cfelse>
				<!--- query to insert data into database atfer the validation is successful --->
				<cfquery name="insertUser" datasource="management">
					insert into management.users (flatno,firstname,lastname,phone,email,pswd,aptid) values (
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.flatno#">,
						<cfqueryparam value="#arguments.fname#">,
						<cfqueryparam value="#arguments.lname#">,
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.phone#">,
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.mail#">,
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.pswd#">,
						<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.apartment#">)
						returning uid;
				</cfquery>
				<cfset userid=#insertUser.uid#>
				<cfquery name="insertFlatToNotify" datasource="management">
				 	insert into management.notifications (userid) values (<cfqueryparam cfsqltype="cf_sql_integer" value="#userid#">);
				</cfquery>
				<cfreturn 12>
			</cfif>
	</cffunction>


	<!--- get apartments list accroding to the location id --->
	<cffunction name="getApartments" access ="remote" returnformat="JSON">
		<cfargument name="id">
		<cfquery name="getApartmentList" datasource="management">
			select * from management.apartments where 
			lid=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.id#">;
		</cfquery>
		<cfreturn serializeJSON(getApartmentList)>
	</cffunction>


	<!--- validation for login --->
	<cffunction name="chechLogin"  access ="remote" returntype="numeric">
		<cfargument name="email">
		<cfargument name="pswd">
		<!--- query to get mail and password and to check if mail exists--->
		<cfquery name=checkEmail datasource="management">
		select * from management.users 
		where email=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#">
		</cfquery>

		<!--- to  get all the user details such as apartments and locations --->
		<cfquery name="getDetails" datasource="management">
			select * from management.users  join management.apartments as building 
			on aid=aptid join management.locations as area 
			on building.lid=area.lid
			where email=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#">
		</cfquery>

		<cfif checkEmail.recordcount lt 1>
			<cfreturn 1>
		<cfelseif #checkEmail.pswd# neq #arguments.pswd#>
			<cfreturn 2>
		<cfelseif #checkEmail.usertype# eq 'security'>
			<cfset session.userid=#getDetails.uid#>
			<cfset session.uname=#getDetails.firstname#>
			<cfset session.lname=#getDetails.lastname#>
			<cfset session.email=#arguments.email#>
			<cfset session.utype=#getDetails.usertype#>
			<cfset session.flat=#getDetails.flatno#>
			<cfset session.phone=#getDetails.phone#>
			<cfset session.apartment=#getDetails.aptid#>
			<cfset session.aptname=#getDetails.apartment#>
			<cfset session.location=#getDetails.locality#>
			<cfreturn 3>
		<cfelseif #checkEmail.usertype# eq 'owner'>
			<cfset session.userid=#getDetails.uid#>
			<cfset session.uname=#getDetails.firstname#>
			<cfset session.lname=#getDetails.lastname#>
			<cfset session.email=#arguments.email#>
			<cfset session.utype=#getDetails.usertype#>
			<cfset session.flat=#getDetails.flatno#>
			<cfset session.phone=#getDetails.phone#>
			<cfset session.apartment=#getDetails.aptid#>
			<cfset session.aptname=#getDetails.apartment#>
			<cfset session.location=#getDetails.locality#>
			<cfreturn 4>
		<cfelse>
			<!--- optional and might use later--->
			<cfset session.userid=#checkEmail.uid#>
			<cfset session.uname=#checkEmail.firstname#>
			<cfset session.lname=#checkEmail.lastname#>
			<cfset session.email=#arguments.email#>
			<cfset session.utype=#checkEmail.usertype#>
			<cfset session.flat=#checkEmail.flatno#>
			<cfset session.phone=#checkEmail.phone#>
			<cfset session.apartment=#checkEmail.aptid#>
			<cfreturn 5>
		</cfif>
	</cffunction>
</cfcomponent>

