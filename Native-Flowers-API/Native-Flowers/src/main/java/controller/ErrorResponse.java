package controller;

import domain.Result;
import domain.ResultType;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;

import java.time.LocalDateTime;

public class ErrorResponse {
    private final LocalDateTime timeStamp = LocalDateTime.now();
    private final String message;

    public static <T> ResponseEntity<Object> build(Result<T> results) {
        HttpStatus status = HttpStatus.INTERNAL_SERVER_ERROR;
        if (results.getType() == null || results.getType() == ResultType.INVALID) {
            status = HttpStatus.BAD_REQUEST;
        } else if (results.getType() == ResultType.NOT_FOUND) {
            status = HttpStatus.NOT_FOUND;
        }
        return new ResponseEntity<>(results.getMessages(), status);
    }

    public LocalDateTime getTimeStamp() {
        return timeStamp;
    }

    public String getMessage() {
        return message;
    }

    public ErrorResponse(String message) {
        this.message = message;
    }
}
