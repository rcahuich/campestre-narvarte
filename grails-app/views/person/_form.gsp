<%@ page import="com.narvarte.campestre.Person" %>



<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'headerFamily', 'error')} ">
	<label for="headerFamily">
		<g:message code="person.headerFamily.label" default="Header Family" />
		
	</label>
	<g:checkBox name="headerFamily" value="${personInstance?.headerFamily}" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'realCost', 'error')} ">
	<label for="realCost">
		<g:message code="person.realCost.label" default="Real Cost" />
		
	</label>
	<g:field name="realCost" value="${fieldValue(bean: personInstance, field: 'realCost')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'fictitiousCost', 'error')} ">
	<label for="fictitiousCost">
		<g:message code="person.fictitiousCost.label" default="Fictitious Cost" />
		
	</label>
	<g:field name="fictitiousCost" value="${fieldValue(bean: personInstance, field: 'fictitiousCost')}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'baptism', 'error')} required">
	<label for="baptism">
		<g:message code="person.baptism.label" default="Baptism" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="baptism" from="${com.narvarte.campestre.BaptismEnum?.values()}" keys="${com.narvarte.campestre.BaptismEnum.values()*.name()}" required="" value="${personInstance?.baptism?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'birthday', 'error')} required">
	<label for="birthday">
		<g:message code="person.birthday.label" default="Birthday" />
		<span class="required-indicator">*</span>
	</label>
	<g:datePicker name="birthday" precision="day"  value="${personInstance?.birthday}"  />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'enrollment', 'error')} ">
	<label for="enrollment">
		<g:message code="person.enrollment.label" default="Enrollment" />
		
	</label>
	<g:checkBox name="enrollment" value="${personInstance?.enrollment}" />

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'event', 'error')} required">
	<label for="event">
		<g:message code="person.event.label" default="Event" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="event" name="event.id" from="${com.narvarte.campestre.Event.list()}" optionKey="id" required="" value="${personInstance?.event?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="person.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${personInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'typeCost', 'error')} required">
	<label for="typeCost">
		<g:message code="person.typeCost.label" default="Type Cost" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="typeCost" name="typeCost.id" from="${com.narvarte.campestre.TypeCost.list()}" optionKey="id" required="" value="${personInstance?.typeCost?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: personInstance, field: 'typePerson', 'error')} required">
	<label for="typePerson">
		<g:message code="person.typePerson.label" default="Type Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="typePerson" from="${com.narvarte.campestre.TypePersonEnum?.values()}" keys="${com.narvarte.campestre.TypePersonEnum.values()*.name()}" required="" value="${personInstance?.typePerson?.name()}" />

</div>

