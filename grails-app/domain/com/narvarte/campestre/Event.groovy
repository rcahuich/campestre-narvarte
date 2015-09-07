package com.narvarte.campestre

class Event {

    String name
    Date startDate
    Date endtDate
    Boolean status

    List persons

    static hasMany = [persons: Person]

    static constraints = {
    }
}
