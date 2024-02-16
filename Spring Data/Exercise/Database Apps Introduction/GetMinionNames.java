import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
import java.util.Properties;

public class GetMinionNames {

    public static void main(String[] args) throws SQLException {

        Properties properties = new Properties();
        properties.setProperty("user", "root");
        properties.setProperty("password", "bocanito");

        String url = "jdbc:mysql://localhost:3306/minions_db";

        Connection connection = DriverManager.getConnection(url, properties);

        PreparedStatement preparedStatement = connection.prepareStatement("""
                SELECT m.name, age, v.name
                FROM minions m
                         JOIN minions_villains mv ON m.id = mv.minion_id
                JOIN villains v ON mv.villain_id = v.id
                WHERE mv.villain_id = ?;
                """);

        try (BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in))) {
            preparedStatement.setString(1, bufferedReader.readLine());
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        ResultSet resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            System.out.printf("Villain: %s%n", resultSet.getString("v.name"));
            System.out.printf("1. %s %s%n",
                    resultSet.getString("m.name"),
                    resultSet.getString("age"));
            int index = 2;
            while (resultSet.next()) {
                System.out.printf("%d. %s %s%n",
                        index++,
                        resultSet.getString("m.name"),
                        resultSet.getString("age"));
            }
        }

    }

}
