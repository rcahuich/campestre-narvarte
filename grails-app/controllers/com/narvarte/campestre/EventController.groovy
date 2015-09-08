package com.narvarte.campestre

import grails.converters.JSON

class EventController {

    def utilsService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        List<Event> eventList = Event.list()
        boolean showModal = !params.showModal ? false : params.boolean('showModal')

        [eventList: eventList, showModal: showModal]
    }

    def create(){
        boolean showModal = !params.showModal ? false : params.boolean('showModal')

        [showModal: showModal]
    }

    def saveEvent(){
        try {
            utilsService.saveEventData(params, session)
            render ([status:"succes", messague: "Se creo el evento ${params.name} correctamente."] as JSON)
        } catch (Exception e){
            log.error(e)
            response.status = 422
            render (e.getMessage())
        }
    }

    def detail(){
        Event event = Event.get(params.id.toLong())

        if(!event){
            log.error("Evento no encontrado.")
            redirect (action: "index")
            return
        }

        [event: event]
    }

    def edit(){
        Event event = Event.get(params.id.toLong())

        if(!event){
            log.error("Evento no encontrado para mostrar.")
            redirect (action: "index")
            return
        }

        [event: event]
    }

    def updateEvent(){
        try {
            utilsService.updateEventData(params, session)
            render ([status:"succes", messague: "Se actualizo el evento ${params.name} correctamente."] as JSON)
        } catch (Exception e){
            log.error(e)
            response.status = 422
            render (e.getMessage())
        }
    }

    def delete(){
        try {
            utilsService.deleteEventData(params, session)
            render ([status:"succes", messague: "Se elimino el Evento correctamente."] as JSON)
        } catch (Exception e){
            log.error(e)
            response.status = 422
            render (e.getMessage())
        }
    }


}
