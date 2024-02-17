import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class PrintAllMinionNames {

    public static void main(String[] args) throws SQLException {

        Properties properties = new Properties();
        properties.setProperty("user", "root");
        properties.setProperty("password", "bocanito");

        String url = "jdbc:mysql://localhost:3306/minions_db";

        Connection connection = DriverManager.getConnection(url, properties);
        ResultSet resultSet;

        List<String> minionNames = new ArrayList<>();
        resultSet = connection.createStatement().executeQuery("SELECT name FROM minions");
        while (resultSet.next()) {
            minionNames.add(resultSet.getString("name"));
        }

        int n = minionNames.size();

        // Print first and last names
        System.out.println(minionNames.getFirst());
        System.out.println(minionNames.get(n - 1));

        // Loop through remaining names with alternating order
        for (int i = 1; i < n - 1; i++) {
            System.out.println(minionNames.get(i));
            System.out.println(minionNames.get(n - i - 1));
        }

    }

}
