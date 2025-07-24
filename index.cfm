<!--- Handle Logout --->
<cfif structKeyExists(URL, "logout")>
    <cfset StructClear(session)>
    <cflocation url="index.cfm">
</cfif>
<cfparam name="error" default="">

<cfif structKeyExists(FORM, "username")>
    <cfif FORM.username eq "admin" AND FORM.password eq "password123">
        <cfset session.user = FORM.username>
        <cfset session.loggedin = true>
        <cfset session.timeout = 30>
        <cflocation url="dashboard.cfm">
    <cfelse>
        <cfset error = "Invalid credentials. Please try again.">
    </cfif>
</cfif>

<cfoutput>
    <!DOCTYPE html>
<html>
<head>
    <title>Login – CFProductVault</title>
    <link rel="stylesheet" href="assets/style.css">
</head>
<body>
<h2>Login</h2>
<form method="post">
    Username: <input type="text" name="username"><br>
    Password: <input type="password" name="password"><br><br>
    <input type="submit" value="Login">
</form>

<cfif len(error)>
    <p style="color:red;">#error#</p>
</cfif>
</body>
</html>
</cfoutput>