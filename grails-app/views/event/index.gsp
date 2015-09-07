
<%@ page import="com.narvarte.campestre.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Eventos</title>
	</head>
	<body>
        <div class="container">
            <h3 class="header light">Eventos</h3>
            <a class="waves-effect waves-light btn" href="${createLink(action: "create")}"><i class="material-icons left">add</i> Nuevo Evento</a>

            <br>
            <g:if test="${flash.message}">
                <div class="card-panel">
                    <span class="blue-text text-darken-2"> <i class="material-icons left">done</i>${flash.message}</span>
                </div>
            </g:if>
            <table>
                <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Fecha de Inicio</th>
                    <th>Fecha de Fin</th>
                    <th>Estatus</th>
                    <th></th>

                </tr>
                </thead>
                <tbody>
                <g:each in="${eventInstanceList}" status="i" var="eventInstance">
                    <tr>

                        <td><g:link action="show" id="${eventInstance.id}">${fieldValue(bean: eventInstance, field: "name")}</g:link></td>

                        <td><g:formatDate date="${eventInstance.startDate}" format="dd/MM/yyyy"/></td>

                        <td><g:formatDate date="${eventInstance.endtDate}" format="dd/MM/yyyy"/></td>

                        <td><g:formatBoolean boolean="${eventInstance.status}" /></td>

                    </tr>
                </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${eventInstanceCount ?: 0}" />
            </div>
        </div>

	</body>
</html>
