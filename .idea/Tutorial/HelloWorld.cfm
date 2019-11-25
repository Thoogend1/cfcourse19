<!---> This code is not supposed to run, it is merely a quick reference guide for the subjects that have been addressed; <--->

<!---> Setting a variable; <--->
<cfset ThisIs = "fun">
<cfset StringAndNumber = "Hello" & 42>

<!---> Setting a long(er) string uses cfsavecontent <--->
<cfsavecontent variable="EmailSignature">
    Kind regards,

    Person's name
</cfsavecontent>
<cfoutput>#EmailSignature#</cfoutput>

<!---> Looking at variable's contents (use cfoutput for print); <--->
<cfdump var = "#ThisIs#">

<!---> The # signs force ColdFusion to evaluate the contents of the variable or calculation; <--->
<cfdump var = "#1 + 2#"><br>

<!---> An example of printing out the current date; <--->
<cfset DateToday = now()>
<cfdump var = "#DateToday#">

<!---> An example of printing a string with the current date; <--->
<cfset DateToday = "Today is: #now()#">
<cfdump var = "#DateToday#">
<!---> "<cfset DateToday = "Today is: " & now()>" is a valid alternative with concatenation. <--->

<!---> Demonstrating cfoutput for printing simple values (Strings, Numbers, Dates, Times, etc) <--->
<cfset DateToday = "Today is: #now()#">
<cfoutput>#DateToday#</cfoutput>

<!---> Working with dates, this displays the amount of days between one and another date; <--->
<cfset DaysSinceTurnOfCentury = DateDiff("d", "1/1/2000", now() )>
<cfoutput>#DaysSinceTurnOfCentury#</cfoutput>

<!---> Calculate date in 42 days; <--->
<cfset FortyTwoDaysFromNow = DateAdd("d", now(), 42 )>

<!---> One dimensional array, appending it and printing it; <--->
<cfset ThingsILike = ["Warm Sandy Beaches", "Tropical Drinks", 42]>
<cfdump var = "#ThingsILike#">

<cfset ThingsILike[1] = "Warm Sandy Beaches">
<cfset ArrayAppend( ThingsILike, "Tropical Drinks")>

<cfloop array="#ThingsILike#" index="thing">
    <cfoutput>#thing#</cfoutput>
</cfloop>

<!---> Initiating and populating structs; <--->

<cfset FruitBasket = structNew()>
<cfset FruitBasket["Apple"] = "Like">
<cfset FruitBasket["Banana"] = "Like">
<cfset FruitBasket["Cherry"] = "Dislike">
<cfdump var = "#FruitBasket#">

<!---> Initiating populating structs with dot notation; <--->

<cfset FruitBasket = {}>
<cfset FruitBasket.Apple = "Like">
<cfset FruitBasket.Banana = "Like">
<cfset FruitBasket.Cherry = "Dislike">
<cfdump var = "#FruitBasket#">

<!---> Initiating and populating structs in a single statement; <--->

<cfset fruitBasket = {
    "Apple" = "Like",
    "Banana" = "Like",
    "Cherry" = "Dislike"
}>
<cfdump var = "#FruitBasket#">

<!---> Printing contents of a struct; <--->

<cfloop collection="#FruitBasket#" item="fruit">
    <cfoutput>I #FruitBasket[fruit]# #fruit#</cfoutput><br>
</cfloop>

<!---> Writing queries in-code (excluding the actual connector to the database)
       In this case retrieving all fruit.name and fruit.price values where Price is lower than 7. Then printing them out;<--->

<cfquery name="FruitQuery" datasource="fruit">
    SELECT Name, Price
    FROM FruitStore
    WHERE Price < 7
</cfquery>

<cfloop query="FruitQuery">
    #FruitQuery.Name# costs #FruitQuery.Price# <br>
</cfloop>