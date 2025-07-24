<cfinclude template="data/productData.cfm">

<!--- Validate product ID --->
<cfif NOT structKeyExists(URL, "id")>
    <cfoutput><p>Invalid product ID.</p></cfoutput>
    <cfabort>
</cfif>

<cfset editID = val(URL.id)>
<cfset rowIndex = 0>

<!--- Locate the row index of the product to edit --->
<cfloop query="application.products">
    <cfif id EQ editID>
        <cfset rowIndex = currentRow>
        <cfbreak>
    </cfif>
</cfloop>

<cfif rowIndex EQ 0>
    <cfoutput><p>Product not found.</p></cfoutput>
    <cfabort>
</cfif>

<!--- Handle Form Submission --->
<cfif structKeyExists(FORM, "submit")>

    <!--- Update the row using QuerySetCell --->
    <cfset QuerySetCell(application.products, "name", FORM.name, rowIndex)>
    <cfset QuerySetCell(application.products, "category", FORM.category, rowIndex)>
    <cfset QuerySetCell(application.products, "price", FORM.price, rowIndex)>
    <cfset QuerySetCell(application.products, "stock", FORM.stock, rowIndex)>

    <!--- Redirect back to dashboard --->
    <cflocation url="dashboard.cfm">
</cfif>

<!--- Display Form Pre-Filled with Current Data --->
<cfoutput>
<h2>Edit Product ## #editID#</h2>

<form method="post">
    Name: <input type="text" name="name" value="#application.products.name[rowIndex]#" required><br>
    Category: <input type="text" name="category" value="#application.products.category[rowIndex]#" required><br>
    Price: <input type="text" name="price" value="#application.products.price[rowIndex]#" required><br>
    Stock: <input type="number" name="stock" value="#application.products.stock[rowIndex]#" required><br><br>
    <input type="submit" name="submit" value="Update Product">
</form>

<a href="dashboard.cfm">Back to Dashboard</a>
</cfoutput>