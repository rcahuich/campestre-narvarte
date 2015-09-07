<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Nuevo Evento</title>
	</head>

	<body>
        <div class="container">
            <h3 class="header light">Nuevo Evento</h3>

            <a class="waves-effect waves-light btn" href="${createLink(action: "index")}"><i class="material-icons left">list</i> Lista de Eventos</a>
            <br><br>
            <g:if test="${flash.message}">
                <div class="card-panel">
                    <span class="blue-text text-darken-2"> <i class="material-icons left">done</i>${flash.message}</span>
                </div>
            </g:if>
            <g:if test="${flash.error}">
                <div class="card-panel">
                    <span class="red-text text-darken-2"> <i class="material-icons left">error</i>${flash.error}</span>
                </div>
            </g:if>
            <g:hasErrors bean="${eventInstance}">
                <div class="card-panel">
                    <span class="red-text text-darken-2">Error al guardar</span>
                    <ul class="errors" role="alert">
                        <g:eachError bean="${eventInstance}" var="error">
                            <li class="red-text text-darken-2" <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
                        </g:eachError>
                    </ul>
                </div>
            </g:hasErrors>

            <div class="row">
                <g:form action="save" class="col s12">
                    <div class="card-panel">
                        <g:render template="form"/>
                    </div>
                    <div class="card-panel">
                        <g:submitButton name="create" class="btn btn-flat" value="Crear Evento" />
                    </div>
                </g:form>
            </div>

        </div>

	</body>
</html>
