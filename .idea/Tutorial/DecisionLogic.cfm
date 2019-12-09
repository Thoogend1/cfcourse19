<!---> This code is not supposed to run, it is merely a quick reference guide for the subjects that have been addressed; <--->

<!--->
CFML and CFScript Operators	                CF8+ CFScript Only
IS, EQUAL, EQ	                            ==
IS NOT, NOT EQUAL, NEQ	                    !=
GT, GREATER THAN, LT, LESS THAN, GTE, LTE	>,<,>=,<=
CONTAINS	                                N/A
DOES NOT CONTAIN	                        N/A
<--->

<!---> Decision logic in ColdFusion; <--->
<cfif myValue EQ 'IfValue'>
    <cfoutput>#myValue#</cfoutput>
    <cfelseif myValue GREATER THAN 'IfValue'>
    <cfoutput>"Value greater than #myValue#:</cfoutput>
<cfelse>
    <cfoutput>"I don't know man"</cfoutput>
</cfif>

<!---> The following operators are available for joined comparisons;
Operators are ALWAYS resolved from left to right.
CFML and CFScript Operators	                CF8+ CFScript Only
AND                                         &&
OR                                          ||
NOT                                         !
XOR                                         EQV
IMP                                         implication
<--->

<!---> CFML <--->
<cfif structKeyExists( myStruct, 'age' ) AND myStruct.age LTE 7>
    <cfoutput>"Code executed"</cfoutput>
</cfif>

<!---> CFScript <--->
<cfscript>
    if ( structKeyExists( myStruct, 'age' ) && myStruct.age <= 7 ) {
        <cfoutput>"Code executed"</cfoutput>
        }
</cfscript>

<!---> Switch/case logic in ColdFusion <--->
<cfswitch expression="#myVar#">
    <cfcase value="1">
        <cfoutput>"myVar value is 1"</cfoutput>
    </cfcase>
    <cfcase value="9,10" >
        <cfoutput>"myVar value is 9 or 10"</cfoutput>
    </cfcase>
    <cfdefaultcase>
        <cfoutput>"myVar value is not 1, 9 or 10"</cfoutput>
    </cfdefaultcase>
</cfswitch>