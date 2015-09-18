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

    def detail(){
        Family family = Family.get(params.id.toLong())

        if(!family){
            log.error("Familia no encontrada.")
            redirect (action: "index")
            return
        }

        List<Person> personListForSelected = Person.findAllByHeaderFamilyAndHaveFamily(false,false);

        [family: family, personListForSelected: personListForSelected]
    }

    def addMember(){
        try {
            Map result = utilsService.saveMemberInFamily(params)
            render ([status:"succes", messague: "Se agrego a ${result.person.name} a la Familia ${result.person.family.name}."] as JSON)
        } catch (Exception e){
            log.error(e)
            response.status = 422
            render (e.getMessage())
        }
    }

    def addPayment(){
        try {
            Map result = utilsService.savePaymentInFamily(params, session)
            render ([status:"succes", messague: "Se realizó el pago de \$ ${result.payment.total} a la Familia ${result.family.name}."] as JSON)
        } catch (Exception e){
            log.error(e)
            response.status = 422
            render (e.getMessage())
        }
    }

}
