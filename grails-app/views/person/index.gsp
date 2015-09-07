
<%@ page import="com.narvarte.campestre.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'person.label', default: 'Person')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-person" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-person" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>
					
						<g:sortableColumn property="headerFamily" title="${message(code: 'person.headerFamily.label', default: 'Header Family')}" />
					
						<g:sortableColumn property="realCost" title="${message(code: 'person.realCost.label', default: 'Real Cost')}" />
					
						<g:sortableColumn property="fictitiousCost" title="${message(code: 'person.fictitiousCost.label', default: 'Fictitious Cost')}" />
					
						<g:sortableColumn property="baptism" title="${message(code: 'person.baptism.label', default: 'Baptism')}" />
					
						<g:sortableColumn property="birthday" title="${message(code: 'person.birthday.label', default: 'Birthday')}" />
					
						<g:sortableColumn property="dateCreated" title="${message(code: 'person.dateCreated.label', default: 'Date Created')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${personInstanceList}" status="i" var="personInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${personInstance.id}">${fieldValue(bean: personInstance, field: "headerFamily")}</g:link></td>
					
						<td>${fieldValue(bean: personInstance, field: "realCost")}</td>
					
						<td>${fieldValue(bean: personInstance, field: "fictitiousCost")}</td>
					
						<td>${fieldValue(bean: personInstance, field: "baptism")}</td>
					
						<td><g:formatDate date="${personInstance.birthday}" /></td>
					
						<td><g:formatDate date="${personInstance.dateCreated}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${personInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
