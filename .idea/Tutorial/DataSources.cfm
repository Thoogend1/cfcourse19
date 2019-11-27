<!---> Data sources are declared in the ColdFusion admin. A simply test query; <--->



// tags
<cfquery name="myQuery" datasource="cfartgallery">
    SELECT * FROM artists
</cfquery>

<!---> or for CF Script;
<cfscript>
    myquery = QueryExecute('SELECT * FROM artists', [], {datasource = 'cfartgallery'});
</cfscript>
<---->

<cfdump var="#myQuery#">

<!---> Displaying the result of a query to the browser, is done through the normal cfoutput statement; <--->
<cfoutput query="myQuery">
    #myQuery.CurrentRow# - #myQuery.email# - #myQuery.firstname# - #myQuery.lastname#<br>
</cfoutput>

<!---> Output grouped, pre-sorted data through a dual layer loop. Looping through groups and items in each group. <--->
<cfset myquery = QueryExecute(' SELECT * FROM art ORDER BY issold', [], {datasource = 'cfartgallery'})>

<cfoutput Query="myQuery" group="issold">
        Sold ?: #YesNoFormat(myQuery.issold)#:<br>
<blockquote>
    <cfoutput>
        #myQuery.artname#: #DollarFormat(myQuery.price)#<br>
    </cfoutput>
    </blockquote>
    <hr>
</cfoutput>