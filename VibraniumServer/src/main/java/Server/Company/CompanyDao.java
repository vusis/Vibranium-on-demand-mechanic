package Server.Company;

public class CompanyDao {
    private Integer id;
    private String text;
    private String companyName,companyAddress,companyTel,companyEmail,password;


    public static CompanyDao create(String companyName, String companyAddress,String companyTel,String companyEmail,String password) {
        CompanyDao company = new CompanyDao();
        company.setCompanyName(companyName);
        company.setCompanyAddress(companyAddress);
        company.setCompanyTel(companyTel);
        company.setCompanyEmail(companyEmail);
        company.setPassword(password);

        return company;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public void setCompanyAddress(String companyAddress) {
        this.companyAddress = companyAddress;
    }

    public void setCompanyTel(String companyTel) {
        this.companyTel = companyTel;
    }

    public void setCompanyEmail(String companyEmail) {
        this.companyEmail = companyEmail;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}