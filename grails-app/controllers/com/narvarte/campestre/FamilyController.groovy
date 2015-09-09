package com.narvarte.campestre

import grails.converters.JSON

import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

class FamilyController {

    def utilsService
    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index() {
        List<Family> familyList = Family.list()

        [familyList: familyList]
    }

    def create() {}

    def saveFamily(){
        try {
            utilsService.saveFamilyData(params, session)
            render ([status:"succes", messague: "Se creo a la Familia ${params.name} correctamente."] as JSON)
        } catch (Exception e){
            log.error(e)
            response.status = 422
            render (e.getMessage())
        }
    }

}
