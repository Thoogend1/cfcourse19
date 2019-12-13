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
        } catch (any e) {
//handle the exception
        }
    }

<!---> onRequestStart code is run before every request the application sends.
Usefull for example to set veriables that should be present on every page in a site. <--->

<!---> onSessionStart code is run every time a user makes a request to or from your application either
after the user's session has expired, or when they have never used the application before. <--->

<!---> onRequestEnd <--->

<!---> onSessionEnd <--->


<!---> onApplicationEnd <--->

<!---> onError <--->
}
