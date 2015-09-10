package com.narvarte.campestre

import com.narvarte.campestre.enums.BaptismEnum
import com.narvarte.campestre.enums.LodgementEnum
import com.narvarte.campestre.enums.TransportEnum
import com.narvarte.campestre.enums.TypePersonEnum
import grails.transaction.Transactional

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
        person.typeCost = TypeCost.get(params.typeCost.id.toLong())
        person.realCost = person.typeCost.cost
        person.fictitiousCost = params.double('fictitiousCost')

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

}