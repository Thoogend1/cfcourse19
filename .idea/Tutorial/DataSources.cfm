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

<!---> When inserting any information in to the datasource, always use cfqueryparam to avoid SQL injection. Like so; <--->
<cfquery name="myQuery" datasource="cfartgallery">
    SELECT * FROM artists
    WHERE firstname = <cfqueryparam value="#form.name#" cfsqltype="cf_sql_varchar">
</cfquery>

<!---> A query like; <--->
<cfquery name="myQuery" datasource="cfartgallery">
    SELECT * FROM artists
    WHERE artistid IN (<cfqueryparam value="#form.ids#" list="true">)
</cfquery>
<!---> Should result in;
myQuery (Datasource=cfartgallery, Time=2ms, Records=4) i
select * from ARTISTS
where artistid in (?,?,?,?)
Query Parameter Value(s) -
Parameter #1(CF_SQL_CHAR) = 1
Parameter #2(CF_SQL_CHAR) = 2
Parameter #3(CF_SQL_CHAR) = 3
Parameter #4(CF_SQL_CHAR) = 4

Queries can also be cached by adding the tag cachedwithin="#createTimespan(0,1,0,0)#", or result restricted with maxrows="100" <--->
<cfquery name="myQuery" datasource="cfartgallery" maxrows="100">
    SELECT firstname, lastname, email FROM artists
</cfquery>

<!---> Inserting values into the database is done in a very logical way; <--->
<cfquery result="qryResult" datasource="cfartgallery">
    INSERT INTO art
    (
    artistsID, artName, description, isSold, largeImage, mediaID, price
    )
    VALUES
    (
    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="1">,
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="Test Item">,
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="Test Desc">,
    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="1">,
    <cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="img.png">,
    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="1">,
    <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="1">
    )
</cfquery>

<cfdump var="#qryResult#">

