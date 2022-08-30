package Server;

import Server.Company.CompanyDao;
import Server.User.UserDao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class TestDatabase implements VibraniumDB {
    private Map<Integer, UserDao> people;
    private Map<Integer, CompanyDao> companies;
    private Map<String, UserDao> all_quotes_list;

    public TestDatabase() {
        people = new HashMap<>();
        companies = new HashMap<>();


        this.add(UserDao.create("Vusi", "Sithole","Johannesburg","0736863806", "sit@gmail.com", "12345"));
        this.add(UserDao.create("Fikile", "Sibisi","Johannesburg","0736863806", "tit@gmail.com", "12345"));
        this.add(UserDao.create("John", "Zik","Germiston","0736863806", "sat@gmail.com", "12345"));
        


    }

    @Override
    public UserDao get(Integer id) {
        return people.get(id);
    }

    @Override
    public UserDao getByLocation(String address) {
        return people.get(address);
    }

    @Override
    public List<UserDao> all() {
        return new ArrayList<>(people.values());
    }


    public List<CompanyDao> allCompanies() {
        return new ArrayList<>(companies.values());
    }

    @Override
    public UserDao add(UserDao person) {
        Integer index = people.size() + 1;
        person.setId(index);
        people.put(index, person);
        return person;
    }

    @Override
    public CompanyDao addCompany(CompanyDao company) {
        Integer index = companies.size() + 1;
        company.setId(index);
        companies.put(index, company);
        return company;
    }


}


