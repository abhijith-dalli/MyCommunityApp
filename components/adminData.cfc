<cfcomponent>
	<cffunction name="validateData" access ="remote" returntype="numeric" >
		<cfargument name="location">
		<cfargument name="apartment">
		<cfargument name="fname">
		<cfargument name="lname">
		<cfargument name="phone">
		<cfargument name="phonex">
		<cfargument name="email">
		<cfargument name="mailx">
		<cfargument name="password">
		<cfargument name="pswdx">
		<cfargument name="cpswd">
		<!--- check if email already exists --->
		<cfquery name="checkEmailExists" datasource="management">
			select * from management.users where email =<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#">
		</cfquery>
		<cfif arguments.location eq 0>
			<cfreturn 1>
		<cfelseif arguments.apartment eq "">
			<cfreturn 2>
		<cfelseif arguments.fname eq "">
			<cfreturn 3>
		<cfelseif arguments.lname eq "">
			<cfreturn 4>
		<cfelseif arguments.phone eq "">
			<cfreturn 5>
		<cfelseif arguments.phonex eq 0>
			<cfreturn 6>
		<cfelseif arguments.mailx eq 0>
			<cfreturn 7>
		<cfelseif checkEmailExists.recordcount gt 0>
			<cfreturn 8>
		<cfelseif arguments.password eq "">
			<cfreturn 9>
		<cfelseif arguments.pswdx eq 0>
			<cfreturn 10>
		<cfelseif arguments.cpswd neq password>
			<cfreturn 11>
		<cfelse>
			<!--- insert a new apartment in apartments table --->
			<cfquery name="insertIntoApartments" datasource="management">
				insert into management.apartments (lid,apartment) values (
					<cfqueryparam cfsqltype="cf_sql_integer" 
							value="#arguments.location#">,
					<cfqueryparam value="#arguments.apartment#">
							)
				returning aid;
			</cfquery>
			<cfset apartmentid=#insertIntoApartments.aid#>

			<!--- insert into users a new security using the apartment id from above --->
			<cfquery name="insertSecurity" datasource="management">
				insert into management.users (flatno,firstname,lastname,phone,email,pswd,usertype,aptid)
					 values (
					 	<cfqueryparam cfsqltype="cf_sql_varchar" value="000">,
						<cfqueryparam value="#arguments.fname#">,
						<cfqueryparam value="#arguments.lname#">,
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.phone#">,
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.email#">,
						<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.password#">,
						<cfqueryparam value="security">,
						<cfqueryparam cfsqltype="cf_sql_integer" value="#apartmentid#"> 
							)
					 returning uid;
			</cfquery>

			<!--- insert security account to the notification table --->
			<cfset userid=#insertSecurity.uid#>
				<cfquery name="insertSecurityToNotify" datasource="management">
				 	insert into management.notifications (userid) values (<cfqueryparam cfsqltype="cf_sql_integer" value="#userid#">);
				</cfquery>
			<cfreturn 12>
		</cfif>
	</cffunction>

	<!--- create a new area --->
	<cffunction name="setNewArea" access ="remote" returntype="numeric">
		<cfargument name="areaname">
			<cfquery name="checkDupArea" datasource="management">
			select * from management.locations where locality=<cfqueryparam value="#arguments.areaname#">
			</cfquery>
			<cfif arguments.areaname eq "">
				<cfreturn 1>
			<cfelseif checkDupArea.recordcount gt 0>
				<cfreturn 2>
			<cfelse>
				<cfquery name="insertNewArea" datasource="management">
					insert into management.locations (locality) values (<cfqueryparam value="#arguments.areaname#">);
				</cfquery>
				<cfreturn 3>
			</cfif>
	</cffunction>

	<!--- to get all the registered apartments --->
	<cffunction name="getRegistrations" access ="remote" returnformat="JSON">
		<cfquery name="getApartmentsList" datasource="management">
			select * from management.users as u 
			join 
			management.apartments as apt 
			on apt.aid=u.aptid 
			join
			management.locations as loc 
			on loc.lid=apt.lid
			where usertype=<cfqueryparam cfsqltype="cf_sql_varchar" value="security">
			order by apt.aid; 
		</cfquery>
		<cfreturn serializeJSON(getApartmentsList)>
	</cffunction>

	<!--- to insert the issue from the home page to database --->
	<cffunction name="insertIssue" access ="remote" returntype="numeric">
		<cfargument name="fname">
		<cfargument name="lname">
		<cfargument name="email">
		<cfargument name="message">
		<!--- query to insert the data into database --->
		<cfquery name="insertUserIssue" datasource="management">
			insert into management.issues (fname,lname,email,msg) values(
				<cfqueryparam value="#arguments.fname#">,
				<cfqueryparam value="#arguments.lname#">,
				<cfqueryparam value="#arguments.email#">,
				<cfqueryparam value="#arguments.message#">);
		</cfquery>
		<cfreturn 1>
	</cffunction>

	<!--- to clear issue after clicking clear  --->
	<cffunction name="clearIssue" access ="remote" returntype="numeric">
		<cfargument name="issueid">
		<!--- query to clear the issue in database --->
		<cfquery name="clearIssueId" datasource="management">
			delete from management.issues where iid=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.issueid#">
		</cfquery>
		<cfreturn 1>
	</cffunction>
</cfcomponent>