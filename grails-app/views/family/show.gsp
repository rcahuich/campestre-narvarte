
<%@ page import="com.narvarte.campestre.Family" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'family.label', default: 'Family')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-family" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-family" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list family">
			
				<g:if test="${familyInstance?.header}">
				<li class="fieldcontain">
					<span id="header-label" class="property-label"><g:message code="family.header.label" default="Header" /></span>
					
						<span class="property-value" aria-labelledby="header-label"><g:link controller="person" action="show" id="${familyInstance?.header?.id}">${familyInstance?.header?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${familyInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="family.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${familyInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${familyInstance?.payments}">
				<li class="fieldcontain">
					<span id="payments-label" class="property-label"><g:message code="family.payments.label" default="Payments" /></span>
					
						<g:each in="${familyInstance.payments}" var="p">
						<span class="property-value" aria-labelledby="payments-label"><g:link controller="paymentEnroll" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
				<g:if test="${familyInstance?.persons}">
				<li class="fieldcontain">
					<span id="persons-label" class="property-label"><g:message code="family.persons.label" default="Persons" /></span>
					
						<g:each in="${familyInstance.persons}" var="p">
						<span class="property-value" aria-labelledby="persons-label"><g:link controller="person" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></span>
						</g:each>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:familyInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${familyInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
