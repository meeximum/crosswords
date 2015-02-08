
<%@ page import="at.meeximum.crosswords.Token" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'token.label', default: 'Token')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-token" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
                <li><g:link class="export" action="export"><g:message code="default.export.label" /></g:link></li>
            </ul>
		</div>
		<div id="list-token" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="token" title="${message(code: 'token.token.label', default: 'Token')}" />
					
						<g:sortableColumn property="description" title="${message(code: 'token.description.label', default: 'Description')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${tokenInstanceList}" status="i" var="tokenInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${tokenInstance.id}">${fieldValue(bean: tokenInstance, field: "token")}</g:link></td>
					
						<td>${fieldValue(bean: tokenInstance, field: "description")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${tokenInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
