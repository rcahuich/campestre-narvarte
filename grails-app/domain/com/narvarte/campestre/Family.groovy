package com.narvarte.campestre

class Family {

    String name
    Person header
    List personsList
    List payments

    static hasMany = [personsList: Person, payments: PaymentEnroll]

    static constraints = {
    }

    static mapping = {
        personsList lazy: false, cascade: "all-delete-orphan"
    }

    Double totalPayment() {
        return personsList.findAll()*.fictitiousCost.sum()?:0.0
    }

    Double totalPay() {
        return payments.findAll()*.total.sum()?:0.0
    }

    Boolean payCompleted(){
        return this.totalPay() >= this.totalPayment() && this.payments.size() > 0
    }

}
