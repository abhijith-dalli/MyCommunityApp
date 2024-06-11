<cfcomponent>
	<!--- validating the event registration  and inserting it into db --->
	<cffunction name="validateEvent" access ="remote" returntype="numeric">
		<cfargument name="eflat">
		<cfargument name="ename">
		<cfargument name="etime">
		<cfargument name="edate">
		<cfargument name="edes">
		<cfargument name="image">
		<cfargument name="uname">
		<cfargument name="eloc">
		<cfif arguments.ename eq "">
			<cfreturn 1>
		<cfelseif arguments.image eq 0>
			<cfreturn 2>
		<cfelseif arguments.uname eq "">
			<cfreturn 3>
		<cfelseif arguments.edate eq "">
			<cfreturn 4>
		<cfelseif arguments.etime eq "">
			<cfreturn 5>
		<cfelseif arguments.eloc eq "">
			<cfreturn 6>
		<cfelseif arguments.edes eq "">
			<cfreturn 7>
		<cfelse>
			<cfquery name="insertEventDb" datasource="management">
				insert into management.events (flat,ephoto,ename,uname,description,edate,etime,elocation,userid) values(
					<cfqueryparam value="#arguments.eflat#" cfsqltype="cf_sql_varchar">,
					<cfqueryparam value="#arguments.image#">,
					<cfqueryparam value="#arguments.ename#">,
					<cfqueryparam value="#arguments.uname#">,
					<cfqueryparam value="#arguments.edes#">,
					<cfqueryparam value="#arguments.edate#">,
					<cfqueryparam value="#arguments.etime#">,
					<cfqueryparam value="#arguments.eloc#">,
					<cfqueryparam cfsqltype="cf_sql_integer" value="#session.userid#">
					);
			</cfquery>
			<cfquery name="increamentNotify" datasource="management">
				update management.notifications set unseen = unseen +1 where sno > 0
			</cfquery>
			<cfreturn 0>
		</cfif>
	</cffunction>

	<!--- get all the data in events to display as posts --->
	<cffunction name="getEventsOrdered" access ="remote" returnformat="JSON">
		<cfargument name="date">
		<cfquery name="getEvents" datasource="management">
			select * from 
			management.users join management.events
			on userid=uid join management.apartments on aptid=aid 
			where edate>=<cfqueryparam value="#arguments.date#"> 
			order by edate,etime;
		</cfquery>
		<cfreturn serializeJSON(getEvents)>
	</cffunction>


	<!--- get events of individual flat --->
	<cffunction name="getEventsOfFlat" access ="remote" returnformat="JSON">
		<cfquery name="eventsOfFlat" datasource="management">
		select * from management.events where userid = <cfqueryparam value="#session.userid#" cfsqltype="cf_sql_integer">
		</cfquery>
		<cfreturn serializeJSON(eventsOfFlat)>
	</cffunction>


	<!--- get each event data according to the event id --->
	<cffunction name="getEachEvent" access ="remote" returnformat="JSON">
		<cfargument name="eid">
		<cfquery name="getEachEventData" datasource="management">
			select * from management.events where 
			eid = 
			<cfqueryparam cfsqltype="cf_sql_integer" value="#arguments.eid#">;
		</cfquery>
		<cfreturn serializeJSON(getEachEventData)>
	</cffunction>
</cfcomponent>