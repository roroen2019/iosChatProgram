package com.leanly.mobile.chat.constant;

public enum ResponseType {
    SUCCESS(200),
    BAD_REQUEST(400),
    NOT_FOUND(404),
    INTERNAL_SERVER_ERROR(500);

    private int statusCode;

    ResponseType(int statusCode) {
        this.statusCode = statusCode;
    }

    public int getStatusCode() {
        return statusCode;
    }

    public String getMessage() {
        return this.name();
    }
}
