package pl.coderslab.rentmanager.exception;

import java.util.NoSuchElementException;

public class NotSuchPropertyExistsException extends NoSuchElementException {

    public NotSuchPropertyExistsException(String message) {
        super(message);
    }
}
