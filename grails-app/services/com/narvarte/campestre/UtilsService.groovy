package com.narvarte.campestre

import com.narvarte.campestre.enums.BaptismEnum
import com.narvarte.campestre.enums.GroupEnum
import com.narvarte.campestre.enums.LodgementEnum
import com.narvarte.campestre.enums.TransportEnum
import com.narvarte.campestre.enums.TypePersonEnum
import grails.transaction.Transactional
import org.apache.commons.lang.RandomStringUtils

import javax.validation.constraints.Null

@Transactional
class UtilsService {

    def saveEventData(Map params, def session) {
        Boolean status = !params.status ? false : params.boolean('status')

        if (Event.findByStatus(true) && status){
            log.error("Existe un evento Activo.")
            throw new Exception("No puede existir dos eventos activos. Desactive la opción de Estatus si aún quiere guardarlo.");
        }

        Event event = new Event()
        event.name = params.name
        event.startDate = Date.parse("dd/MM/yyy", params.startDate)
        event.endtDate = Date.parse("dd/MM/yyy", params.endtDate)
        if (Event.list().size() == 0){
            event.status = true
        } else {
            event.status = status
        }

        event.validate()
        if(event.hasErrors()) {
            log.error(event.errors)
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.")
        }

        if (!event.save(flush: true)){
            log.error(event.errors)
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.")
        }

        if (event.status){
            session["eventId"] = event.id
        }

    }

    def updateEventData(Map params, def session) {
        Boolean status = !params.status ? false : params.boolean('status')

        if (Event.findByStatus(true) && status){
            log.error("Existe un evento Activo.")
            throw new Exception("No puede existir dos eventos activos. Desactive el Evento Activo quiere nombrar este evento como Activo.");
        }

        Event event = Event.get(params.id.toLong())

        if(!event) {
            log.error("No existe evento.")
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.")
        }

        event.name = params.name
        event.startDate = Date.parse("dd/MM/yyy", params.startDate)
        event.endtDate = Date.parse("dd/MM/yyy", params.endtDate)
        event.status = status

        event.validate()
        if(event.hasErrors()) {
            log.error(event.errors)
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.")
        }

        if (!event.save(flush: true)){
            log.error(event.errors)
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.")
        }

        if (event.status){
            session["eventId"] = event.id
        }

    }

    def deleteEventData(Map params, def session) {

        Event event = Event.get(params.id.toLong())

        if (!event){
            log.error("No existe evento.")
            throw new Exception("Evento no existe.");
        }

        if (event.status){
            log.error("Evento activo, no se puede borrar")
            throw new Exception("El evento se encuentra Activo, no se puede eliminar.")
        }


        event.delete(flush:true)

        List<Event> eventList = Event.findAllByStatus(true)
        if (eventList.empty){
            session.removeAttribute("eventId")
        }

    }

    def savePersonData(Map params, def session) {

        Person person = new Person()
        String eventId = session["eventId"]
        Event event = Event.get(eventId.toLong())

        person.name = params.name
        person.birthday = Date.parse("dd/MM/yyy", params.birthday).clearTime()
        person.baptism = BaptismEnum[params.baptism]
        person.typePerson = TypePersonEnum[params.typePerson]
        person.transport = TransportEnum[params.transport]
        person.lodgement = LodgementEnum[params.lodgement]
        person.groupTeam = GroupEnum[params.groupTeam]
        person.secured = !params.secured ? false : params.boolean('secured')
        person.typeCost = TypeCost.get(params.typeCost.id.toLong())
        person.event = event
        person.realCost = person.typeCost.cost
        person.fictitiousCost = params.double('fictitiousCost')

        event.addToPersons(person)
        event.save()

        person.validate()
        if (person.hasErrors()) {
            log.error(person.errors)
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.");
        }

        if (!person.save(flush: true)) {
            log.error(person.errors)
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.");
        }

    }

