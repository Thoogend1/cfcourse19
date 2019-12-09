<!---> This code is not supposed to run, it is merely a quick reference guide for the subjects that have been addressed; <--->

<!---- Structure as an example of source
<cfset myStruct = {
    items: {
        item1:  {name: 'something', price: 1000},
        item2:  {name: 'something else', price: 12.50},
        item3:  {name: 'something more', price: "1,240.10"}
    },
    users: {
        user1:  {id: 1, email: 'none@none.net'},
        user2:  {id: 2, email: 'none@none.net'},
        user3:  {id: 3, email: 'none@none.net'}
    }
}>
<--->

<!---> Converting it to JSON; <--->
<cfset myJsonVar = serializeJSON(myStruct)>
<!---> Results in;
{"USERS":{"USER3":{"ID":3,"EMAIL":"none@none.net"},"USER2":{"ID":2,"EMAIL":"none@none.net"},"USER1":{"ID":1,"EMAIL":"none@none.net"}},"ITEMS":{"ITEM2":{"PRICE":12.50,"NAME":"something else"},"ITEM3":{"PRICE":"1,240.10","NAME":"something more"},"ITEM1":{"PRICE":1000,"NAME":"something"}}}
Names are capitalised, you need to put quotes around the varibale if this is not preferred. E.g. "item1" and "user1"
<--->

<!---> Converting JSON back to Strcuts is also easily done; <--->
<cfset myJsonStruct = deserializeJSON(myJsonVar)>

<!---> Validating validity of JSON of a string; <--->
<cfdump var="#isJson(myJsonVar)#">
