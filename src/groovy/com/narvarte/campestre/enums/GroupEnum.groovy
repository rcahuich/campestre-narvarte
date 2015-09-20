package com.narvarte.campestre.enums

/**
 * Created by rbnseven on 18/09/15.
 */
public enum GroupEnum implements org.springframework.context.MessageSourceResolvable{
    UNDER_4,
	MENOR_12,
    TEEN_17,
    YOUNG_ONE_34,
    YOUNG_TWO_35,
    MARRIED,
    WOMAN,
    MAN

    Object[] getArguments() { [] as Object[] }

    String[] getCodes() {
        ["${getClass().name}.${name()}"] as String[]
    }

    String getDefaultMessage() { name() }

}