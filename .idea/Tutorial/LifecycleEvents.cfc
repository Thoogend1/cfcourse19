component {
<!---> onApplicationStart code that is run at the very first time you start the application.
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
//handle the exception
        }
    }

<!---> onSessionStart code is run every time a user makes a request to or from your application either
after the user's session has expired, or when they have never used the application before. <--->
    function OnSessionStart()
    {
        session.loggedin = false;
        return true;
    }

<!---> onRequestEnd code is run when the .cfm file reverts back to the main method.
Usefull for, for example, terminating priviledges or logging. <--->
    function OnRequestEnd()
    {
        cfsetting.showdebugout = "false";
        cfdump.var = "#application#";
        label = "onRequestEnd";
        cfreturn = true;
    }

<!---> onSessionEnd code is executed once the session of the user times out, or is terminated. <--->


<!---> onApplicationEnd code is broadcast when the application times out or shuts down.
You don't usually do this unless an application is no longer used, or is about to be upgraded or restarted. <--->

<!---> onError code is broadcast in the event of an un-caught exception, including any you may throw manually.
You can use/abuse this as a last line of defense for errors that might have slipped into production. <--->
}
