package context;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbContext {
	public static Connection getConnection() throws ClassNotFoundException, SQLException{
        try {
            String url = "jdbc:postgresql://db.lngiijgmrxafnozlqeqp.supabase.co:5432/postgres?user=postgres&password=SparklingStones123OK";
            Class.forName("org.postgresql.Driver");
            Connection connection = DriverManager.getConnection(url);
            System.out.println("--------------> Connect Successful <--------------");
            return connection;
        } catch(Exception e) {
            e.printStackTrace();
        }
        return null;
    } 
}
