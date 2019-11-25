<!--- Looping in ColdFusion, this piece of code runs through to loop, incrementing "i" <--->
<cfloop from="1" to="5" index="i">
    #i#<br>
</cfloop>

<!--- Array loops in ColdFusion start at 1, len can be specified as the total lenght of the  Array; <--->
<cfset nameArray = ['Jeff', 'John', 'Steven', 'Julian']>
<cfloop from="1" to="#arrayLen( nameArray )#" index="i">
    #i#: #nameArray[i]#<br>
</cfloop>

<!--- To remove the numbering of the index, the could should be executed in shorthand, like such; <--->
<cfloop array="#myArray#" index="item">
    #item#<br>
</cfloop>

<!--- In ColdFusion lists, custom delimiters can be specifiec. For example a space; <--->
<cfset myList = "This is the test sentence">
<cfloop list="#myList#" index="word" delimiters=" ">
    #word#<br>
</cfloop>