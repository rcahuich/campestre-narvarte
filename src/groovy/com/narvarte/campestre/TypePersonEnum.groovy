package com.narvarte.campestre

/**
 * Created by rbnseven on 06/09/15.
 */
public enum TypePersonEnum implements org.springframework.context.MessageSourceResolvable{
    NORMAL,
    PASTOR,
    STAFF,
    ESPECIAL

    Object[] getArguments() { [] as Object[] }

    String[] getCodes() {
        ["${getClass().name}.${name()}"] as String[]
    }

    String getDefaultMessage() { name() }

}