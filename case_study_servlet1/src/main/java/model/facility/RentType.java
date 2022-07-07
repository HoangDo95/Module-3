package model.facility;

public class RentType {
    private int idRT;
    private String nameRT;

    public RentType() {
    }

    public RentType(int idRT, String nameRT) {
        this.idRT = idRT;
        this.nameRT = nameRT;
    }

    public int getIdRT() {
        return idRT;
    }

    public void setIdRT(int idRT) {
        this.idRT = idRT;
    }

    public String getNameRT() {
        return nameRT;
    }

    public void setNameRT(String nameRT) {
        this.nameRT = nameRT;
    }
}
