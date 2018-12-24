package com.hyitclassnet.exception;

import org.acegisecurity.AuthenticationException;

public class ValidationCodeException extends AuthenticationException {   
    public ValidationCodeException(String s) {   
        super(s);   
    }   
}   
