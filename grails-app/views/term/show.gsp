
<%@ page import="at.meeximum.crosswords.Term" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'term.label', default: 'Term')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-term" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-term" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list term">
			
				<g:if test="${termInstance?.term}">
				<li class="fieldcontain">
					<span id="term-label" class="property-label"><g:message code="term.term.label" default="Term" /></span>
					
						<span class="property-value" aria-labelledby="term-label"><g:fieldValue bean="${termInstance}" field="term"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${termInstance?.description}">
				<li class="fieldcontain">
					<span id="description-label" class="property-label"><g:message code="term.description.label" default="Description" /></span>
					
						<span class="property-value" aria-labelledby="description-label"><g:textArea disabled="true" name="description" cols="40" rows="5" maxlength="1000" value="${termInstance?.description}"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${termInstance?.token}">
				<li class="fieldcontain">
					<span id="token-label" class="property-label"><g:message code="term.token.label" default="Token" /></span>
					
						<span class="property-value" aria-labelledby="token-label"><g:link controller="token" action="show" id="${termInstance?.token?.id}">${termInstance?.token?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:termInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${termInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
