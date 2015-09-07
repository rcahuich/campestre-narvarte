package com.narvarte.campestre

class Family {

    String name
    Person header
    List persons
    List payments

    static hasMany = [persons: Person, payments: PaymentEnroll]

    static constraints = {
    }
}
