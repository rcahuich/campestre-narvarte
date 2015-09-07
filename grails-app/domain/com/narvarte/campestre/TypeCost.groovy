package com.narvarte.campestre

class TypeCost {

    String name
    Double cost
    Boolean status
    Person person

    static belongsTo = [person: Person]

    static constraints = {
        person nullable: true
    }

}
