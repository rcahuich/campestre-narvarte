
<%@ page import="com.narvarte.campestre.Event" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Eventos</title>

        <asset:stylesheet src="jquery.dataTables.css" />
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/responsive/1.0.6/css/dataTables.responsive.css">
        <asset:javascript src="jquery.dataTables.js"/>
        <script type="text/javascript" src="//cdn.datatables.net/responsive/1.0.6/js/dataTables.responsive.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
                var showModalFirst = "${showModal}";
                if(showModalFirst === "true"){
                    $('#modal1').openModal();
                }

                $('#tableData').DataTable({
                    responsive: true,
                    "language": {
                        "lengthMenu": "Mostrar _MENU_ registros por pagina",
                        "info": "Mostrando _PAGE_ de _PAGES_",
                        "infoEmpty": "Ningún registro",
                        "infoFiltered": "(filtrado de _MAX_ registros en total.)",
                        "zeroRecords": "No hay registros para su búsqueda.",
                        "loadingRecords": "Cargando...",
                        "processing": "Procesando...",
                        "search": "Buscar:",
                        "decimal": ".",
                        "thousands": ",",
                        "paginate": {
                            "first": "Primero",
                            "last": "Último",
                            "next": "Siguiente",
                            "previous": "Anterior"
                        }
                    }
                });
            });
        </script>

	</head>
	<body>
        <div class="container">
            <h3 class="header light">Eventos</h3>
            <a class="waves-effect waves-light btn" href="${createLink(action: "create")}"><i class="material-icons left">add</i> Nuevo Evento</a>

            <br><br>
            <g:if test="${flash.message}">
                <div class="card-panel">
                    <span class="blue-text text-darken-2"> <i class="material-icons left">done</i>${flash.message}</span>
                </div>
            </g:if>

            <table id="tableData">
                <thead>
                <tr>
                    <th>Nombre</th>
                    <th>Fecha de Inicio</th>
                    <th>Fecha de Fin</th>
                    <th>Estatus</th>
                    <th>Registros</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${eventList}" status="i" var="eventInstance">
                    <tr>
                        <td>${fieldValue(bean: eventInstance, field: "name")}</td>
                        <td><g:formatDate date="${eventInstance.startDate}" format="dd/MM/yyyy"/></td>
                        <td><g:formatDate date="${eventInstance.endtDate}" format="dd/MM/yyyy"/></td>
                        <td><g:formatBoolean boolean="${eventInstance.status}" /></td>
                        <td>${eventInstance.persons.size()}</td>
                        <td><a href="${createLink(action: "detail", id: eventInstance.id)}" class="waves-effect waves-light btn">Detalles</a></td>
                    </tr>
                </g:each>
                </tbody>
            </table>

        </div>

    <!-- Modal Structure -->
    <div id="modal1" class="modal">
        <div class="modal-content">
            <h4>Seleccione un Evento</h4>

            <p>
                No hay ningún evento Activo, seleccione uno.
            </p>

        </div>

        <div class="modal-footer">
            <a href="#!" class=" modal-action modal-close waves-effect waves-green btn-flat">Aceptar</a>
        </div>
    </div>
	</body>
</html>
