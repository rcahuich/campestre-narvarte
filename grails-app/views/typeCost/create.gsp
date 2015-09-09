<!DOCTYPE html>
<%@ defaultCodec="none" %>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Tipos de Cobro</title>

        <script type="application/javascript">
            $(document).ready(function () {
                var showModalFirst = "${showModal}";
                if(showModalFirst === "true"){
                    $('#modal1').openModal();
                }
            })
        </script>
	</head>
	<body>

        <div class="container">
            <h3 class="header light">Nuevo Tipo de Cobro</h3>

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
                    <div class="card-panel">
                        <g:render template="form"/>
                    </div>
                    <div class="card-panel">
                        <g:submitButton name="create" class="btn btn-flat" value="Crear Cobro" />
                    </div>
                </g:form>
            </div>

        </div>

    <!-- Modal Structure -->
    <div id="modal1" class="modal">
        <div class="modal-content">
            <h4>Cree un Tipo de Costo Activo</h4>

            <p>
                Para poder crear a un Registro es necesario tener al menos un Tipo de Cobro.
            </p>

        </div>

        <div class="modal-footer">
            <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Aceptar</a>
        </div>
    </div>

	</body>
</html>
