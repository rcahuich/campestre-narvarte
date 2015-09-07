<%@ page import="com.narvarte.campestre.TypeCost" %>

<div class="row">
    <div class="input-field col s4">
        <i class="material-icons prefix">payment</i>
        <input id="icon_prefix" type="text" class="validate" name="name" value="${typeCostInstance?.name}" required>
        <label for="icon_prefix" data-error="error" data-success="correcto">Nombre del Cobro</label>
    </div>
    <div class="input-field col s4">
        <i class="material-icons prefix">attach_money</i>
        <input id="icon_telephone" type="number" class="validate" name="cost" value="${typeCostInstance?.cost}" required>
        <label for="icon_telephone" data-error="error" data-success="correcto">Costo</label>
    </div>
    <div class="input-field col s4">
        <input type="checkbox" id="test5" name="status" <g:if test="${typeCostInstance?.status}">checked="checked"</g:if>/>
        <label for="test5" data-error="error" data-success="correcto">Estatus</label>
    </div>
</div>

