package Server.User;

import Database.Dao.dataDao;
import Database.Entities.Person;
import Server.TestDatabase;
import Server.VibraniumDB;
import io.javalin.http.Context;

public class UserApiHandler {
    private static final VibraniumDB database = new TestDatabase();
    static dataDao sqlDB = new dataDao();

    /**
     * Get all quotes
     *
     * @param context The Javalin Context for the HTTP GET Request
     */
    public static void getAll(Context context) {
        var allPeopleList=context.json(dataDao.getAllPeople());
        var allPeople = dataDao.getAllPeople();


        context.json(allPeople);
//        context.json(database.all());

    }
    public static void getAllByLocation(Context context) {
        //String email = context.pathParam("email");
        String address =context.pathParam("address");
        //Integer id = context.pathParamAsClass("id", Integer.class).get();
//        String location = context.pathParamAsClass("address", String.class).get();
//        PersonDao quote = database.getByLocation(location);
//        context.json(quote);

        var allMechenics = dataDao.getAllCompanyFromLocation(address);

        System.out.println(allMechenics);

        context.json(allMechenics);
    }

    /**
     * Get one quote
     *
     * @param context The Javalin Context for the HTTP GET Request
     */
    public static void getOne(Context context) {
        Integer id = context.pathParamAsClass("id", Integer.class).get();
        UserDao quote = database.get(id);
        context.json(quote);
    }


    /**
     * Create a new quote
     *
     * @param context The Javalin Context for the HTTP POST Request
     */
    public static void create(Context context) {
        System.out.println("create line 43");
        UserModel userModel = context.bodyAsClass(UserModel.class);

        System.out.println("im in create after personModel");
        System.out.println(context.body());

        String name = userModel.getName();
        String surname = userModel.getSurname();
        String address = userModel.getAddress();
        String cellNumber = userModel.getCellNumber();
        String email = userModel.getEmail();
        String password = userModel.getPassword();

        Person person = new Person(name,surname,address,cellNumber,email,password);
        System.out.println(person);
        dataDao.insertPerson(person);


        database.add(UserDao.create(name,surname,address,cellNumber,email,password));
        System.out.println(database);
        context.status(201);





    }
}