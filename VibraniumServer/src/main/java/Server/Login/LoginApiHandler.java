package Server.Login;

import Database.Dao.dataDao;
import Server.Company.CompanyModel;
import Server.TestDatabase;
import Server.VibraniumDB;
import io.javalin.http.Context;
import io.javalin.http.HttpCode;

public class LoginApiHandler {

    private static final VibraniumDB database = new TestDatabase();
    static dataDao sqlDB = new dataDao();


    public static void getUserByEmailAndPass(Context context) {
        LoginModel loginModel = context.bodyAsClass(LoginModel.class);

        String name = loginModel.getEmail();
        String password = loginModel.getPassword();

        var userLogin = dataDao.getUserByEmail(name,password);

        System.out.println(userLogin);

        context.json(userLogin);
        if(!userLogin){
            context.status(HttpCode.UNAUTHORIZED);}
        else{
            context.status(HttpCode.ACCEPTED);
        }
    }
}
