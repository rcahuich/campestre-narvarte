
<%@ page import="com.narvarte.campestre.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-person" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list person">
			
				<g:if test="${personInstance?.headerFamily}">
				<li class="fieldcontain">
					<span id="headerFamily-label" class="property-label"><g:message code="person.headerFamily.label" default="Header Family" /></span>
					
						<span class="property-value" aria-labelledby="headerFamily-label"><g:formatBoolean boolean="${personInstance?.headerFamily}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.realCost}">
				<li class="fieldcontain">
					<span id="realCost-label" class="property-label"><g:message code="person.realCost.label" default="Real Cost" /></span>
					
						<span class="property-value" aria-labelledby="realCost-label"><g:fieldValue bean="${personInstance}" field="realCost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.fictitiousCost}">
				<li class="fieldcontain">
					<span id="fictitiousCost-label" class="property-label"><g:message code="person.fictitiousCost.label" default="Fictitious Cost" /></span>
					
						<span class="property-value" aria-labelledby="fictitiousCost-label"><g:fieldValue bean="${personInstance}" field="fictitiousCost"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.baptism}">
				<li class="fieldcontain">
					<span id="baptism-label" class="property-label"><g:message code="person.baptism.label" default="Baptism" /></span>
					
						<span class="property-value" aria-labelledby="baptism-label"><g:fieldValue bean="${personInstance}" field="baptism"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.birthday}">
				<li class="fieldcontain">
					<span id="birthday-label" class="property-label"><g:message code="person.birthday.label" default="Birthday" /></span>
					
						<span class="property-value" aria-labelledby="birthday-label"><g:formatDate date="${personInstance?.birthday}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="person.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${personInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.enrollment}">
				<li class="fieldcontain">
					<span id="enrollment-label" class="property-label"><g:message code="person.enrollment.label" default="Enrollment" /></span>
					
						<span class="property-value" aria-labelledby="enrollment-label"><g:formatBoolean boolean="${personInstance?.enrollment}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.event}">
				<li class="fieldcontain">
					<span id="event-label" class="property-label"><g:message code="person.event.label" default="Event" /></span>
					
						<span class="property-value" aria-labelledby="event-label"><g:link controller="event" action="show" id="${personInstance?.event?.id}">${personInstance?.event?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.name}">
				<li class="fieldcontain">
					<span id="name-label" class="property-label"><g:message code="person.name.label" default="Name" /></span>
					
						<span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${personInstance}" field="name"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.typeCost}">
				<li class="fieldcontain">
					<span id="typeCost-label" class="property-label"><g:message code="person.typeCost.label" default="Type Cost" /></span>
					
						<span class="property-value" aria-labelledby="typeCost-label"><g:link controller="typeCost" action="show" id="${personInstance?.typeCost?.id}">${personInstance?.typeCost?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${personInstance?.typePerson}">
				<li class="fieldcontain">
					<span id="typePerson-label" class="property-label"><g:message code="person.typePerson.label" default="Type Person" /></span>
					
						<span class="property-value" aria-labelledby="typePerson-label"><g:fieldValue bean="${personInstance}" field="typePerson"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:personInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${personInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
