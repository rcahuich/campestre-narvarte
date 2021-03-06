package com.narvarte.campestre.enums

/**
 * Created by rbnseven on 06/09/15.
 */
public enum TypePersonEnum implements org.springframework.context.MessageSourceResolvable{
    NORMAL,
    PASTOR,
    STAFF,
    ESPECIAL,
    SPEAKER,
    FAMILY_SPEAKER

    Object[] getArguments() { [] as Object[] }

    String[] getCodes() {
        ["${getClass().name}.${name()}"] as String[]
    }

    String getDefaultMessage() { name() }

}