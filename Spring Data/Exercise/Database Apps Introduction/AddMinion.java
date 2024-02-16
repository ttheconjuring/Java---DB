import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
import java.util.Properties;

public class AddMinion {


    public static void main(String[] args) throws SQLException {

        Properties properties = new Properties();
        properties.setProperty("user", "root");
        properties.setProperty("password", "bocanito");

        String url = "jdbc:mysql://localhost:3306/minions_db";

        Connection connection = DriverManager.getConnection(url, properties);
        PreparedStatement preparedStatement;

        try (BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in))) {
            String[] minionDataArray = bufferedReader.readLine().substring(8).split(" ");

            // minion's town existence check
            String query = "SELECT * FROM towns WHERE name = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, minionDataArray[2]);
            ResultSet resultSet = preparedStatement.executeQuery();
            if (!resultSet.next()) {
                connection.createStatement().executeUpdate("INSERT INTO towns (name) VALUES ('" + minionDataArray[2] + "');");
                System.out.println("Town " + minionDataArray[2] + " was added to the database.");
            }

            // getting town_id
            int town_id = -1;
            query = """
                    SELECT id
                    FROM towns
                    WHERE name = ?;
                    """;
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, minionDataArray[2]);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                town_id = resultSet.getInt("id");
            } else {
                System.out.println("Couldn't find the town_id!");
            }

            // adding minion to the database
            connection.createStatement().executeUpdate("INSERT INTO minions (name, age, town_id)  VALUES ('" + minionDataArray[0] + "', " + Integer.parseInt(minionDataArray[1]) + ", " + town_id + ");");

            String villainName = bufferedReader.readLine().substring(9);

            // checking if the villain exists
            query = "SELECT * FROM villains WHERE name = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, villainName);
            resultSet = preparedStatement.executeQuery();
            if (!resultSet.next()) {
                connection.createStatement().executeUpdate("INSERT INTO villains (name, evilness_factor) VALUES ('" + villainName + "', 'evil');");
                System.out.println("Villain " + villainName + " was added to the database.");
            }

            // getting the minion id
            int minion_id = -1;
            query = "SELECT id FROM minions WHERE name = '" + minionDataArray[0] + "' AND age = " + Integer.parseInt(minionDataArray[1]) + " AND town_id = " + town_id + ";";
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                minion_id = resultSet.getInt("id");
            }

            // getting the villain id
            int villain_id = -1;
            query = "SELECT id FROM villains WHERE name = '" + villainName + "';";
            preparedStatement = connection.prepareStatement(query);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                villain_id = resultSet.getInt("id");
            }

            // setting the minion to be servant of the villain
            connection.createStatement().executeUpdate("INSERT INTO minions_villains (minion_id, villain_id) VALUES (" + minion_id + ", " + villain_id + ");");
            System.out.println("Successfully added " + minionDataArray[0] + "to be minion of " + villainName);

        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
