<!---> This code is not supposed to run, it is merely a quick reference guide for the subjects that have been addressed; <--->

<!---> Setting a variable; <--->
<cfset ThisIs = "fun">

<!---> Looking at variable's contents; <--->
<cfdump var = "#ThisIs#">

<!---> The # signs force ColdFusion to evaluate the contents of the variable or calculation; <--->
<cfdump var = "#1 + 2#"><br>

<!---> An example of printing out the current date; <--->
<cfset DateToday = now()>
<cfdump var = "#DateToday#">

