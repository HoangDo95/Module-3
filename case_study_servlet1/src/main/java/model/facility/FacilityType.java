package model.facility;

public class FacilityType {
    private int idFT;
    private String nameFT;

    public FacilityType() {
    }

    public FacilityType(int idFT, String nameFT) {
        this.idFT = idFT;
        this.nameFT = nameFT;
    }

    public int getIdFT() {
        return idFT;
    }

    public void setIdFT(int idFT) {
        this.idFT = idFT;
    }

    public String getNameFT() {
        return nameFT;
    }

    public void setNameFT(String nameFT) {
        this.nameFT = nameFT;
    }
}
