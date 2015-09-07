package com.narvarte.campestre

class Person {

    String name
    Date birthday
    Boolean headerFamily
    Boolean enrollment

    BaptismEnum baptism
    TypePersonEnum typePerson
    TypeCost typeCost

    Event event
    Double fictitiousCost
    Double realCost

    Date dateCreated

    static belongsTo = [event: Event]

    static constraints = {
        headerFamily nullable: true
        realCost nullable: true
        fictitiousCost nullable: true
    }

    def getAge(){
        use(groovy.time.TimeCategory) {
            def duration = new Date() - birthday
            Double total = Math.round(duration.days / 365 * 100) / 100
            return total.trunc()
        }
    }
}
