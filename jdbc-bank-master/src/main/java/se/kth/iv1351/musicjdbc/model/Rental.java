package se.kth.iv1351.musicjdbc.model;

public class Rental implements RentalDTO{
    
    private String instrumentId;
    private String instrumentBrand;
    private String returnDate;
    private String studentId;
    private String instrumentType;
    private String rentalFee;

    public Rental(String instrumentId, String instrumentType, String instrumentBrand, String returnDate, String studentId,  String rentalFee) {
        this.instrumentId = instrumentId;
        this.instrumentType = instrumentType;
        this.instrumentBrand = instrumentBrand;
        this.returnDate = returnDate;
        this.studentId = studentId;
        this.rentalFee = rentalFee;
    }

    //used to print list of all instruments
    public Rental(String instrumentId, String instrumentType, String instrumentBrand, String rentalFee) {
        this(instrumentType, instrumentId, rentalFee, null, null, instrumentBrand);
    }
    
    //used to rent instrument
    public Rental(String instrumentId, String studentId, String returnDate) {
        this(instrumentId, null, null, returnDate, studentId, null);
    }

    public String getId(){
        return instrumentId;
    }
    public String getBrand(){
        return instrumentBrand;
    }
    public String getReturnDate(){
        return returnDate;
    }
    public String getStudentId(){
        return studentId;
    }
    public String getType(){
        return instrumentType;
    }
    public String getFee(){
        return rentalFee;
    }

}
