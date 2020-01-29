component {
<!---> onApplicationStart code is run at the very first time you start the application.
For example after a reboot <--->
    function onApplicationStart(){
        application.datasource = "my_database";
        return true;
    }

<!---> onRequest code is run every time a user makes a request to or from your application.
This request is broadcast after onRequestStart <--->
    function onRequest( string targetPage )
    {
        try {
            var targetPage = targetPage;
        }
        catch (any e) {
//handle the exception
        }
    }

<!---> onRequestStart code is run before every request the application sends.
Usefull for example to set veriables that should be present on every page in a site. <--->
    function onRequestStart( string targetPage )
    {
        try {
            var targetPage = targetPage;
        }
        catch (any e) {
//code to handle the exception
        }
    }

<!---> onSessionStart code is run every time a user makes a request to or from your application either
after the user's session has expired, or when they have never used the application before. <--->
    function OnSessionStart()
    {
        session.loggedin = false;
        return true;
    }

<!---> onRequestEnd code is run when the .cfm or .cfc file reverts back to the main method.
Usefull for, for example, terminating priviledges or logging. <--->
    function OnRequestEnd()
    {
        cfsetting.showdebugout = "false";
        cfdump.var = "#application#";
        label = "onRequestEnd";
        cfreturn = true;
    }

<!---> onSessionEnd code is executed once the session of the user times out, or is terminated. <--->
    function OnSessionEnd()
    {
        cfdump.var = "#appliation#";
        label = 'onSessionEnd';
        cfreturn = true;
    }

<!---> onApplicationEnd code is broadcast when the application times out or shuts down.
This code isn't usually run unless the application is no longer used, or is about to be upgraded or restarted.
You can forexample write contents of variables or datasources that are cached to a file.<--->
    function OnApplicationEnd()
    {
        name = "onApplicationEnd";
        access = "public";
        returntype = "void";
        output = "false";
        hint = "I tear down the application.";

            <!--- Define arguments. --->
            cfargument.name = "applicationScope";
            type = "any";
            scope.required ="true";
            hint = "I am the application scope.";


            <!--- Log the application length. --->
            cfdump.var="#arguments.applicationScope.dateInitialized# : #now()#";
            output="#expandPath( './log.htm' )#";
            format="html";
     }

<!---> onError code is broadcast in the event of an un-caught exception, including any you may throw manually.
You can use/abuse this as a last line of defense for errors that might have slipped into production. <--->


}
