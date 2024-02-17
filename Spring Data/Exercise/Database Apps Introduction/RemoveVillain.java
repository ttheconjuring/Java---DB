import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
import java.util.Properties;

public class RemoveVillain {

    public static void main(String[] args) throws SQLException {

        Properties properties = new Properties();
        properties.setProperty("user", "root");
        properties.setProperty("password", "bocanito");

        String url = "jdbc:mysql://localhost:3306/minions_db";

        Connection connection = DriverManager.getConnection(url, properties);
        PreparedStatement preparedStatement;
        ResultSet resultSet;
        String query;

        int villain_id = -1;
        try (BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in))) {
            villain_id = Integer.parseInt(bufferedReader.readLine());
        } catch (IOException e) {
            e.printStackTrace();
        }

        String villain_name;
        // check if such villain exists
        query = "SELECT name FROM villains WHERE id = ?";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setInt(1, villain_id);
        resultSet = preparedStatement.executeQuery();
        if (!resultSet.next()) {
            System.out.println("No such villain was found");
        } else {
            villain_name = resultSet.getString("name");

            // dropping constraint
            connection.createStatement().executeUpdate("ALTER TABLE minions_villains DROP CONSTRAINT fk_villains_minions;");

            // deleting villain
            query = "DELETE FROM villains WHERE id = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, villain_id);
            if (preparedStatement.executeUpdate() > 0) {
                System.out.printf("%s was deleted%n", villain_name);
            }

            String count = null;
            // getting the count of the servants
            query = "SELECT COUNT(*) FROM minions_villains WHERE villain_id = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, villain_id);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                count = resultSet.getString(1);
            }

            // deleting servants
            query = "DELETE FROM minions_villains WHERE villain_id = ?";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setInt(1, villain_id);
            preparedStatement.executeUpdate();

            System.out.printf("%s minions released%n", count);

            // adding constraint back
            connection.createStatement().executeUpdate("""
                    ALTER TABLE minions_villains
                        ADD CONSTRAINT fk_villains_minions FOREIGN KEY (villain_id)
                            REFERENCES villains (id);""");


        }

    }

}
