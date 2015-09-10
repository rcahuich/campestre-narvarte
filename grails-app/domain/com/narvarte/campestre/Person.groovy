package com.narvarte.campestre

import com.narvarte.campestre.enums.BaptismEnum
import com.narvarte.campestre.enums.TypePersonEnum

class Person {

    String name
    Date birthday
    Boolean headerFamily = false
    Boolean enrollment = false

    BaptismEnum baptism
    TypePersonEnum typePerson
    TypeCost typeCost

    Event event
    Family family
    Double fictitiousCost
    Double realCost

    Date dateCreated = new Date()
    Date dateUpdate = new Date()

    static belongsTo = [event: Event, family: Family]

    static constraints = {
        headerFamily nullable: true
        realCost nullable: true
        fictitiousCost nullable: true
        enrollment nullable: true
        family nullable: true
    }

    def getAge(){
        use(groovy.time.TimeCategory) {
            def duration = new Date() - birthday
            Double total = Math.round(duration.days / 365 * 100) / 100
            return total.trunc()
        }
    }

    String toString(){
        return "$name"
    }
}
