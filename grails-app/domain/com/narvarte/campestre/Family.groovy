package com.narvarte.campestre

class Family {

    String name
    Person header
    List personsList
    List payments

    static hasMany = [personsList: Person, payments: PaymentEnroll]

    static constraints = {
    }

    Double totalPayment() {
        return personsList.findAll()*.realCost.sum()?:0.0
    }

    Double totalPay() {
        return payments.findAll()*.total.sum()?:0.0
    }
}
