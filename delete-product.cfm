<cfinclude template="data/productData.cfm">

<!--- Check for valid ID in URL --->
<cfif NOT structKeyExists(URL, "id")>
    <cfoutput><p>Invalid request. No product ID supplied.</p></cfoutput>
    <cfabort>
</cfif>

<cfset deleteID = val(URL.id)>
<cfset found = false>

<!--- Create a new query to store the remaining products --->
<cfset newQuery = QueryNew("id,name,category,price,stock", "integer,varchar,varchar,float,integer")>

<!--- Loop through existing products and copy only the ones we want to keep --->
<cfloop query="application.products">
    <cfif id NEQ deleteID>
        <cfset QueryAddRow(newQuery)>
        <cfset QuerySetCell(newQuery, "id", id)>
        <cfset QuerySetCell(newQuery, "name", name)>
        <cfset QuerySetCell(newQuery, "category", category)>
        <cfset QuerySetCell(newQuery, "price", price)>
        <cfset QuerySetCell(newQuery, "stock", stock)>
    <cfelse>
        <cfset found = true>
    </cfif>
</cfloop>

<cfif found>
    <cfset application.products = newQuery>
    <cfoutput><p>Product ID #deleteID# deleted successfully. Redirecting...</p></cfoutput>
    <cflocation url="dashboard.cfm">
<cfelse>
    <cfoutput><p>Product ID not found. Nothing deleted.</p></cfoutput>
    <cfabort>
</cfif>