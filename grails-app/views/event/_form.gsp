<%@ page import="com.narvarte.campestre.Event" %>

<div class="row">
    <div class="input-field col s6">
        <input id="icon_prefix" type="text" class="validate" name="name" value="${event?.name}" aria-required="true" required placeholder="">
        <label for="icon_prefix">Nombre del Evento</label>
    </div>

    <div class="input-field col s6">
        <input type="checkbox" id="test5" name="status" <g:if test="${event?.status}">checked="checked"</g:if>/>
        <label for="test5" data-error="error" data-success="correcto">Estatus</label>
    </div>

</div>

<div class="row">
    <div class="input-field col s6">
        <input id="startDate" type="date" class="datepicker validate" name="startDate" value="${formatDate(format:'dd/MM/yyyy',date:event?.startDate)}" required placeholder="">
        <label for="startDate" data-error="error" data-success="correcto">Fecha Inicio de Evento</label>
    </div>

    <div class="input-field col s6">
        <input id="endtDate" type="date" class="datepicker validate" name="endtDate" value="${formatDate(format:'dd/MM/yyyy',date:event?.endtDate)}" required placeholder="">
        <label for="endtDate" data-error="error" data-success="correcto">Fecha Fin de Evento</label>
    </div>

</div>


