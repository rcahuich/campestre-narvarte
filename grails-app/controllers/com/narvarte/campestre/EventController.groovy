package com.narvarte.campestre


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class EventController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Event.list(params), model: [eventInstanceCount: Event.count()]
    }

    def show(Event eventInstance) {
        respond eventInstance
    }

    def create() {
        respond new Event(params)
    }

    @Transactional
    def save() {
        println params
        if (params.startDate == "" || params.endtDate == ""){
            flash.error = "Las fechas no pueden ir vacias."
            render view: 'create'
            return
        }

        if (Event.findByStatus(true) ){

        }

        Event eventInstance = new Event()

        eventInstance.name = params.name
        eventInstance.startDate = Date.parse("dd/MM/yyyy", params.startDate)
        eventInstance.endtDate = Date.parse("dd/MM/yyyy", params.endtDate)
        eventInstance.status = !params.status ? false : params.boolean('status')

        if (eventInstance.hasErrors()) {
            respond eventInstance.errors, view: 'create'
            return
        }

        eventInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'event.label', default: 'Event'), eventInstance.id])
                redirect eventInstance
            }
            '*' { respond eventInstance, [status: CREATED] }
        }
    }

    def edit(Event eventInstance) {
        respond eventInstance
    }

    @Transactional
    def update() {
        println params
        if (params.startDate == "" || params.endtDate == ""){
            flash.error = "Las fechas no pueden ir vacias."
            render view: 'create'
            return
        }

        Event eventInstance = Event.get(params.id.toLong())

        if (eventInstance == null) {
            notFound()
            return
        }

        eventInstance.startDate = Date.parse("dd/MM/yyyy", params.startDate)
        eventInstance.endtDate = Date.parse("dd/MM/yyyy", params.endtDate)
        eventInstance.status = !params.status ? false : params.boolean('status')

        if (eventInstance.hasErrors()) {
            respond eventInstance.errors, view: 'edit'
            return
        }

        eventInstance.save flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Event.label', default: 'Event'), eventInstance.id])
                redirect eventInstance
            }
            '*' { respond eventInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Event eventInstance) {

        if (eventInstance == null) {
            notFound()
            return
        }

        eventInstance.delete flush: true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Event.label', default: 'Event'), eventInstance.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'event.label', default: 'Event'), params.id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NOT_FOUND }
        }
    }
}
