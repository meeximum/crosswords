<!DOCTYPE html>
<html>
<head>
    <title>Anmeldung</title>
    <meta name="layout" content="main"/>
</head>

<body>
<div class="body" style="padding: 10px">
    <g:if test="${flash.message}">
        <div class="message">
            ${flash.message}
        </div>
    </g:if>
    <p>
        Willkommen bei Crosswords
    </p>
    <g:form action="handleLogin" method="post">
        <table>
            <tr>
                <td><label for="userName">Benutzer:</label></td>
                <td><g:textField name="userName" value="${user?.userName}"/></td>
            </tr>
            <tr>
                <td><label for="userPass">Kennwort:</label></td>
                <td><g:passwordField name="userPass"/></td>
            </tr>
        </table>
        <br/>
        <span class="button">
            <g:actionSubmit value="Login" action="handleLogin"/>
        </span>
    </g:form>
</div>
</body>
</html>