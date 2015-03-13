<!DOCTYPE html>
<html>
<head>
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
        margin: 0 1em 1.25em 18em;
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

    .fieldcontain label,
    .fieldcontain .property-label {
        color: #666666;
        text-align: left;
        width: 10%;
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
        <li class="controller"><g:link controller="term" action="index"><g:message code="term.label"/></g:link></li>
        <li class="controller"><g:link controller="token" action="index"><g:message code="token.label"/></g:link></li>
    </ul>
</div>

<div id="page-body" role="main">
    %{--<div id="list-term" class="content scaffold-list" role="main">--}%
        <g:if test="${flash.message}">
            <div class="message" role="status">${flash.message}</div>
        </g:if>
        <g:form action="index" method="GET">
            <fieldset class="form">
                <div class="fieldcontain">
                    <label for="searchTextField">
                        <g:message code="term.term.label" default="Term"/>

                    </label>
                    <g:textField name="searchTextField" value="${params.searchTextField}"/>
                </div>

                <div class="fieldcontain">
                    <label for="searchToken">
                        <g:message code="token.token.label" default="Token"/>

                    </label>
                    <g:select id="token" name="searchToken" from="${at.meeximum.crosswords.Token.list()}" optionKey="id"
                              value="${params.searchToken}" class="many-to-one" noSelection="['': '']"/>
                </div>

                <div class="fieldcontain">
                    <label for="lengthField">
                        <g:message code="term.length.label" default="Length"/>

                    </label>
                    <g:field name="lengthField" type="number" value="${params.lengthField}" />
                    %{--<g:textField name="" value="${params.lengthField}" pattern="[1-9][0-9]*" size="1" />--}%
                </div>
            </fieldset>
            <fieldset class="buttons">
                <g:submitButton name="${message(code: 'search', default: 'Search')}"/>
            </fieldset>
        </g:form>
        <br />
        <div id="searchresults">
            <table>
                <thead>
                <tr>

                    <g:sortableColumn property="term" title="${message(code: 'term.term.label', default: 'Term')}"/>

                    <g:sortableColumn property="length" title="${message(code: 'term.length.label', default: 'Length')}"/>

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

                        <td>${fieldValue(bean: termInstance, field: "length")}</td>

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
    %{--</div>--}%
</div>
</body>
</html>
