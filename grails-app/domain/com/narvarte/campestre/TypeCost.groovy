package com.narvarte.campestre

class TypeCost {

    String name
    Double cost
    Boolean status

    static constraints = {
        status nullable: true
    }

    String toString() {
        return "$name - \$ $cost"
    }

}
