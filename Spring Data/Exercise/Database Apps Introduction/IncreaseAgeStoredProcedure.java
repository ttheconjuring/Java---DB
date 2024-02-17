import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
import java.util.Properties;

public class IncreaseAgeStoredProcedure {

    public static void main(String[] args) throws SQLException {

        Properties properties = new Properties();
        properties.setProperty("user", "root");
        properties.setProperty("password", "bocanito");

        String url = "jdbc:mysql://localhost:3306/minions_db";

        Connection connection = DriverManager.getConnection(url, properties);

        int id = -1;
        try (BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in))) {
            id = Integer.parseInt(bufferedReader.readLine());
        } catch (IOException e) {
            e.printStackTrace();
        }

        CallableStatement callableStatement = connection.prepareCall("CALL usp_get_older(?)");
        callableStatement.setInt(1, id);
        ResultSet resultSet = callableStatement.executeQuery();

        resultSet.next();
        System.out.println(resultSet.getString(1) + " " + resultSet.getInt(2));


    }

}
