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
