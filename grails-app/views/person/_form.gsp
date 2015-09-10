<%@ page import="com.narvarte.campestre.enums.TransportEnum; com.narvarte.campestre.enums.LodgementEnum; com.narvarte.campestre.enums.TypePersonEnum; com.narvarte.campestre.enums.BaptismEnum; com.narvarte.campestre.Person" %>

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
                  value="${person?.baptism}"
                  valueMessagePrefix="com.narvarte.campestre.enums.BaptismEnum"
                  required=""
        />
        <label for="baptism">Dato de Bautismo</label>
    </div>

    <div class="input-field col s6">
        <g:select id="typePerson"
                  name="typePerson"
                  from="${TypePersonEnum.values()}"
                  value="${person?.typePerson}"
                  valueMessagePrefix="com.narvarte.campestre.enums.TypePersonEnum"
                  required=""
        />
        <label for="typePerson">Tipo de Persona</label>
    </div>

</div>

<div class="row">
    <div class="input-field col s6">
        <g:select id="typeCost"
                  name="typeCost.id"
                  from="${com.narvarte.campestre.TypeCost.findAllByStatus(true)}"
                  optionKey="id"
                  value="${person?.typeCost?.id}"
                  noSelection="['':'- Seleccione un Cobro -']"
                  required=""
        />
        <label for="typeCost">Tipo de Costo</label>
    </div>

    <div class="input-field col s6">
        <g:select id="lodgement"
                  name="lodgement"
                  from="${LodgementEnum.values()}"
                  value="${person?.lodgement}"
                  valueMessagePrefix="com.narvarte.campestre.enums.LodgementEnum"
                  required=""
        />
        <label for="lodgement">Alojamiento</label>
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

<div class="row">

    <div class="input-field col s6">
        <g:select id="transport"
                  name="transport"
                  from="${TransportEnum.values()}"
                  value="${person?.transport}"
                  valueMessagePrefix="com.narvarte.campestre.enums.TransportEnum"
                  required=""
        />
        <label for="transport">Tipo de Transporte</label>
    </div>

    <div class="input-field col s6">

    </div>

</div>





