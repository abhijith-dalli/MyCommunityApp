<cfcomponent>
<cfset this.name = "ApartmentManagement">
<cfset this.applicationtimeout=createtimespan(0,0,0,5)>
<cfset this.sessionmanagement="true">
<cfset this.sessiontimeout=createtimespan(0,2,0,0)>
	<!--- application items --->
	<cffunction name="OnApplicationStart">
		 <cfset application.logandreg=createObject("component",
		 	"components.loginandreg")>
		 <cfset application.security=createObject("component","components.securityData")>
		 <cfset application.event=createObject("component","components.eventData")>
		 <cfset application.service=createObject("component","components.serviceData")>
		 <cfset application.profile=createObject("component","components.profileData")>
		 <cfset application.admin=createObject("component","components.adminData")>
	</cffunction>
</cfcomponent>
