<%@ page import="com.narvarte.campestre.Person" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <title>Registro</title>

    <asset:stylesheet src="jquery.dataTables.css"/>
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
</head>

<body>

<div class="container">
    <h3 class="header light">Registros</h3>
    <a class="waves-effect waves-light btn" href="${createLink(action: "create")}"><i
            class="material-icons left">add</i> Nueva Persona</a>

    <br><br>
    <g:if test="${flash.message}">
        <div class="card-panel">
            <span class="blue-text text-darken-2"><i class="material-icons left">done</i>${flash.message}</span>
        </div>
    </g:if>


    <table id="tableData">
        <thead>
        <tr>
            <th>Nombre</th>
            <th>Fecha de Nac.</th>
            <th>Edad</th>
            <th>Inscrito</th>
            <th>Cab. de Familia</th>
            <th>Tipo</th>
            <th>Bautizado</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${personList}" status="i" var="person">
            <tr>
                <td>${person?.name}</td>
                <td><g:formatDate date="${person.birthday}" format="dd/MM/yyyy"/></td>
                <td>${person.age}</td>
                <td><g:message code="com.narvarte.campestre.boolean.${person?.enrollment}"/></td>
                <td><g:message code="com.narvarte.campestre.boolean.${person?.headerFamily}"/></td>
                <td><g:message code="com.narvarte.campestre.enums.TypePersonEnum.${person?.typePerson}"/></td>
                <td><g:message code="com.narvarte.campestre.enums.BaptismEnum.${person?.baptism}"/></td>
                <td><a href="${createLink(action: "detail", id: person.id)}"
                       class="waves-effect waves-light btn">Detalles</a></td>
            </tr>
        </g:each>
        </tbody>
    </table>

</div>

</body>
</html>
