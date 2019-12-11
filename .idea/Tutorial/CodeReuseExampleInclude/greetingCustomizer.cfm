<!--- Constructs the fullName --->
<cffunction name="getFullName" output="false" access="public" returnType="string">
    <cfset var fullName = firstName & " " & lastName>
    <cfreturn fullName>
</cffunction>
