package Server.Company;

import Database.Dao.dataDao;
import Database.Entities.Company;
import Server.TestDatabase;
import Server.VibraniumDB;
import io.javalin.http.Context;

public class CompanyApiHandler {
    private static final VibraniumDB database = new TestDatabase();
    static dataDao sqlDB = new dataDao();

    /**
     * Get all quotes
     *
     * @param context The Javalin Context for the HTTP GET Request
     */
    public static void getAll(Context context) {
        var allCompanyList=context.json(dataDao.getAllPeople());
        var allCompanies = dataDao.getAllPeople();


        context.json(allCompanies);
//        context.json(database.all());

    }
    public static void getAllByLocation(Context context) {

        String address =context.pathParam("address");

        var allMechenics = dataDao.getAllCompanyFromLocation(address);

        System.out.println(allMechenics);

        context.json(allMechenics);
    }

    /**
     * Get one quote
     *
     * @param context The Javalin Context for the HTTP GET Request
     */
//    public static void getOne(Context context) {
//        Integer id = context.pathParamAsClass("id", Integer.class).get();
//        UserDao quote = database.get(id);
//        context.json(quote);
//    }


    /**
     * Create a new quote
     *
     * @param context The Javalin Context for the HTTP POST Request
     */
    public static void create(Context context) {
        CompanyModel companyModel = context.bodyAsClass(CompanyModel.class);

        String companyName = companyModel.getCompanyName();
        String companyAddress= companyModel.getCompanyAddress();
        String companyTel = companyModel.getCompanyTel();
        String companyEmail= companyModel.getCompanyEmail();
        String password = companyModel.getPassword();

        Company company= new Company(companyName,companyAddress,companyTel,companyEmail,password);
        dataDao.insertCompany(company);


        database.addCompany(CompanyDao.create(companyName,companyAddress,companyTel,companyEmail,password));
        System.out.println(database);
        context.status(201);

    }
}