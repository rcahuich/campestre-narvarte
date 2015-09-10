
<%@ page import="com.narvarte.campestre.Person" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>Detalle de Persona</title>
	</head>
	<body>
		<div class="container">
            <h3 class="header light">Detalles de "${person.name}"</h3>
            <a class="waves-effect waves-light btn" href="${createLink(action: "index")}"><i
                    class="material-icons left">arrow_back</i> Lista de Registro</a>

            <br>
            <g:if test="${flash.message}">
                <div class="card-panel">
                    <span class="blue-text text-darken-2"><i class="material-icons left">done</i>${flash.message}</span>
                </div>
            </g:if>

            <div class="card lighten-1">
                <div class="card-content center-align">
                    <div class="card-title truncate black-text">${person.name}</div>
                    <i class="large material-icons">account_circle</i>
                    <p class="blue-text text-darken-4"></p>
                    <br>
                    <div class="row">
                        <div class="col m2 s6 center-align">Edad<br>${person.age} años</div>
                        <div class="col m2 s6 center-align">Fecha de Nac.<br><g:formatDate date="${person.birthday}" format="dd/MM/yyyy"/></div>
                        <div class="col m2 s6 center-align">Inscrito <br><g:message code="com.narvarte.campestre.boolean.${person?.enrollment}"/></div>
                        <div class="col m2 s6 center-align">Cabeza de Familia <br><g:message code="com.narvarte.campestre.boolean.${person?.headerFamily}"/></div>
                        <div class="col m2 s6 center-align">Tipo de Persona <br><g:message code="com.narvarte.campestre.enums.TypePersonEnum.${person?.typePerson}"/></div>
                        <div class="col m2 s6 center-align"><g:message code="com.narvarte.campestre.enums.BaptismEnum.${person?.baptism}"/></div>
                    </div>
                    <div class="row">
                        <div class="col m3 center-align">Costo<br>$ <g:formatNumber number="${person?.realCost}" format="###,##0" locale="us"/></div>
                        <div class="col m3 center-align">Costo a Pagar<br>$ <g:formatNumber number="${person?.fictitiousCost}" format="###,##0" locale="us"/></div>
                        <div class="col m3 center-align">Transporte <br><g:message code="com.narvarte.campestre.enums.TransportEnum.${person?.transport}"/></div>
                        <div class="col m3 center-align">Alojamiento <br><g:message code="com.narvarte.campestre.enums.LodgementEnum.${person?.lodgement}"/></div>
                    </div>
                </div>
                <div class="card-action center-align truncate">
                    <g:if test="${person.haveFamily}">
                        <a href="#" class="blue-text text-darken-4">Familia ${person?.family?.name}</a>
                    </g:if>
                    <g:else>
                        <a href="#" class="blue-text text-darken-4">Agregar a familia</a>
                    </g:else>
                    <a href="${createLink(action: "edit", id: person.id)}" class="blue-text text-darken-4">Editar Registro</a>

                </div>
            </div><!--/card-->


		</div>

	</body>
</html>
