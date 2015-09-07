<%@ page import="com.narvarte.campestre.TypeCost" %>

<div class="row">
    <div class="input-field col s4">
        <i class="material-icons prefix">payment</i>
        <input id="icon_prefix" type="text" class="validate" name="name" value="${typeCostInstance?.name}">
        <label for="icon_prefix">Nombre del Cobro</label>
    </div>
    <div class="input-field col s4">
        <i class="material-icons prefix">attach_money</i>
        <input id="icon_telephone" type="number" class="validate" name="cost" value="${typeCostInstance?.cost}">
        <label for="icon_telephone">Costo</label>
    </div>
    <div class="input-field col s4">
        <input type="checkbox" id="test5" name="status" <g:if test="${typeCostInstance?.status}">checked="checked"</g:if> />
        <label for="test5">Estatus</label>
    </div>
</div>

