package Server.User;

public class UserModel {
    private String name;
    private String surname;
    private String address;
    private String cellNumber;
    private String email;
    private String password;


    public String getSurname() {
        return surname;
    }

    public String getCellNumber() {
        return cellNumber;
    }

    public String getAddress() {
        return address;
    }

    public String getName() {
        return name;
    }

    public String getEmail() {return email;}

    public String getPassword() {return password;}


    public void setCellNumber(String cellNumber) {
        this.cellNumber = cellNumber;
    }

    public void setName(String name) {
        this.name = name;
    }
    public void setSurname(String surname) {
        this.surname = surname;
    }
    public void setAddress(String address) {
        this.address = address;
    }

}
