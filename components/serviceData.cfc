<cfcomponent>
	<!--- validate service --->
	<cffunction name="checkValidation" access ="remote" returntype="numeric">
		<cfargument name="name">
		<cfargument name="service">
		<cfargument name="rating">
		<cfargument name="desc">
		<cfargument name="date">
		<cfargument name="phone">
		<cfif arguments.name eq "">
			<cfreturn 1>
		<cfelseif arguments.service eq "">
			<cfreturn 2>
		<cfelseif arguments.rating eq 0>
			<cfreturn 3>
		<cfelseif arguments.phone eq "">
			<cfreturn 4>
		<cfelseif arguments.desc eq "">
			<cfreturn 5>
		<cfelse>
			<cfquery name="addServiceInDb" datasource="management">
				insert into management.services(flat,uname,sname,
					service,rating,description,dateofentry,phone,userid) values
					(<cfqueryparam cfsqltype="cf_sql_varchar" value="#session.flat#">,
						<cfqueryparam value="#session.uname#">,
						<cfqueryparam value="#arguments.name#">,
						<cfqueryparam value="#arguments.service#">,
						<cfqueryparam value="#arguments.rating#">,
						<cfqueryparam value="#arguments.desc#">,
						<cfqueryparam value="#arguments.date#">,
						<cfqueryparam value="#arguments.phone#">,
						<cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#">);
			</cfquery>
			<cfquery name="increamentNotify" datasource="management">
				update management.notifications set unseen = unseen +1 where sno > 0
			</cfquery>
			<cfreturn 6>
		</cfif>
	</cffunction>

	<!--- to append all services in service card --->
	<cffunction name="appendService" access ="remote" returnformat="JSON">
		<cfargument name="date">
		<cfquery name="getServices" datasource="management">
			select * from 
			management.users join management.services
			on userid=uid join management.apartments 
			on aptid=aid 
			where dateofentry >= <cfqueryparam value="#arguments.date#">  ;
		</cfquery>
		<cfreturn serializeJSON(getServices)>
	</cffunction>

	<!--- to get all the servies uploaded by the user --->
	<cffunction name="getServices" access ="remote" returnformat="JSON">
		<cfquery name="getAllServicesByFlat" datasource="management">
			select * from management.users join management.services
			on userid=uid join management.apartments 
			on aptid=aid 
			where userid=<cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#">;
		</cfquery>
		<cfreturn serializeJSON(getAllServicesByFlat)>
	</cffunction>
</cfcomponent>