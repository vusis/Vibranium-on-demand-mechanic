package Database.Entities;

public class Person {

    public Person() {
    }

    private String ID;
    private String name;
    private String surname;
    private String cellNumber;
    private String address;
    private String email;
    private String password;



    public Person(String name, String surname, String address, String cellNumber, String email, String password) {

//        this.message = message;
//        this.author = author;
        this.name = name;
        this.surname = surname;
        this.cellNumber = cellNumber;
        this.address = address;
        this.email = email;
        this.password = password;

    }



    public String getPersonID() {
        return ID;
    }

    public void setPersonID(String personID) {
        ID = personID;
    }

    public String getSurname() {
        return this.surname;
    }

    public void setSurname(String surname) {
        this.surname = surname;
    }


    public String getCellNumber() {
        return this.cellNumber;
    }

    public void setCellNumber(String cellNumber) {
        this.cellNumber = cellNumber;
    }

    public String getAddress() {
        return this.address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public String getPassword() {
        return password;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
