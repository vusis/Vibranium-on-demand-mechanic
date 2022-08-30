package Server.Company;

public class CompanyModel {
    private String companyName;
    private String companyTel;
    private String companyAddress;
    private String companyEmail;
    private String password;

    public String getCompanyName() {
        return companyName;
    }

    public String getCompanyTel() {
        return companyTel;
    }

    public String getCompanyAddress() {
        return companyAddress;
    }

    public String getCompanyEmail() {
        return companyEmail;
    }

    public String getPassword() {return password;}


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
