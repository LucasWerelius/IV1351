package se.kth.iv1351.musicjdbc.controller;

import java.sql.SQLException;
import java.util.List;

import se.kth.iv1351.musicjdbc.integration.MusicDAO;
import se.kth.iv1351.musicjdbc.integration.MusicDBException;
import se.kth.iv1351.musicjdbc.model.RentalDTO;
import se.kth.iv1351.musicjdbc.model.RentalException;

public class Controller {
    private final MusicDAO musicDb;

    public Controller() throws MusicDBException {
        musicDb = new MusicDAO();
    }

    public List<? extends RentalDTO> listAllInstruments(String Instrument) throws RentalException {
        try {
            return musicDb.readInstruments(Instrument);
        } catch (MusicDBException e) {
            throw new RentalException("Unable to list instruments", e);
        }
    }

    public void checkStudent(int studId, int instId) throws RentalException, SQLException{
        try {
            if(musicDb.readNbrOfRentals(studId) < 2){
                if(musicDb.readWantedInstrument(instId) > 0){
                    musicDb.createRent(studId, instId);
                }
                else
                    System.out.println("Instrument " + instId + " is already rented or does not exist");
            }
            else
                System.out.println("Student " + studId + " has currently too many leases to rent a new instrument");
        } catch (MusicDBException e) {
            throw new RentalException("Could not rent instrument", e);
        }
    }

    public void terminateRental(int studId, int instId) throws RentalException{
        try {
            musicDb.updateRent(studId, instId);
        } catch (MusicDBException e) {
            throw new RentalException("Unable to terminate rental");
        }
    }
}