    def updatePersonData(Map params, def session) {
        Person person = Person.get(params.id.toLong())

        if(!person) {
            log.error("No existe la persona.")
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.")
        }

        person.name = params.name
        person.birthday = Date.parse("dd/MM/yyy", params.birthday).clearTime()
        person.baptism = BaptismEnum[params.baptism]
        person.typePerson = TypePersonEnum[params.typePerson]
        person.transport = TransportEnum[params.transport]
        person.lodgement = LodgementEnum[params.lodgement]
        person.groupTeam = GroupEnum[params.groupTeam]
        person.secured = !params.secured ? false : params.boolean('secured')
        person.typeCost = TypeCost.get(params.typeCost.id.toLong())
        person.realCost = person.typeCost.cost
        person.fictitiousCost = params.double('fictitiousCost')
        person.dateUpdate = new Date()

        person.validate()
        if (person.hasErrors()) {
            log.error(person.errors)
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.");
        }

        if (!person.save(flush: true)) {
            log.error(person.errors)
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.");
        }

    }

    def saveFamilyData(Map params, def session) {

        Person person = Person.get(params.header.toLong())

        if(!person) {
            log.error("No se encontro a la Persona para la Cabeza de familia.")
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.")
        }

        Family family = new Family()
        family.name = params.name
        family.header = person
        family.addToPersonsList(person)

        family.validate()
        if(family.hasErrors()) {
            log.error(family.errors)
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.")
        }

        if (!family.save(flush: true)){
            log.error(family.errors)
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.")
        }

        person.headerFamily = true
        person.haveFamily = true
        person.family = family
        person.save()

    }

    Map saveMemberInFamily(Map params) {

        Person person = Person.get(params.idMember.toLong())
        Family family = Family.get(params.id.toLong())

        if(!person || !family) {
            log.error("No se encontro a la Persona o Familia.")
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.")
        }

        family.addToPersonsList(person)

        family.validate()
        if(family.hasErrors()) {
            log.error(family.errors)
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.")
        }

        if (!family.save(flush: true)){
            log.error(family.errors)
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.")
        }

        person.haveFamily = true
        person.family = family
        person.save()

        return [success: true, person: person]

    }

    Map savePaymentInFamily(Map params, def session) {

        Family family = Family.get(params.id.toLong())
        String eventId = session["eventId"]
        Event event = Event.get(eventId.toLong())

        if(!family || !event) {
            log.error("No se encontro a la Familia.")
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.")
        }

        PaymentEnroll payment = new PaymentEnroll()
        payment.family = family
        payment.event = event
        payment.paymentDate = new Date()
        payment.personPay = params.personPay
        payment.total = params.double('realCost')
        payment.purchaseOrderNumber = generateRandomString(9)

        family.addToPayments(payment)

        payment.validate()
        if(payment.hasErrors()) {
            log.error(payment.errors)
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.")
        }

        if (!payment.save(flush: true)){
            log.error(payment.errors)
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.")
        }

        if (family.payCompleted()){
            family.personsList.each {Person person ->
                person.enrollment = true
                person.save(flush: true)
            }
        }

        return [success: true, family: family, payment: payment, ]

    }

    Map deleteMemberForFamily(Map params) {

        Person personTmp = Person.get(params.idMember.toLong())
        Family family = Family.get(params.id.toLong())

        if(!family || !personTmp) {
            log.error("No se encontro a la Persona o Familia.")
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.")
        }

        if (family.header == personTmp){
            log.error("No se puede eliminar a la Cabeza de Familia.")
            throw new Exception("No puede eliminar a la Cabeza de Familia.")
        }

        Person person = family.personsList.find {it.id == params.idMember.toLong()}
        Person personNew = new Person(
                name: person.name,
                birthday: person.birthday,
                baptism: person.baptism,
                typePerson: person.typePerson,
                transport: person.transport,
                lodgement: person.lodgement,
                typeCost: person.typeCost,
                groupTeam: person.groupTeam,
                event: person.event,
                fictitiousCost: person.fictitiousCost,
                realCost: person.realCost,
                dateCreated: person.dateCreated,
                dateUpdate: person.dateUpdate
        ).save(flush: true)

        family.removeFromPersonsList(person)

        return [success: true, person: personNew, family: family]
    }

    private String generateRandomString(int length){
        String charset = (('a'..'z') + ('A'..'Z') + ('0'..'9')).join()
        String randomString = RandomStringUtils.random(length, charset.toCharArray())

        return randomString.toUpperCase()
    }

}