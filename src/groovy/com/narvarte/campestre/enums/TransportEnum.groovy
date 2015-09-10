package com.narvarte.campestre.enums

/**
 * Created by rbnseven on 09/09/15.
 */
public enum TransportEnum  implements org.springframework.context.MessageSourceResolvable{
    BUS,
    CAR

    Object[] getArguments() { [] as Object[] }

    String[] getCodes() {
        ["${getClass().name}.${name()}"] as String[]
    }

    String getDefaultMessage() { name() }

}