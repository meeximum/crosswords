<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="layout" content="main"/>
    <title>Crosswords</title>
    <style type="text/css" media="screen">
    #status {
        background-color: #eee;
        border: .2em solid #fff;
        margin: 2em 2em 1em;
        padding: 1em;
        width: 12em;
        float: left;
        -moz-box-shadow: 0px 0px 1.25em #ccc;
        -webkit-box-shadow: 0px 0px 1.25em #ccc;
        box-shadow: 0px 0px 1.25em #ccc;
        -moz-border-radius: 0.6em;
        -webkit-border-radius: 0.6em;
        border-radius: 0.6em;
    }

    .ie6 #status {
        display: inline; /* float double margin fix http://www.positioniseverything.net/explorer/doubled-margin.html */
    }

    #status ul {
        font-size: 0.9em;
        list-style-type: none;
        margin-bottom: 0.6em;
        padding: 0;
    }

    #status li {
        line-height: 1.3;
    }

    #status h1 {
        text-transform: uppercase;
        font-size: 1.1em;
        margin: 0 0 0.3em;
    }

    #page-body {
        margin: 2em 1em 1.25em 18em;
    }

    h2 {
        margin-top: 1em;
        margin-bottom: 0.3em;
        font-size: 1em;
    }

    p {
        line-height: 1.5;
        margin: 0.25em 0;
    }

    #controller-list ul {
        list-style-position: inside;
    }

    #controller-list li {
        line-height: 1.3;
        list-style-position: inside;
        margin: 0.25em 0;
    }

    @media screen and (max-width: 480px) {
        #status {
            display: none;
        }

        #page-body {
            margin: 0 1em 1em;
        }

        #page-body h1 {
            margin-top: 0;
        }
    }
    </style>
</head>

<body>
<a href="#page-body" class="skip"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>

<div id="status" role="complementary">
    <ul>
        <li class="controller"><g:link controller="term" action="index"><g:message code="term.label" /></g:link></li>
        <li class="controller"><g:link controller="token" action="index"><g:message code="token.label" /></g:link></li>
    </ul>
</div>

<div id="page-body" role="main">
    <div id="list-term" class="content scaffold-list" role="main">
        <h1>Suche</h1>
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:form action="index" method="GET">
            <g:textField  name="searchTextField" value="${params.searchTextField}"/>
            %{--<g:submitToRemote update="searchresults" url="[controller:'index', action:'search']" value="Suche"></g:submitToRemote>--}%
            <g:submitButton name="Suche" />
        </g:form>
        <div id="searchresults">
            <table>
                <thead>
                <tr>

                    <g:sortableColumn property="term" title="${message(code: 'term.term.label', default: 'Term')}"/>

                    <g:sortableColumn property="description"
                                      title="${message(code: 'term.description.label', default: 'Description')}"/>

                    <th><g:message code="term.token.label" default="Token"/></th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${searchresults}" status="i" var="termInstance">
                    <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                        <td><g:link controller="term" action="show"
                                    id="${termInstance.id}">${fieldValue(bean: termInstance, field: "term")}</g:link></td>

                        <td>${fieldValue(bean: termInstance, field: "description")}</td>

                        <td>${fieldValue(bean: termInstance, field: "token")}</td>

                    </tr>
                </g:each>
                </tbody>
            </table>

            <div class="pagination">
                <g:paginate total="${count ?: 0}" params="${params}"/>
            </div>
        </div>
    </div>
</div>
</body>
</html>
