<%@ page import="com.narvarte.campestre.Family" %>

<div class="row">

    <div class="input-field col s6">
        <input id="name" type="text" class="validate" name="name" value="${family?.name}" aria-required="true" required placeholder="">
        <label for="name">Nombre de la Familia</label>
    </div>

    <div class="input-field col s6">
        <g:select id="header" name="header"
                  from="${com.narvarte.campestre.Person.findAllByHeaderFamilyAndHaveFamily(false, false)}"
                  optionKey="id"
                  required=""
                  value="${family?.header?.name}"
                  class="many-to-one"/>
        <label for="header">Cabeza de Familia</label>
    </div>

</div>

<%--
<div class="fieldcontain ${hasErrors(bean: familyInstance, field: 'payments', 'error')} ">
	<label for="payments">
		<g:message code="family.payments.label" default="Payments" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${familyInstance?.payments?}" var="p">
    <li><g:link controller="paymentEnroll" action="show" id="${p.id}">${p?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="paymentEnroll" action="create" params="['family.id': familyInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'paymentEnroll.label', default: 'PaymentEnroll')])}</g:link>
</li>
</ul>

</div>

<div class="fieldcontain ${hasErrors(bean: familyInstance, field: 'persons', 'error')} ">
	<label for="persons">
		<g:message code="family.persons.label" default="Persons" />
		
	</label>
	<g:select name="persons" from="${com.narvarte.campestre.Person.list()}" multiple="multiple" optionKey="id" size="5" value="${familyInstance?.persons*.id}" class="many-to-many"/>

</div>--%>

