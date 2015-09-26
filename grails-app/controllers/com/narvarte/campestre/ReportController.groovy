package com.narvarte.campestre

import grails.converters.JSON

class ReportController {

    def reportService

    def index() {
        Integer totalFamily = Family.count()
        Double totalPayment = Person.findAll()*.fictitiousCost.sum()?:0.0
        Integer totalRegister = Person.count()
        Integer totalEnrollment = Person.countByEnrollment(true)

        [totalFamily: totalFamily, totalPayment: totalPayment, totalRegister: totalRegister, totalEnrollment: totalEnrollment]
    }

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

    def totalGroupsTeam(){
        try {
            Map dataGroupTeam = reportService.dataGroupTeams()
            render(template: "dataGroupsTeam", model: [data: dataGroupTeam])
        } catch (Exception e){
            log.error(e)
            response.status = 422
            render (e.getMessage())
        }
    }

}
