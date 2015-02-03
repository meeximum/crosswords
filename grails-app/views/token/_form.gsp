<%@ page import="at.meeximum.crosswords.Token" %>



<div class="fieldcontain ${hasErrors(bean: tokenInstance, field: 'token', 'error')} required">
	<label for="token">
		<g:message code="token.token.label" default="Token" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="token" required="" value="${tokenInstance?.token}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: tokenInstance, field: 'description', 'error')} ">
	<label for="description">
		<g:message code="token.description.label" default="Description" />
		
	</label>
	<g:textArea name="description" cols="40" rows="5" maxlength="1000" value="${tokenInstance?.description}"/>

</div>

