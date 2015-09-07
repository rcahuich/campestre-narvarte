
<%@ page import="com.narvarte.campestre.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Detalle de Evento</title>

	</head>
	<body>
    <div class="container">
        <h3 class="header light">Detalles de "${eventInstance.name}"</h3>
        <a class="waves-effect waves-light btn" href="${createLink(action: "index")}"><i class="material-icons left">arrow_back</i> Lista de Eventos</a>

        <br>
        <g:if test="${flash.message}">
            <div class="card-panel">
                <span class="blue-text text-darken-2"><i class="material-icons left">done</i>${flash.message}</span>
            </div>
        </g:if>
        <div class="card-panel">
                    <span id="name-label" class="property-label">Nombre:</span>
                    <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${eventInstance}" field="name"/></span>
            <br>
                    <span id="startDate-label" class="property-label">Fecha Inicio:</span>
                    <span class="property-value" aria-labelledby="startDate-label"><g:formatDate date="${eventInstance?.startDate}" format="dd/MM/yyyy" /></span>
            <br>
                    <span id="endtDate-label" class="property-label">Fecha Fin:</span>
                    <span class="property-value" aria-labelledby="endtDate-label"><g:formatDate date="${eventInstance?.endtDate}" format="dd/MM/yyyy" /></span>
            <br>
                    <span id="status-label" class="property-label">Estatus:</span>
                    <span class="property-value" aria-labelledby="status-label"><g:formatBoolean boolean="${eventInstance?.status}" /></span>
            <br>

        </div>

        <g:form url="[resource:eventInstance, action:'delete']" method="DELETE">
            <div class="card-panel">
                <g:link class="waves-effect waves-teal btn-flat" action="edit" resource="${eventInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
                <g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
            </div>
        </g:form>

    </div>

	</body>
</html>
