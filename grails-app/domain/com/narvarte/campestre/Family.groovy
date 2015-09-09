package com.narvarte.campestre

class Family {

    String name
    Person header
    List personsList
    List payments

    static hasMany = [personsList: Person, payments: PaymentEnroll]

    static constraints = {
    }
}
