<cfinclude template="data/productData.cfm">

<!--- Handle Form Submission --->
<cfif structKeyExists(FORM, "submit")>

    <!--- Generate new ID (max ID + 1) --->
    <cfset newID = 1>
    <cfloop query="application.products">
        <cfif id GTE newID>
            <cfset newID = id + 1>
        </cfif>
    </cfloop>

    <!--- Add new row --->
    <cfset QueryAddRow(application.products, 1)>
    <cfset QuerySetCell(application.products, "id", newID)>
    <cfset QuerySetCell(application.products, "name", FORM.name)>
    <cfset QuerySetCell(application.products, "category", FORM.category)>
    <cfset QuerySetCell(application.products, "price", FORM.price)>
    <cfset QuerySetCell(application.products, "stock", FORM.stock)>

    <!--- Redirect to dashboard --->
    <cflocation url="dashboard.cfm">
</cfif>

<!--- Display Form --->
<cfoutput>
<h2>Add New Product</h2>

<form method="post">
    Name: <input type="text" name="name" required><br>
    Category: <input type="text" name="category" required><br>
    Price: <input type="text" name="price" required><br>
    Stock: <input type="number" name="stock" required><br><br>
    <input type="submit" name="submit" value="Add Product">
</form>

<a href="dashboard.cfm">Back to Dashboard</a>
</cfoutput>