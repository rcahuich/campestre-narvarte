package com.narvarte.campestre

import com.narvarte.campestre.enums.BaptismEnum
import com.narvarte.campestre.enums.GroupEnum
import com.narvarte.campestre.enums.LodgementEnum
import com.narvarte.campestre.enums.TransportEnum
import com.narvarte.campestre.enums.TypePersonEnum
import grails.transaction.Transactional

@Transactional
class ReportService {

    List<Person> searchResult(Map params) {
        List<Person> personList = []
        List conditions = []
        Map conditionsValues = [:]

        if(params.baptism){
            if(params.baptism == "all"){
                conditions += [" person.baptism in :baptism "]
                conditionsValues.put("baptism",BaptismEnum.values().collect{it})
            }else{
                conditions += [" person.baptism = :baptism "]
                conditionsValues.put("baptism",BaptismEnum[params.baptism])
            }
        }

        if(params.typePerson){
            if(params.typePerson == "all"){
                conditions += [" person.typePerson in :typePerson "]
                conditionsValues.put("typePerson",TypePersonEnum.values().collect{it})
            }else{
                conditions += [" person.typePerson = :typePerson "]
                conditionsValues.put("typePerson",TypePersonEnum[params.typePerson])
            }
        }

        if(params.transport){
            if(params.transport == "all"){
                conditions += [" person.transport in :transport "]
                conditionsValues.put("transport",TransportEnum.values().collect{it})
            }else{
                conditions += [" person.transport = :transport "]
                conditionsValues.put("transport",TransportEnum[params.transport])
            }
        }

        if(params.lodgement){
            if(params.lodgement == "all"){
                conditions += [" person.lodgement in :lodgement "]
                conditionsValues.put("lodgement",LodgementEnum.values().collect{it})
            }else{
                conditions += [" person.lodgement = :lodgement "]
                conditionsValues.put("lodgement",LodgementEnum[params.lodgement])
            }
        }

        if(params.groupTeam){
            if(params.groupTeam == "all"){
                conditions += [" person.groupTeam in :groupTeam "]
                conditionsValues.put("groupTeam",GroupEnum.values().collect{it})
            }else{
                conditions += [" person.groupTeam = :groupTeam "]
                conditionsValues.put("groupTeam",GroupEnum[params.groupTeam])
            }
        }

        if (params.secured) {
            Boolean secured = !params.secured ? false : params.boolean('secured')
            conditions += [" person.secured = :secured "]
            conditionsValues.put("secured", secured)
        }

        if (params.enrollment) {
            Boolean enrollment = !params.enrollment ? false : params.boolean('enrollment')
            conditions += [" person.enrollment = :enrollment "]
            conditionsValues.put("enrollment", enrollment)
        }

        if (params.haveFamily) {
            conditions += [" person.haveFamily = :haveFamily "]
            conditionsValues.put("haveFamily", false)
        }

        personList = Person.executeQuery("SELECT person from Person as person ${conditions.isEmpty()?"":"  WHERE ${conditions.join(" AND ")}"} order by person.datePaymentCompleted asc",conditionsValues)

        return personList
    }

    Map dataGroupTeams() {
        Map result = [:]

        List nameGroups = [
                'Niño hasta 4 años',
                'Niño de 5 a 12 años',
                'Adolescente Menor de 17 años',
                'Jovenes 1, menor de 34 años',
                'Jovenes 2, mayor de 35 años',
                'Matrimonio',
                'Mujer',
                'Hombre'
        ]

        List valueGroups = [
                Person.countByGroupTeam(GroupEnum.UNDER_4),
                Person.countByGroupTeam(GroupEnum.MENOR_12),
                Person.countByGroupTeam(GroupEnum.TEEN_17),
                Person.countByGroupTeam(GroupEnum.YOUNG_ONE_34),
                Person.countByGroupTeam(GroupEnum.YOUNG_TWO_35),
                Person.countByGroupTeam(GroupEnum.MARRIED),
                Person.countByGroupTeam(GroupEnum.WOMAN),
                Person.countByGroupTeam(GroupEnum.MAN)
        ]

        result = [nameGroups: nameGroups, valueGroups: valueGroups]

        return result
    }
}
