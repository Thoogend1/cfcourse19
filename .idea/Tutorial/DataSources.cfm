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