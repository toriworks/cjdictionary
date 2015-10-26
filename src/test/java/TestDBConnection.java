import org.junit.Before;
import org.junit.Test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class TestDBConnection {

    private static final boolean DEBUG = true;

    private String ip;
    private int port;
    private String dbName;
    private String userName;
    private String userPwd;

    @Before
    public void beforeDbConnectTest() {

        if (DEBUG) {
            // Dev
            ip = "hyonga.iptime.org";
            port = 15433;
            dbName = "UCIOS";
            userName = "uci_dba";
            userPwd = "rhdro2015#";
        } else {
            // Real
            ip = "hyonga.iptime.org";
            port = 154383;
            dbName = "UCIOS";
            userName = "uci_dba";
            userPwd = "rhdro2015#";
        }
    }

    @Test
    public void dbConnection() {
        String connectionUrl = "jdbc:sqlserver://" + ip + ":" + port + ";" + "databaseName=" + dbName + ";";

        // Declare the JDBC objects.
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            // Establish the connection.
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            System.out.println("Driver okay");
            con = DriverManager.getConnection(connectionUrl, userName, userPwd);
            System.out.println("Connection Made");
        }
        // Handle any errors that may have occurred.
        catch (Exception e) {
            e.printStackTrace();
        }
    }

}
