package pl.coderslab.rentmanager.exception;

import java.util.NoSuchElementException;

public class NotSuchBillingExistsException  extends NoSuchElementException {

    public NotSuchBillingExistsException(String message) {
        super(message);
    }
}

