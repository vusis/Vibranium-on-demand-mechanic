package Database.Dao;

import Database.DbConnect;
import Database.Entities.Company;
import Database.Entities.Person;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class dataDao {

    public static boolean insertPerson(Person person) {
        try {
            String sql = "insert into person values (?,?,?,?,?,?,?) ";
            PreparedStatement ps = DbConnect.getConnection().prepareStatement(sql);
            ps.setString(2, person.getName());
            ps.setString(3, person.getSurname());
            ps.setString(4, person.getAddress());
            ps.setString(5, person.getCellNumber());
            ps.setString(6, person.getEmail());
            ps.setString(7, person.getPassword());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }

    public static boolean insertCompany(Company company) {
        try {
            String sql = "insert into mechanic values (?,?,?,?,?,?) ";
            PreparedStatement ps = DbConnect.getConnection().prepareStatement(sql);
            ps.setString(2, company.getCompanyName());
            ps.setString(3, company.getCompanyAddress());
            ps.setString(4, company.getCompanyTel());
            ps.setString(5, company.getCompanyEmail());
            ps.setString(6, company.getPassword());

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;

    }

    public static List<Person> getAllPeople(){
        List<Person> allPeopleList = null;

        allPeopleList = new ArrayList<Person>();
        String sql = "select * from person";
        try {
            PreparedStatement ps = DbConnect.getConnection().prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Person newPerson = new Person();
                newPerson.setPersonID(rs.getString("ID"));
                newPerson.setName(rs.getString("name"));
                newPerson.setSurname(rs.getString("surname"));
                newPerson.setAddress(rs.getString("address"));
                newPerson.setCellNumber(rs.getString("cellNumber"));
                newPerson.setEmail(rs.getString("email"));
                newPerson.setPassword(rs.getString("password"));


                allPeopleList.add(newPerson);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        for(Person person: allPeopleList){
            System.out.println(person.getAddress());
        }
        return allPeopleList;
    }

    public static List<Company> getAllCompanyFromLocation(String address){
        List<Company> allCompanyList = null;

        allCompanyList = new ArrayList<Company>();
        String sql = "select * from mechanic where companyAddress = ?";
        try {
            PreparedStatement ps = DbConnect.getConnection().prepareStatement(sql);
            ps.setString(1,address);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Company newCompany = new Company();
                newCompany.setPersonID(rs.getString("ID"));
                newCompany.setCompanyName(rs.getString("companyName"));
                newCompany.setCompanyAddress(rs.getString("companyAddress"));
                newCompany.setCompanyTel(rs.getString("companyTel"));
                newCompany.setCompanyEmail(rs.getString("companyEmail"));
                newCompany.setPassword(rs.getString("password"));


                allCompanyList.add(newCompany);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        for(Company company: allCompanyList){
            System.out.println(company.getCompanyAddress());
        }
        return allCompanyList;
    }

    public static boolean getUserByEmail(String email, String password){
        List<Person> allPeopleList = null;

        allPeopleList = new ArrayList<Person>();
        boolean status = false;
        String sql = "select * from person where email = ? and password = ?";
        try {
            PreparedStatement ps = DbConnect.getConnection().prepareStatement(sql);
            ps.setString(1,email);
            ps.setString(2,password);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Person newPerson = new Person();
                newPerson.setPersonID(rs.getString("ID"));
                newPerson.setName(rs.getString("name"));
                newPerson.setSurname(rs.getString("surname"));
                newPerson.setAddress(rs.getString("address"));
                newPerson.setCellNumber(rs.getString("cellNumber"));
                newPerson.setEmail(rs.getString("email"));
                newPerson.setPassword(rs.getString("password"));


                allPeopleList.add(newPerson);
                if (allPeopleList.size() >= 1){
                    status = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return status;
    }
}



