<%@ page import="at.meeximum.crosswords.Term" %>



<div class="fieldcontain ${hasErrors(bean: termInstance, field: 'term', 'error')} required">
	<label for="term">
		<g:message code="term.term.label" default="Term" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="term" required="" value="${termInstance?.term}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: termInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="term.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1000" value="${termInstance?.description}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: termInstance, field: 'token', 'error')} ">
	<label for="token">
		<g:message code="term.token.label" default="Token" />
		
	</label>
	<g:select id="token" name="token.id" from="${at.meeximum.crosswords.Token.list()}" optionKey="id" value="${termInstance?.token?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>