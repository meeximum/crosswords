<div id="menu">
    <nobr>
        <g:if test="${session.user}">
            <b>${session.user?.user}</b> |
            <g:link controller="index" action="logout">Abmelden</g:link>
        </g:if>
        <g:else>
            <g:link controller="index" action="logon">Anmelden</g:link>
        </g:else>
    </nobr>
</div>