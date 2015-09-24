package com.narvarte.campestre

import grails.converters.JSON

class ReportController {

    def reportService

    def index() {}

    def report() {}

    def detail(){
        Person person = Person.get(params.id.toLong())

        if(!person){
            log.error("Persona no encontrada.")
            redirect (action: "index")
            return
        }

        [person: person]
    }

    def searchData(){
        try {
            List<Person> personList = reportService.searchResult(params)
            render(template: "data", model: [personList: personList])
        } catch (Exception e){
            log.error(e)
            response.status = 422
            render (e.getMessage())
        }
    }

}
