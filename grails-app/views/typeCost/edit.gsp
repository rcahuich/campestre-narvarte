<%@ page import="com.narvarte.campestre.TypeCost" %>
<%@ defaultCodec="none" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Tipo de Cobro</title>
	</head>
	<body>
		<div class="container">
            <h3 class="header light">Editar Tipo de Cobro: "${typeCostInstance.name}"</h3>
            <g:if test="${flash.message}">
                <div class="card-panel">
                    <span class="blue-text text-darken-2"> <i class="material-icons left">done</i>${flash.message}</span>
                </div>
            </g:if>
            <g:hasErrors bean="${typeCostInstance}">
                <div class="card-panel">
                    <span class="red-text text-darken-2">Error al guardar</span>
                    <ul class="errors" role="alert">
                        <g:eachError bean="${typeCostInstance}" var="error">
                            <li class="red-text text-darken-2" <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </div>
            </g:hasErrors>
            <g:form url="[resource:typeCostInstance, action:'update']" method="PUT" >
                <g:hiddenField name="version" value="${typeCostInstance?.version}" />
                <div class="card-panel">
                    <g:render template="form"/>
                </div>
                <div class="card-panel">
                    <g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
                </div>
            </g:form>
		</div>

	</body>
</html>
