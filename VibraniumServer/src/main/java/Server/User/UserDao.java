package Server.User;

public class UserDao {
    private Integer id;
    private String text;
    private String name, surname, address, cellNumber, email, password;

    /**
     * Use this convenient factory method to create a new quote.
     * Warning the ID will be null!
     * @param name the name of the person that said the text
     * @return a Quote object
     */
    public static UserDao create(String name, String surname, String address, String cellNumber, String email, String password) {
        UserDao person = new UserDao();
        person.setName(name);
        person.setSurname(surname);
        person.setAddress(address);
        person.setCellNumber(cellNumber);
        person.setEmail(email);
        person.setPassword(password);

        return person;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
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

    public void setEmail(String email) {
        this.email = email;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}