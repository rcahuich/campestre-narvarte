<%@ page import="com.narvarte.campestre.enums.TypePersonEnum; com.narvarte.campestre.enums.BaptismEnum; com.narvarte.campestre.Person" %>

<div class="row">
    <div class="input-field col s6">
        <input id="name" type="text" class="validate" name="name" value="${person?.name}" aria-required="true" required placeholder="">
        <label for="name">Nombre Completo</label>
    </div>

    <div class="input-field col s6">
        <input id="birthday" type="date" class="datepicker validate" name="birthday" value="${formatDate(format:'dd/MM/yyyy',date:person?.birthday)}" required placeholder="">
        <label for="birthday">Fec. de Nacimiento</label>
    </div>

</div>

<div class="row">
    <div class="input-field col s6">
        <g:select id="baptism"
                  name="baptism"
                  from="${BaptismEnum.values()}"
                  value="${BaptismEnum}"
                  valueMessagePrefix="com.narvarte.campestre.enums.BaptismEnum"
                  required=""
        />
        <label for="baptism">Dato de Bautismo</label>
    </div>

    <div class="input-field col s6">
        <g:select id="typePerson"
                  name="typePerson"
                  from="${TypePersonEnum.values()}"
                  value="${TypePersonEnum}"
                  valueMessagePrefix="com.narvarte.campestre.enums.TypePersonEnum"
                  required=""
        />
        <label for="typePerson">Tipo de Persona</label>
    </div>

</div>

<div class="row">
    <div class="input-field col s6">
        <g:select id="typeCost"
                  name="typeCost"
                  from="${com.narvarte.campestre.TypeCost.findAllByStatus(true)}"
                  optionKey="id"
                  value="${person?.typeCost}"
                  class="many-to-one"
                  noSelection="['':'- Seleccione un Cobro -']"
                  data-cost="${person?.typeCost?.cost}"
                  required=""
        />
        <label for="realCost">Tipo de Costo</label>
    </div>

    <div class="input-field col s6">

    </div>

</div>

<div class="row">
    <div class="input-field col s6">
        <input id="realCost" type="number" class="validate" name="realCost" value="${person?.realCost}" aria-required="true" required placeholder="" readonly disabled>
        <label for="realCost">Costo Real</label>
    </div>

    <div class="input-field col s6">
        <input id="fictitiousCost" type="number" class="validate" name="fictitiousCost" value="${person?.fictitiousCost}" aria-required="true" required placeholder="">
        <label for="fictitiousCost">Costo Final</label>
    </div>

</div>





