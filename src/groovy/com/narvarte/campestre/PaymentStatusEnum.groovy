package com.narvarte.campestre

/**
 * Created by rbnseven on 06/09/15.
 */
public enum PaymentStatusEnum implements org.springframework.context.MessageSourceResolvable{
    PAY,
    PENDING,
    DECLINED

    Object[] getArguments() { [] as Object[] }

    String[] getCodes() {
        ["${getClass().name}.${name()}"] as String[]
    }

    String getDefaultMessage() { name() }

}