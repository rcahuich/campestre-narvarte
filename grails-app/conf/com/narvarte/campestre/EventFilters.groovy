package com.narvarte.campestre

class EventFilters {

    def filters = {
        all(controller: '*', action: '*', uriExclude: '/assets/**') {
            before = {
                if (controllerName != "event") {
                    Event event = Event.findByStatus(true)
                    List<Event> eventListDeactive = Event.findAllByStatus(false)

                    if (!event && eventListDeactive.empty){
                        redirect(controller: "event", action: "create", params: [showModal: true])
                    } else
                    if (!eventListDeactive.empty && !event){
                        redirect(controller: "event", action: "index", params: [showModal: true])
                    } else {
                        session["eventId"] = event.id
                    }
                    //println session["eventId"]
                }

            }
        }
    }

}
