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
            },
            "dom": 'T<"clear">lfrtip',
            "tableTools": {
                "sSwfPath": "/swf/copy_csv_xls_pdf.swf"
            },
            buttons: [
                'copy', 'excel', 'pdf'
            ]
        });

    });
</script>

Total de Personas: ${personList.size()}

<table id="tableData">
    <thead>
    <tr>
        <th>#</th>
        <th>Nombre</th>
        <th>Fecha de Pago Completo</th>
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
            <td>${i+1}</td>
            <td>${person?.name}</td>
            <td><g:formatDate date="${person.datePaymentCompleted}" format="dd/MM/yyyy HH:mm"/></td>
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