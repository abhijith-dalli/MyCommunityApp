<cfcomponent>
	<!--- getting data from visitor form and saving it in database --->
	<cffunction name="checkValidation" access ="remote" returnformat="JSON">
		<cfargument name="flat">
		<cfargument name="name">
		<cfargument name="time">
		<cfargument name="date">		
		<cfargument name="rel">
		<cfargument name="des">
		<cfargument name="image">
		<cfif arguments.flat eq 0>
			<cfreturn 1>
		<cfelseif arguments.name eq "">
			<cfreturn 2>
		<cfelseif arguments.image eq 0>
			<cfreturn 3>
		<cfelseif arguments.rel eq 0>
			<cfreturn 4>
		<cfelseif arguments.des eq "">
			<cfreturn 5>
		<cfelse>
			<cfset approval="Null">
			<!--- query to get the userid of owner--->
			<cfquery name="getuid" datasource="management">
				select uid from management.users 
				where 
				flatno=<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.flat#"> 
				and
				aptid =<cfqueryparam cfsqltype="cf_sql_integer" value="#session.apartment#">;
			</cfquery>
			<!--- to insert the visitor data into visitors database --->
			<cfquery name="regVisitor" datasource="management">
			insert into management.visitors (flat,vname,vtime,vdate,relation,description,approval,vphoto,userid) values(
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.flat#">,
				<cfqueryparam value="#arguments.name#">,
				<cfqueryparam value="#arguments.time#">,
				<cfqueryparam value="#arguments.date#">,
				<cfqueryparam cfsqltype="cf_sql_varchar" value="#arguments.rel#">,
				<cfqueryparam value="#arguments.des#">,
				<cfqueryparam value="#approval#">,
				<cfqueryparam value="#arguments.image#">,
				<cfqueryparam cfsqltype="cf_sql_integer" value="#getuid.uid#">
				)	
			returning vid;
			</cfquery>
			<!--- to get mail id of owner of that apartment and send message --->
			<cfquery name="getMailid" datasource="management">
				select vid,flatno,firstname,phone,email from 
				(select * from management.visitors where vid=<cfqueryparam cfsqltype="cf_sql_integer" value="#regVisitor.vid#">)
				join
				(select * from management.users) 
					on userid=uid ;
			</cfquery>
			<cfreturn #serializeJSON(getMailid)#>
		</cfif>
	</cffunction>
	
	<!--- getting visitors data to display in datatable --->
	<cffunction name="getVisitorsData" access ="remote" returnformat="JSON">
		<cfquery name="visitorsData" datasource="management">
			select * from 
			(select * from management.visitors)
				join
			(select * from management.users where aptid=<cfqueryparam cfsqltype="cf_sql_integer" value="#session.apartment#">) 
			on userid=uid 
			order by vid desc;
		</cfquery>
		<cfreturn #serializeJSON(visitorsData)#>
	</cffunction>

	<!--- geting visitors data into mail link --->
	<cffunction name="visitorDetailsToMail" access ="remote" returnformat="JSON">
		<cfargument name="vid">
		<cfquery name="getVisitorDetails" datasource="management">
			select vid,vname,vtime,vdate,relation,description,vphoto  from 
			management.visitors where vid=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.vid#">;
		</cfquery>
		<cfreturn serializeJSON(getVisitorDetails)>
	</cffunction>

	<!--- save allow access into database --->
	<cffunction name="allowAccess" access ="remote" returntype="numeric">
		<cfargument name="access">
		<cfargument name="vid">
		<cfquery name="updateAccessAllow" datasource="management">
			update management.visitors set approval = <cfqueryparam value="#arguments.access#"> where vid=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.vid#">;
		</cfquery>	
		<cfreturn 1>
	</cffunction>

	<!--- save Decline access into database --->
	<cffunction name="declineAccess" access ="remote" returntype="numeric">
		<cfargument name="access">
		<cfargument name="vid">
		<cfquery name="updateAccessDecline" datasource="management">
			update management.visitors set approval = <cfqueryparam value="#arguments.access#"> where vid=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.vid#">;
		</cfquery>	
		<cfreturn 1>
	</cffunction>

	<!--- checking access for every 2-5 sec --->
	<cffunction name="CheckAccess" access ="remote" returntype="numeric">
		<cfargument name="vid">
		<cfquery name="checkingAccess" datasource="management">
			select * from management.visitors where vid=<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.vid#">;
		</cfquery>
		<cfif checkingAccess.approval eq 'Allow'>
			<cfreturn 1>
		<cfelseif checkingAccess.approval eq 'Decline'>
			<cfreturn 2>
		<cfelse>
			<cfreturn 3>
		</cfif>
	</cffunction>
</cfcomponent>
