
<%@ page import="com.narvarte.campestre.TypeCost" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Tipos de Cobro</title>
	</head>
	<body>
		<div class="container">
			<h3 class="header light">Tipos de Cobro</h3>

            <a class="waves-effect waves-light btn" href="${createLink(action: "create")}"><i class="material-icons left">add</i> Nuevo Cobro</a>

            <br>
            <g:if test="${flash.message}">
                <div class="card-panel">
                    <span class="blue-text text-darken-2"> <i class="material-icons left">done</i>${flash.message}</span>
                </div>
            </g:if>
            <br>
            <table class="hoverable">
                <thead>
                <tr>
                    <th>Nombre del Cobro</th>
                    <th>Precio</th>
                    <th>Estatus</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${typeCostInstanceList}" status="i" var="typeCostInstance">
                    <tr>

                        <td>${fieldValue(bean: typeCostInstance, field: "name")}</td>
                        <td>$ <g:formatNumber number="${typeCostInstance?.cost}" format="###,##0" locale="us"/></td>
                        <td><g:formatBoolean boolean="${typeCostInstance.status}" /></td>
                        <td> <a class="waves-effect waves-teal btn-flat" href="${createLink(action: "show", id: typeCostInstance.id)}"> Detalles</a></td>

                    </tr>
                </g:each>
                </tbody>
            </table>
            <div class="pagination">
                <g:paginate total="${typeCostInstanceCount ?: 0}" />
            </div>

        </div>

	</body>
</html>
