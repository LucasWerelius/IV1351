package se.kth.iv1351.musicjdbc.model;

public class RentalException extends Exception {
    
    public RentalException(String reason) {
        super(reason);
    }

    public RentalException(String reason, Throwable rootCause) {
        super(reason, rootCause);
    }
}
