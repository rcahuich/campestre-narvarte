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
            "sDom": 'T<"clear">lfrtip',
            "pagingType": "full_numbers"
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

Total de Personas: ${personList.size()}

<table id="tableData" class="striped">
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
		<th>Asegurado</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${personList}" status="i" var="person">
        <tr>
            <td>${i+1}</td>
            <td><a href="${createLink(action: "detail", id: person.id)}"
                   class="waves-effect waves-light btn btn-flat">${person?.name}</a></td>
            <td><g:formatDate date="${person.datePaymentCompleted}" format="dd/MM/yyyy HH:mm"/></td>
            <td>${person.age}</td>
            <td><g:message code="com.narvarte.campestre.boolean.${person?.enrollment}"/></td>
            <td><g:message code="com.narvarte.campestre.boolean.${person?.headerFamily}"/></td>
            <td><g:message code="com.narvarte.campestre.enums.TypePersonEnum.${person?.typePerson}"/></td>
            <td><g:message code="com.narvarte.campestre.enums.BaptismEnum.${person?.baptism}"/></td>
			<td><g:message code="com.narvarte.campestre.boolean.${person?.secured}"/></td>
		</tr>
    </g:each>
    </tbody>
</table>