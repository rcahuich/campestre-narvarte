package com.narvarte.campestre

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class PersonController {

    def utilsService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        List<Person> personList = Person.list()

        [personList: personList]
    }

    def create() {
        if (TypeCost.list().size() == 0 && !TypeCost.findByStatus(true)){
            redirect(controller: "typeCost", action: "create", params: [showModal: true])
            return
        }

    }

    def savePerson(){
        try {
            utilsService.savePersonData(params, session)
            render ([status:"succes", messague: "Se creo el Registro de ${params.name} correctamente."] as JSON)
        } catch (Exception e){
            log.error(e)
            response.status = 422
            render (e.getMessage())
        }
    }
}
