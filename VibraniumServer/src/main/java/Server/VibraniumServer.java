package Server;

import Server.Company.CompanyApiHandler;
import Server.Login.LoginApiHandler;
import Server.User.UserApiHandler;
import io.javalin.Javalin;

public class VibraniumServer {
    private final Javalin server;

    public VibraniumServer() {
        server = Javalin.create(config -> {
            config.defaultContentType = "application/json";
            config.enableCorsForAllOrigins();
        });

        this.server.get("/people", context -> UserApiHandler.getAll(context));
        this.server.get("/person/{id}", context -> UserApiHandler.getOne(context));
        this.server.get("/people/{address}", context -> UserApiHandler.getAllByLocation(context));
        this.server.post("/people", context -> UserApiHandler.create(context));

        this.server.get("/company/{address}", context -> CompanyApiHandler.getAllByLocation(context));
        this.server.post("/company", context -> CompanyApiHandler.create(context));

        this.server.post("/login", context -> LoginApiHandler.getUserByEmailAndPass(context));

    }

    public static void main(String[] args) {
        VibraniumServer server = new VibraniumServer();
        server.start(5000);
    }

    public void start(int port) {
        this.server.start(port);
    }

    public void stop() {
        this.server.stop();
    }
}
