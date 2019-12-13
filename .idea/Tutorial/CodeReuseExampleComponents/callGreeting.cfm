<cfinclude template="path/to/libraries/Greeting.cfc">
<cfinclude template="path/to/libraries/Person.cfc">

<cfscript>
    objPerson   = new Person( firstName = 'Matt', lastName = 'Gifford' );
    objGreeting = new Greeting( person  = objPerson );
    writeOutput( objGreeting.getGreeting() );
</cfscript>
