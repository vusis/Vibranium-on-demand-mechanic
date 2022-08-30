package Server;

import Server.Company.CompanyDao;
import Server.User.UserDao;

import java.util.List;

public interface VibraniumDB {
    /**
     * Get a person quote by id.
     * @param id the Id of the person
     * @return a Person
     */
    UserDao get(Integer id);

    /**
     * Get all people in the database
     * @return A list of people
     */
    List<UserDao> all();

    /**
     * Add a single person to the database.
     * @param person the person to add
     * @return the newly added person
     */
    UserDao add(UserDao person);

    CompanyDao addCompany(CompanyDao company);

    UserDao getByLocation(String address);


}