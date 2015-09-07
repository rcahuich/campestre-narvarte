<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Tipos de Cobro</title>
	</head>
	<body>

        <div class="container">
            <h2 class="header light">Nuevo Tipo de Cobro</h2>

            <a class="waves-effect waves-light btn" href="${createLink(action: "index")}"><i class="material-icons left">list</i> Lista de Cobros</a>
            <br><br>
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

            <div class="row">
                <g:form url="[resource:typeCostInstance, action:'save']" class="col s12">
                    <fieldset class="form">
                        <g:render template="form"/>
                    </fieldset>
                    <fieldset class="buttons">
                        <g:submitButton name="create" class="btn btn-flat" value="Crear Cobro" />
                    </fieldset>
                </g:form>
            </div>

        </div>

	</body>
</html>