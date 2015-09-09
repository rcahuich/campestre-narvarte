package com.narvarte.campestre.enums

/**
 * Created by rbnseven on 06/09/15.
 */
public enum BaptismEnum implements org.springframework.context.MessageSourceResolvable{
    YES_BAPTIZED,
    NOT_BAPTIZED

    Object[] getArguments() { [] as Object[] }

    String[] getCodes() {
        ["${getClass().name}.${name()}"] as String[]
    }

    String getDefaultMessage() { name() }

}