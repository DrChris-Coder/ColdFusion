<cfif NOT isDefined("application.products")>
    <cfset application.products = QueryNew("id,name,category,price,stock", "integer,varchar,varchar,float,integer", [
        {id=1, name="Widget A", category="Tools", price=19.99, stock=10},
        {id=2, name="Widget B", category="Gadgets", price=29.99, stock=5}
    ])>
</cfif>