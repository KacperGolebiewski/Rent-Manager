package pl.coderslab.rentmanager.exception;

import java.util.NoSuchElementException;

public class NotSuchTenantExistsException  extends NoSuchElementException {

    public NotSuchTenantExistsException(String message) {
        super(message);
    }
}
