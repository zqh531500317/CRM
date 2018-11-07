package com.zqh.crm.exception;

public class ManageException extends Exception {
    private String message;

    public ManageException(String message) {
        super(message);
        this.message=message;
    }

    @Override
    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }
}
