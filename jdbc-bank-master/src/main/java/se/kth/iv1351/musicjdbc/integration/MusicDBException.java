package se.kth.iv1351.musicjdbc.integration;

// When a call to the music DB fails
public class MusicDBException extends Exception {

    // Creates a  instance thrown with the specified reason
    public MusicDBException(String reason) {
        super(reason);
    }

    // Creates a  instance thrown with the specified reason and exception
    public MusicDBException(String reason, Throwable rootCause) {
        super(reason, rootCause);
    }
}
