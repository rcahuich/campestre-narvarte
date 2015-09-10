package com.narvarte.campestre

import com.narvarte.campestre.enums.BaptismEnum
import com.narvarte.campestre.enums.LodgementEnum
import com.narvarte.campestre.enums.TransportEnum
import com.narvarte.campestre.enums.TypePersonEnum

class Person {

    String name
    Date birthday
    Boolean headerFamily = false
    Boolean enrollment = false
    Boolean haveFamily = false

    BaptismEnum baptism
    TypePersonEnum typePerson
    TransportEnum transport
    LodgementEnum lodgement
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
        haveFamily nullable: true
        transport nullable: true
        lodgement nullable: true
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
