package model.customer;

public class Customer {
    private int idCustomer;
    private int idCusType;
    private String name;
    private String dayOfBirth;
    private int gender;
    private String idCard;
    private String phoneNumber;
    private String email;
    private String address;

    public Customer() {

    }

    public Customer(int idCustomer, int idCusType, String name, String dayOfBirth, int gender, String idCard, String phoneNumber, String email, String address) {
        this.idCustomer = idCustomer;
        this.idCusType = idCusType;
        this.name = name;
        this.dayOfBirth = dayOfBirth;
        this.gender = gender;
        this.idCard = idCard;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
    }

    public Customer(int idCusType, String name, String dayOfBirth, int gender, String idCard, String phoneNumber, String email, String address) {
        this.idCusType = idCusType;
        this.name = name;
        this.dayOfBirth = dayOfBirth;
        this.gender = gender;
        this.idCard = idCard;
        this.phoneNumber = phoneNumber;
        this.email = email;
        this.address = address;
    }

    public int getIdCustomer() {
        return idCustomer;
    }

    public void setIdCustomer(int idCustomer) {
        this.idCustomer = idCustomer;
    }

    public int getIdCusType() {
        return idCusType;
    }

    public void setIdCusType(int idCusType) {
        this.idCusType = idCusType;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDayOfBirth() {
        return dayOfBirth;
    }

    public void setDayOfBirth(String dayOfBirth) {
        this.dayOfBirth = dayOfBirth;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public String getIdCard() {
        return idCard;
    }

    public void setIdCad(String idCard) {
        this.idCard = idCard;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
}
