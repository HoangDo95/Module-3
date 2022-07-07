package model.employee;

public class Employee {
    private int idE;
    private String nameE;
    private String dayOfBirthE;
    private String idCardE;
    private double salaryE;
    private String phoneE;
    private String emailE;
    private String addressE;
    private int idPosition;
    private int idEducation;
    private int idDivision;
    private String userName;

    public Employee() {
    }

    public Employee(int idE, String nameE, String dayOfBirthE, String idCardE, double salaryE, String phoneE, String emailE, String addressE, int idPosition, int idEducation, int idDivision, String userName) {
        this.idE = idE;
        this.nameE = nameE;
        this.dayOfBirthE = dayOfBirthE;
        this.idCardE = idCardE;
        this.salaryE = salaryE;
        this.phoneE = phoneE;
        this.emailE = emailE;
        this.addressE = addressE;
        this.idPosition = idPosition;
        this.idEducation = idEducation;
        this.idDivision = idDivision;
        this.userName = userName;
    }

    public Employee(String nameE, String dayOfBirthE, String idCardE, double salaryE, String phoneE, String emailE, String addressE, int idPosition, int idEducation, int idDivision, String userName) {
        this.nameE = nameE;
        this.dayOfBirthE = dayOfBirthE;
        this.idCardE = idCardE;
        this.salaryE = salaryE;
        this.phoneE = phoneE;
        this.emailE = emailE;
        this.addressE = addressE;
        this.idPosition = idPosition;
        this.idEducation = idEducation;
        this.idDivision = idDivision;
        this.userName = userName;
    }

    public int getIdE() {
        return idE;
    }

    public void setIdE(int idE) {
        this.idE = idE;
    }

    public String getNameE() {
        return nameE;
    }

    public void setNameE(String nameE) {
        this.nameE = nameE;
    }

    public String getDayOfBirthE() {
        return dayOfBirthE;
    }

    public void setDayOfBirthE(String dayOfBirthE) {
        this.dayOfBirthE = dayOfBirthE;
    }

    public String getIdCardE() {
        return idCardE;
    }

    public void setIdCardE(String idCardE) {
        this.idCardE = idCardE;
    }

    public double getSalaryE() {
        return salaryE;
    }

    public void setSalaryE(double salaryE) {
        this.salaryE = salaryE;
    }

    public String getPhoneE() {
        return phoneE;
    }

    public void setPhoneE(String phoneE) {
        this.phoneE = phoneE;
    }

    public String getEmailE() {
        return emailE;
    }

    public void setEmailE(String emailE) {
        this.emailE = emailE;
    }

    public String getAddressE() {
        return addressE;
    }

    public void setAddressE(String addressE) {
        this.addressE = addressE;
    }

    public int getIdPosition() {
        return idPosition;
    }

    public void setIdPosition(int idPosition) {
        this.idPosition = idPosition;
    }

    public int getIdEducation() {
        return idEducation;
    }

    public void setIdEducation(int idEducation) {
        this.idEducation = idEducation;
    }

    public int getIdDivision() {
        return idDivision;
    }

    public void setIdDivision(int idDivision) {
        this.idDivision = idDivision;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }
}
