package com.narvarte.campestre

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
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.");
        }

        if (!event.save(flush: true)){
            log.error(event.errors)
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.");
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
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.");
        }

        event.name = params.name
        event.startDate = Date.parse("dd/MM/yyy", params.startDate)
        event.endtDate = Date.parse("dd/MM/yyy", params.endtDate)
        event.status = status

        event.validate()
        if(event.hasErrors()) {
            log.error(event.errors)
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.");
        }

        if (!event.save(flush: true)){
            log.error(event.errors)
            throw new Exception("Ocurrio un error al guardar. Intenta de nuevo.");
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
            throw new Exception("El evento se encuentra Activo, no se puede eliminar.");
        }


        event.delete(flush:true)

        List<Event> eventList = Event.findAllByStatus(true)
        if (eventList.empty){
            session.removeAttribute("eventId")
        }

    }

}
