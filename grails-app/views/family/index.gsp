
<%@ page import="com.narvarte.campestre.Family" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Familias</title>

        <asset:stylesheet src="jquery.dataTables.css" />
        <link rel="stylesheet" type="text/css" href="//cdn.datatables.net/responsive/1.0.6/css/dataTables.responsive.css">
        <asset:javascript src="jquery.dataTables.js"/>
        <script type="text/javascript" src="//cdn.datatables.net/responsive/1.0.6/js/dataTables.responsive.js"></script>

        <script type="text/javascript">
            $(document).ready(function () {
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
        <style type="text/css">
        .dataTables_length select
        {
            background:#ffffff none repeat scroll 0 0;
            border: 1px solid rgba(34, 36, 38, 0.15);
            border-radius: 0.285714rem;
            box-shadow: none;
            color: rgba(0, 0, 0, 0.87);
            cursor: pointer;
            display: inline-block;
            line-height: 1.2142em;
            min-height: 0.714286em;
            outline: 0 none;
            padding: 0.3em;
            transform: rotateZ(0deg);
            transition: box-shadow 0.1s ease 0s, width 0.1s ease 0s;
            white-space: normal;
            word-wrap: break-word;
        }
        </style>
	</head>
	<body>
		<div class="container">
            <h3 class="header light">Familias</h3>
            <a class="waves-effect waves-light btn" href="${createLink(action: "create")}"><i class="material-icons left">add</i> Nueva Familia</a>

            <br><br>
            <g:if test="${flash.message}">
                <div class="card-panel">
                    <span class="blue-text text-darken-2"> <i class="material-icons left">done</i>${flash.message}</span>
                </div>
            </g:if>

            <table id="tableData" class="striped">
                <thead>
                <tr>
                    <th>#</th>
                    <th>Nombre</th>
                    <th>Cabeza</th>
                    <th>Pago Completo</th>
                    <th>Total</th>
                    <th></th>
                </tr>
                </thead>
                <tbody>
                <g:each in="${familyList}" status="i" var="family">
                    <tr>
                        <td>${i+1}</td>
                        <td>${fieldValue(bean: family, field: "name")}</td>
                        <td>${family?.header?.name}</td>
                        <td><g:message code="com.narvarte.campestre.boolean.${family?.payCompleted()}"/></td>
                        <td>${family?.personsList.size()}</td>
                        <td><a href="${createLink(action: "detail", id: family.id)}" class="waves-effect waves-light btn">Detalles</a></td>
                    </tr>
                </g:each>
                </tbody>
            </table>

        </div>

	</body>
</html>
