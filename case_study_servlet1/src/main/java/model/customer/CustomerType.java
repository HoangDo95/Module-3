package model.customer;

public class CustomerType {
    private int idCusType;
    private String nameCusType;

    public CustomerType() {
    }

    public CustomerType(int idCusType, String nameCusType) {
        this.idCusType = idCusType;
        this.nameCusType = nameCusType;
    }

    public int getIdCusType() {
        return idCusType;
    }

    public void setIdCusType(int idCusType) {
        this.idCusType = idCusType;
    }

    public String getNameCusType() {
        return nameCusType;
    }

    public void setNameCusType(String nameCusType) {
        this.nameCusType = nameCusType;
    }
}
