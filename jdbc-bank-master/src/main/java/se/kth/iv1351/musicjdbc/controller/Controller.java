/*
 * The MIT License (MIT)
 * Copyright (c) 2020 Leif Lindbäck
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction,including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so,subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package se.kth.iv1351.musicjdbc.controller;

import java.sql.SQLException;
import java.util.List;

import se.kth.iv1351.musicjdbc.integration.MusicDAO;
import se.kth.iv1351.musicjdbc.integration.MusicDBException;
import se.kth.iv1351.musicjdbc.model.RentalDTO;
import se.kth.iv1351.musicjdbc.model.RentalException;

/**
 * This is the application's only controller, all calls to the model pass here.
 * The controller is also responsible for calling the DAO. Typically, the
 * controller first calls the DAO to retrieve data (if needed), then operates on
 * the data, and finally tells the DAO to store the updated data (if any).
 */
public class Controller {
    private final MusicDAO musicDb;

    /**
     * Creates a new instance, and retrieves a connection to the database.
     * 
     * @throws MusicDBException If unable to connect to the database.
     */
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
