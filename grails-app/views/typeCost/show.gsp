<%@ page import="com.narvarte.campestre.TypeCost" %>
<%@ defaultCodec="none" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Tipo de Costo</title>
</head>

<body>
<div class="container">
    <h3 class="header light">Detalles de "${typeCostInstance.name}"</h3>
    <a class="waves-effect waves-light btn" href="${createLink(action: "index")}"><i class="material-icons left">arrow_back</i> Lista de Tipos de Cobro</a>

    <br>
    <g:if test="${flash.message}">
        <div class="card-panel">
            <span class="blue-text text-darken-2"><i class="material-icons left">done</i>${flash.message}</span>
        </div>
    </g:if>
    <div class="card-panel">
        <span id="name-label" class="property-label">Nombre:</span>

        <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${typeCostInstance}"
                                                                                field="name"/></span>
        <br>



        <span id="cost-label" class="property-label">Costo:</span>

        <span class="property-value" aria-labelledby="cost-label">
            $ <g:formatNumber number="${typeCostInstance?.cost}" format="###,##0" locale="us"/></span>
        <br>


        <span id="status-label" class="property-label">Estatus:</span>

        <span class="property-value" aria-labelledby="status-label"><g:formatBoolean
                boolean="${typeCostInstance?.status}"/></span>
        <br>

        <br>
    </div>

    <div class="card-panel">
        <g:form url="[resource: typeCostInstance, action: 'delete']" method="DELETE">

            <g:link class="waves-effect waves-teal btn-flat" action="edit"
                    resource="${typeCostInstance}">Editar</g:link>
            <g:actionSubmit class="btn waves-effect waves-light" action="delete"
                            value="${message(code: 'default.button.delete.label', default: 'Eliminar')}"
                            onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>

        </g:form>

    </div>

</div>
</body>
</html>
