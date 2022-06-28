package model;

public class Customer {
    private String name;
    private String birthDay;
    private String address;
    private String pic;

    public Customer() {
    }

    public Customer(String name, String birthDay, String address, String pic) {
        this.name = name;
        this.birthDay = birthDay;
        this.address = address;
        this.pic = pic;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBirthDay() {
        return birthDay;
    }

    public void setBirthDay(String birthDay) {
        this.birthDay = birthDay;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPic() {
        return pic;
    }

    public void setPic(String pic) {
        this.pic = pic;
    }
}
