package Database.Entities;

public class Company {

    public Company() {
    }

    private String ID;
    private String companyName;
    private String companyTel;
    private String companyAddress;
    private String companyEmail;
    private String password;


    public Company(String companyName, String companyAddress, String companyTel, String companyEmail, String password) {

        this.companyName = companyName;
        this.companyTel = companyTel;
        this.companyAddress = companyAddress;
        this.companyEmail = companyEmail;
        this.password = password;

    }



    public String getPersonID() {
        return ID;
    }

    public void setPersonID(String personID) {
        ID = personID;
    }


    public String getCompanyName() {
        return companyName;
    }

    public String getCompanyTel() {
        return companyTel;
    }

    public String getCompanyAddress() {
        return companyAddress;
    }

    public String getPassword() {
        return password;
    }

    public String getCompanyEmail() {
        return companyEmail;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public void setCompanyTel(String companyTel) {
        this.companyTel = companyTel;
    }

    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress;
    }

    public void setCompanyEmail(String companyEmail) {
        this.companyEmail = companyEmail;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
