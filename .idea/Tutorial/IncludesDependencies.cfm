<!---> This code is not supposed to run, it is merely a quick reference guide for the subjects that have been addressed; <--->

<!---> Include functions from other .cfm files in your script by cfincluding them to your page.
You usually do this at the top of the page. <--->
<cfinclude template="path/to/libraries/Functions.cfm">

<!---> You can then use functions from the other file. <--->
<cfset fullName = getFullName( firstName="Matt", lastName="Gifford" )>

<cfoutput>
    Hello, #fullName#!
</cfoutput>

<!---> Bear in mind that all the functions and variables of functions.cfm are inherited.
This may create unnecessary dependencies. For example the fact that variables are now defined in the other .cfm.

This could be avoided by removing the variables in Functions.cfm, and moving the declaration of the variables to this file. <--->
<cfset firstName = "Matt">
<cfset lastName  = "Gifford">

<cfinclude template="path/to/libraries/greetingCustomizer.cfm">

<cfset fullName = getFullName()>

<cfoutput>
    Hello, #fullName#!
</cfoutput>

<!---> Functions.cfm would change to;
<cffunction name="getFullName" output="false" access="public" returnType="string">
    <cfset var fullName = firstName & " " & lastName>
    <cfreturn fullName>
</cffunction>
<--->
