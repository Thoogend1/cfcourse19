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
    <cfoutput>"I don't know man</cfoutput>
</cfif>

<!---> The following operators are available for joined comparisons;
CFML and CFScript Operators	                CF8+ CFScript Only
AND                                         &&
OR                                          ||
NOT                                         !
XOR                                         EQV
IMP                                         implication
<--->

<!---> CFML <--->
<cfif structKeyExists( myStruct, 'age' ) AND myStruct.age LTE 7>
    ..code..
</cfif>

<!---> CFScript <--->
<cfscript>
    if ( structKeyExists( myStruct, 'age' ) && myStruct.age <= 7 ) {
            ..code..
}
</cfscript>


