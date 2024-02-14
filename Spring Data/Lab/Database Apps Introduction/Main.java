import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
import java.util.Properties;

public class Main {

    public static void main(String[] args) throws SQLException {

        Properties properties = new Properties();
        properties.setProperty("user", "root");
        properties.setProperty("password", "bocanito");

        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/diablo", properties);

        String user_name = null;
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(System.in))) {
            user_name = reader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }

        PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM users WHERE user_name = ?;");
        preparedStatement.setString(1, user_name);
        ResultSet resultSet = preparedStatement.executeQuery();

        if (!resultSet.next()) {
            System.out.println("No such user exists");
        } else {
            preparedStatement = connection.prepareStatement("""
                    SELECT user_name, first_name, last_name, COUNT(game_id) AS games_played
                    FROM users u
                             JOIN users_games ug ON u.id = ug.user_id
                    WHERE user_name = ?
                    GROUP BY user_id;
                    """);
            preparedStatement.setString(1, user_name);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                System.out.printf("%s | %s %s | %s", resultSet.getString("user_name"),
                        resultSet.getString("first_name"),
                        resultSet.getString("last_name"),
                        resultSet.getString("games_played"));
            }
        }

    }
}