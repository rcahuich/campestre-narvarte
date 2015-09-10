package com.narvarte.campestre.enums

/**
 * Created by rbnseven on 09/09/15.
 */
public enum LodgementEnum  implements org.springframework.context.MessageSourceResolvable{
    OWN_TENT,
    TENT_CHURCH_WOMEN,
    TENT_CHURCH_MAN,
    WOMEN_CABIN,
    MAN_CABIN,
    HOTEL

    Object[] getArguments() { [] as Object[] }

    String[] getCodes() {
        ["${getClass().name}.${name()}"] as String[]
    }

    String getDefaultMessage() { name() }

}