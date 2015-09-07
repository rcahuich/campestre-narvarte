<%@ page import="com.narvarte.campestre.Event" %>
<script type="application/javascript">
    $(document).ready(function () {
        $('.datepicker').pickadate({
            format: 'dd/mm/yyyy',
            today: 'Hoy',
            clear: 'Limpiar',
            close: 'Cerrar',
            labelMonthNext: 'Siguiente mes',
            labelMonthPrev: 'Mes anterior',
            labelMonthSelect: 'Seleccione mes',
            labelYearSelect: 'Seleccione año',
            selectMonths: true, // Creates a dropdown to control month
            selectYears: 5 // Creates a dropdown of 15 years to control year
        });
    })

</script>
<div class="row">
    <div class="input-field col s6">
        <i class="material-icons prefix">event</i>
        <input id="icon_prefix" type="text" class="validate" name="name" value="${eventInstance?.name}" required>
        <label for="icon_prefix" data-error="error" data-success="correcto">Nombre del Evento</label>
    </div>

    <div class="input-field col s6">
        <input type="checkbox" id="test5" name="status" <g:if test="${eventInstance?.status}">checked="checked"</g:if>/>
        <label for="test5" data-error="error" data-success="correcto">Estatus</label>
    </div>

</div>

<div class="row">
    <div class="input-field col s6">
        <i class="material-icons prefix">event_available</i>
        <input id="startDate" type="date" class="datepicker validate" name="startDate" value="${eventInstance?.startDate}" required>
        <label for="startDate" data-error="error" data-success="correcto">Fecha Inicio de Evento</label>
    </div>

    <div class="input-field col s6">
        <i class="material-icons prefix">event_available</i>
        <input id="endtDate" type="date" class="datepicker validate" name="endtDate" value="${eventInstance?.endtDate}" required>
        <label for="endtDate" data-error="error" data-success="correcto">Fecha Fin de Evento</label>
    </div>

</div>


