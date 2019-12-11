<!--- Main page --->

<cfinclude template="path/to/libraries/greetingCustomizer.cfm">
<!--- Another way is;  <cfinclude template="path/to/libraries/greetings.cfm"> --->

<cf_greeting firstName="Matt" lastName="Gifford">

<cfset fullName = getFullName()>

<cfoutput>
    Hello, #fullName#!
</cfoutput>