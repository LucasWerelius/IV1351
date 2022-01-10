package se.kth.iv1351.musicjdbc.integration;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import se.kth.iv1351.musicjdbc.model.Rental;

public class MusicDAO {

    private Connection connection;
    private PreparedStatement listInstrumentsStmt;
    private PreparedStatement listInstruments2Stmt;
    private PreparedStatement checkStudentRentStmt;
    private PreparedStatement checkInstrumentRentStmt;
    private PreparedStatement rentStmt;
    private PreparedStatement terminateRentalStmt;

    public MusicDAO() throws MusicDBException {
        try {
            connectToBankDB();
            prepareStatements();
        } catch (ClassNotFoundException | SQLException exception) {
            throw new MusicDBException("Could not connect to datasource.", exception);
        }
    }

    private void prepareStatements() throws SQLException {
        listInstrumentsStmt = connection.prepareStatement("" +
        "SELECT instruments.name, rentable_instruments.id, rentable_instruments.fee, brands.name as brand" +
        " FROM rentable_instruments " +
        " INNER JOIN brands ON brands.id = rentable_instruments.brand_id" + 
        " INNER JOIN instruments ON instruments.id = rentable_instruments.instrument_id" +
        " WHERE rentable_instruments.id NOT IN (" +
        " SELECT rentable_instrument_id" +
        " FROM rented_instrument" +
        " WHERE CURRENT_DATE >= lease_start AND CURRENT_DATE < lease_end)" +
        " AND instruments.name = ?");

        listInstruments2Stmt = connection.prepareStatement("" +
        "SELECT instruments.name, rentable_instruments.id, rentable_instruments.fee, brands.name as brand" +
        " FROM rentable_instruments " +
        " INNER JOIN brands ON brands.id = rentable_instruments.brand_id" + 
        " INNER JOIN instruments ON instruments.id = rentable_instruments.instrument_id" +
        " WHERE rentable_instruments.id NOT IN (" +
        " SELECT rentable_instrument_id" +
        " FROM rented_instrument" +
        " WHERE CURRENT_DATE >= lease_start AND CURRENT_DATE < lease_end)");

        checkStudentRentStmt = connection.prepareStatement("" + 
        "SELECT COUNT(*) FROM rented_instrument WHERE student_id=? AND CURRENT_DATE < lease_end");

        checkInstrumentRentStmt = connection.prepareStatement("" +
        "SELECT COUNT(*)" +
        " FROM rentable_instruments " +
        " INNER JOIN brands ON brands.id = rentable_instruments.brand_id" + 
        " INNER JOIN instruments ON instruments.id = rentable_instruments.instrument_id" +
        " WHERE rentable_instruments.id = ? AND rentable_instruments.id NOT IN (" +
        " SELECT rentable_instrument_id" +
        " FROM rented_instrument" +
        " WHERE CURRENT_DATE >= lease_start AND CURRENT_DATE < lease_end)");

        rentStmt = connection.prepareStatement("INSERT INTO rented_instrument VALUES(DEFAULT, ?, ?, CURRENT_DATE, CURRENT_DATE + 365)");

		terminateRentalStmt = connection.prepareStatement("UPDATE rented_instrument " +
        "SET lease_end = CURRENT_DATE WHERE id = (SELECT id FROM rented_instrument " +
        "WHERE rentable_instrument_id=? AND student_id=? AND CURRENT_DATE < lease_end " +
        "ORDER BY lease_end DESC LIMIT 1)");
    }

    public void updateRent(int studId, int rentId) throws MusicDBException {
        String failureMsg = "Could not terminate rental";
        try{

            terminateRentalStmt.setInt(1, rentId);
            terminateRentalStmt.setInt(2, studId);
            int rowsUpdated = terminateRentalStmt.executeUpdate();

            if(rowsUpdated != 1)
                handleException(failureMsg, null);
            else {
                System.out.println("Rental was terminated for student_id = " + studId + " with instrument_id = " + rentId);
                connection.commit();
            }
        }
        catch(SQLException e){
            handleException(failureMsg, e);
        }
    }

    public void createRent(int studId, int instId) throws MusicDBException{
        String failureMsg = "Could not rent instrument";
        try {
            rentStmt.setInt(1, instId);
            rentStmt.setInt(2, studId);
            rentStmt.executeUpdate();
            System.out.println("Rental has now begun");
            connection.commit();
        }catch (SQLException e) {
            handleException(failureMsg, e);
        }
    }

    public int readWantedInstrument(int id) throws MusicDBException{
        String failureMsg = "Could not check if instrument is already rented";
        try {
            checkInstrumentRentStmt.setInt(1, id);
            ResultSet previousRentals = checkInstrumentRentStmt.executeQuery();
            previousRentals.next();
            return Integer.parseInt(previousRentals.getString(1));
        } catch (SQLException e) {
            handleException(failureMsg, e);
            return 999;
        }
    }

    public int readNbrOfRentals(int id) throws MusicDBException{
        String failureMsg = "Could not check if student already rents instruments";
        try {
            checkStudentRentStmt.setInt(1, id);
            ResultSet previousRentals = checkStudentRentStmt.executeQuery();
            previousRentals.next();
            return Integer.parseInt(previousRentals.getString(1));

        } catch (SQLException e) {
            handleException(failureMsg, e);
            return 999;
        }
    }

   public List<Rental> readInstruments(String instrument) throws MusicDBException {
        String failureMsg = "Could not list instruments";
        List<Rental> rentals = new ArrayList<>();
        ResultSet result = null;
        try {
            if (instrument.equals("")){
                result = listInstruments2Stmt.executeQuery();
            }
            else{
                listInstrumentsStmt.setString(1, instrument);
                result = listInstrumentsStmt.executeQuery();
            }
            while(result.next()) {rentals.add(new Rental(
                result.getString("name"), 
                result.getString("id"), 
                result.getString("fee"), 
                result.getString("brand")));
            }
            connection.commit();
        } catch (SQLException e) {
            handleException(failureMsg, e);
        }
        finally {
            closeResultSet(failureMsg, result);
        }
        return rentals;
    }

    private void connectToBankDB() throws ClassNotFoundException, SQLException {
        connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/musicschool",
                                                 "postgres", "abc123");
        connection.setAutoCommit(false);
    }

    private void handleException(String failureMsg, Exception cause) throws MusicDBException {
        String completeFailureMsg = failureMsg;
        try {
            connection.rollback();
        } catch (SQLException rollbackExc) {
            completeFailureMsg = completeFailureMsg + 
            ". Also failed to rollback transaction because of: " + rollbackExc.getMessage();
        }
        if (cause != null) {
            throw new MusicDBException(failureMsg, cause);
        } else {
            throw new MusicDBException(failureMsg);
        }
    }

    private void closeResultSet(String failureMsg, ResultSet result) throws MusicDBException {
        try {
            result.close();
        } catch (Exception e) {
            throw new MusicDBException(failureMsg + " Could not close result set.", e);
        }
    }
}
