package com.narvarte.campestre


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TypeCostController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond TypeCost.list(params), model:[typeCostInstanceCount: TypeCost.count()]
    }

    def show(TypeCost typeCostInstance) {
        respond typeCostInstance
    }

    def create() {
        respond new TypeCost(params)
    }

    @Transactional
    def save(TypeCost typeCostInstance) {
        if (typeCostInstance == null) {
            notFound()
            return
        }

        if (typeCostInstance.hasErrors()) {
            respond typeCostInstance.errors, view:'create'
            return
        }

        typeCostInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'typeCost.label', default: 'Tipo de Cobro'), typeCostInstance.name])
                redirect typeCostInstance
            }
            '*' { respond typeCostInstance, [status: CREATED] }
        }
    }

    def edit(TypeCost typeCostInstance) {
        respond typeCostInstance
    }

    @Transactional
    def update(TypeCost typeCostInstance) {
        println params
        if (typeCostInstance == null) {
            notFound()
            return
        }

        if (typeCostInstance.hasErrors()) {
            respond typeCostInstance.errors, view:'edit'
            return
        }

        typeCostInstance.status = !params.status ? false : params.boolean('status')
        typeCostInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TypeCost.label', default: 'Tipo de Cobro'), typeCostInstance.name])
                redirect typeCostInstance
            }
            '*'{ respond typeCostInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TypeCost typeCostInstance) {

        if (typeCostInstance == null) {
            notFound()
            return
        }

        typeCostInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TypeCost.label', default: 'Tipo de Cobro'), typeCostInstance.name])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'typeCost.label', default: 'Tipo de Cobro'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
