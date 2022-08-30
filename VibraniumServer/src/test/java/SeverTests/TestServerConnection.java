package SeverTests;

import kong.unirest.HttpResponse;
import kong.unirest.JsonNode;
import kong.unirest.Unirest;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.*;

public class TestServerConnection {
    @Test
    public void TestServerConnection() {

        HttpResponse response = Unirest.post("http://localhost:5000/people").asString();
        System.out.println(response.getStatus());
        //assertTrue(response.getStatus() == 200);
    }

    @Test
    public void POSTNewPerson() {
//        HttpResponse response = Unirest.post("http://localhost:5000/people").body("{\n" +
//                "  \"name\": \"lee\",\n" +
//                "  \"surname\": \"Sithole\",\n" +
//                "  \"address\": \"Johannesburg\",\n" +
//                "  \"cellNumber\": \"0736863806\",\n" +
//                "  \"email\": \"vee@gmail.com\",\n" +
//                "  \"password\": \"ABc123$\",\n" +
//                "}").asString();

        HttpResponse<JsonNode> response = Unirest.post("http://localhost:5000/people")
                .field("name", "lee")
                .field("surname", "Sithole")
                .field("address", "Johannesburg")
                .field("cellNumber", "0732263806")
                .field("email", "leezz@gmail.com")
                .field("password", "ABc123$")
                .asJson();
        System.out.println(response.getStatus());
        //assertTrue(response.getStatus() == 200);
    }

    @Test
    public void POSTNewCompany() {

        HttpResponse response = Unirest.post("http://localhost:5000/company").body("{\n" +
                "  \"companyName\": \"lee Service Corp\",\n" +
                "  \"companyAddress\": \"Johannesburg\",\n" +
                "  \"companyTel\": \"0116863806\",\n" +
                "  \"companyEmail\": \"vee@gmail.com\",\n" +
                "  \"password\": \"ABc123$\",\n" +
                "}").asString();
        System.out.println(response.getStatus());
        //assertTrue(response.getStatus() == 200);
    }

    @Test
    public void GETCompaniesByLocation() {
        String location = "Germsiton";
        HttpResponse response = Unirest.get("http://localhost:5000/company/"+location).asString();
        System.out.println(response);
        assertTrue(response.getStatus() == 200);

    }

    @Test
    public void POSTUserLogin() {

        HttpResponse response = Unirest.post("http://localhost:5000/login").body("{\n" +
                "  \"companyEmail\": \"vee@gmail.com\",\n" +
                "  \"password\": \"ABc123$\",\n").asString();

        System.out.println(response.getStatus());
        //assertTrue(response.getStatus() == 200);
    }


}

