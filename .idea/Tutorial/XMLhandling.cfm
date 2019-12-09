<!---> This code is not supposed to run, it is merely a quick reference guide for the subjects that have been addressed; <--->

<!---> Reading an XML file, then showing it's contents; <--->
<cfset mydoc = XmlParse(ExpandPath("./order.xml"))>
<cfdump var="#mydoc#">

<!---> Creating an XML file; <--->
<cfset getdata = QueryExecute('SELECT ARTISTID, ARTID, ARTNAME, DESCRIPTION, ISSOLD, PRICE, LARGEIMAGE FROM artists where artistid = ?', [1], {datasource = 'cfartgallery'})>;

<!---> Process the query result and generate xml <--->
<cfxml variable="artxml">
    <art artistid="<cfoutput>#getdata.artistid#</cfoutput>">
    <cfoutput query="getData">
            <piece id="#getData.artid#" available="#getdata.isSOLD#">
        <artname>#getData.artname#</artname>
        <description>#getData.artNAME#</description>
        <image>#getData.LARGEIMAGE#</image>
        <price>#getData.PRICE#</price>
        </piece>
    </cfoutput>
    </art>
</cfxml>

<!---> Parsing an XMl is done though xmlParse <--->
<cfset mydoc = xmlParse(ExpandPath("./order.xml", true))>

<!---> And can then be referenced with; <--->
mydoc.XMLRoot.xmlChildren[1]["itemName"]

<!---> Provided you account for the nesting of nodes and attributes, you can also loop over an XML with cfloop.
Even if you don't know the structure of the contents of the XML; <--->
<cfloop array="#artxml.xmlRoot.xmlchildren#" index="i" >
    <cfoutput>
        <cfif structKeyExists(i, "xmlattributes")>
            <cfloop collection="#i.xmlattributes#" item="a" >
                #a#: #i.xmlAttributes[a]#<br/>
            </cfloop>
        </cfif>
        <cfloop array="#i.xmlchildren#" index="x">
            #x.xmlName#: #x.xmlText#<br/>
        </cfloop>
    </cfoutput>
    <br>
</cfloop>

<!---> Setting/overwriting node values is done through cfset, for example to increase prices; <--->
<cfloop array="#artxml.art.xmlchildren#" index="i">
    <cfset i.price.xmlText = i.price.xmlText*1.2>
</cfloop>

<!---> Similarly cfset can also be used to set Attributes, by changing the availability values; <--->
<cfloop array="#artxml.art.xmlchildren#" index="i" >
<!--- make all items available --->
    <cfset i.xmlAttributes['available'] = 1>
</cfloop>

<!---> If for some reason you find it easier to handle the XML contents as query results, you can also convert them; <--->
artQuery = QueryNew("artistid, artid, name, description, image, price, sold");
queryAddRow(artQuery, arraylen(myDoc.art.piece));

<!---> Again, make sure you loop through all the items of the array, if you so desire <--->
for (i = 1; i lte arraylen(myDoc.art.piece); i++){
thisItem = mydoc.art.piece[i];
QuerySetCell(artQuery, "artistid", mydoc.art.xmlAttributes.artistid, i);
QuerySetCell(artQuery, "artid", thisItem.xmlAttributes.id, i);
QuerySetCell(artQuery, "sold", thisItem.xmlAttributes.available, i);
QuerySetCell(artQuery, "name", thisItem.artname.xmltext, i);
QuerySetCell(artQuery, "description", thisItem.description.xmltext, i);
QuerySetCell(artQuery, "image", thisItem.image.xmltext, i);
QuerySetCell(artQuery, "price", thisItem.price.xmltext, i);
}

<!---> And dump to browser to verify output <--->
writedump(artQuery);

<!---> Searching in XML files is done by parsing the contents to a struct.
I use cfscript, and am not (currently) aware of a CFML alternative. <--->
<cfscript>
    mydoc = XmlParse(ExpandPath("./order.xml"));
    params = structNew();
    params["artname"] = "Mary";
</cfscript>

<cfset searchRes = xmlSearch(myxml, '//piece/artname[. = $artname]', params)>

<cfdump var="#searchRes[1].xmlParent#">

