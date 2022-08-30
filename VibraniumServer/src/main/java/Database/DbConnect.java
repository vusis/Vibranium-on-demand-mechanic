package Database;

import Database.Dao.dataDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

/**
 * DbTest is a small command-line tool used to check that we can connect to a SQLite database.
 *
 * By default (without any command-line arguments) it attempts to create a SQLite table in an in-memory database.
 * If it succeeds, we assume that all the working parts we need to use SQLite databases are in place and working.
 *
 * The only command-line argument this app understands is
 *  `-f <filename>`
 *  which tells that application to create the test table in a real (disk-resident) database named by the given
 *  filename. Note that the application _does not delete_ the named file, but leaves it in the filesystem
 *  for later examination if desired.
 */
public class DbConnect {
    public static final String IN_MEMORY_DB_URL = "jdbc:sqlite::memory:";

    public static final String DISK_DB_URL = "jdbc:sqlite:";
    public static final String DATABASE_NAME = "vibranium.db";

   public static void main( String[] args ) throws SQLException {
        getConnection();
       createTables(getConnection());
       dataDao.getAllPeople();
    }

    private static String dbUrl = DISK_DB_URL + DATABASE_NAME;

    public static Connection getConnection() throws SQLException {

        final Connection connection = DriverManager.getConnection(dbUrl); {
            System.out.println("Connected to database ");

            return connection;

        }

    }

    private static void createTables(Connection connection) {
        try (final Statement stmt = connection.createStatement()) {
            stmt.executeUpdate("CREATE TABLE IF NOT EXISTS person(" +
                    "ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT," +
                    "name VARCHAR ," +
                    "surname VARCHAR ," +
                    "address VARCHAR, " +
                    "cellNumber VARCHAR, " +
                    "email VARCHAR, " +
                    "password VARCHAR)");

            stmt.executeUpdate("CREATE TABLE mechanic( " +
                    "ID INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT," +
                    "companyName VARCHAR ," +
                    "companyAddress VARCHAR, " +
                    "companyTel VARCHAR, " +
                    "companyEmail VARCHAR, " +
                    "password VARCHAR)");

        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }


}