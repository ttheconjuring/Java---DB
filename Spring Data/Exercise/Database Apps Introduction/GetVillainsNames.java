import java.sql.*;
import java.util.Properties;

public class GetVillainsNames {

    public static void main(String[] args) throws SQLException {

        Properties properties = new Properties();
        properties.setProperty("user", "root");
        properties.setProperty("password", "bocanito");

        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/minions_db", properties);

        ResultSet resultSet = connection.createStatement().executeQuery("""
                SELECT name,
                       COUNT(minion_id) AS minions_count
                FROM villains v
                         JOIN minions_villains mv ON v.id = mv.villain_id
                GROUP BY mv.villain_id
                HAVING minions_count > 15
                ORDER BY minions_count DESC;""");

        while (resultSet.next()) {
            System.out.printf("%s %s%n",
                    resultSet.getString("name"),
                    resultSet.getString("minions_count"));
        }

    }
}