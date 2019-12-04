<!---> Quick example to kick off; <--->
<cfparam name = "firstName" default = "Matt">
<cfparam name = "lastName"  default = "Gifford">

<cfset fullName = firstName & " " & lastName>

<cfoutput>
    Hello, #fullName#!
</cfoutput>

<!---> A quick example of function syntax in a simple function stub which requires a first and last name to be executed; <--->
<cfscript>
    public void function myFunction(
        required string firstName = '',
        required string lastName = '',
            ){
                var fullName = arguments.firstName & ' ' & arguments.lastName;
                return fullName;
            }
</cfscript>

<!---> Then proceed by executing the function, providing the parameters that need to be used; <--->
<cfset fullName = getFullName ( 'Dieter', 'Mateschitz' )>

<!---> You can then reuse this function to pass variables to a new method, for example;
!!!! This is not completely clear to me yet. It should take arguments from arguments.firstName & arguments.lastName !!!! <--->
<cfscript>
    public string function getGreeting(
            string firstName = '',
            string lastName  = ''
            ){
        var fullName = getFullName( argumentCollection = arguments );
// We can do more with the fullName variable here
    }
</cfscript>

<!---> Then call the function to execute <--->
<cfscript>
    fullName = getFullName( firstName='Matt', lastName='Gifford' );
    writeOutput( fullName );
</cfscript>