<cfinclude template="productData.cfm">

<cfoutput>
<h2>Welcome, #session.user#</h2>
<a href="add-product.cfm">Add Product</a> | <a href="index.cfm?logout=true">Logout</a><br><br>

<table border="1">
    <tr><th>ID</th><th>Name</th><th>Category</th><th>Price</th><th>Stock</th><th>Actions</th></tr>
    <cfloop query="application.products">
        <tr>
            <td>#id#</td>
            <td>#name#</td>
            <td>#category#</td>
            <td>$#price#</td>
            <td>#stock#</td>
            <td>
                <a href="edit-product.cfm?id=#id#">Edit</a> |
                <a href="delete-product.cfm?id=#id#">Delete</a>
            </td>
        </tr>
    </cfloop>
</table>
</cfoutput>