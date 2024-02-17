import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
import java.util.Arrays;
import java.util.Properties;

public class IncreaseMinionsAge {

    public static void main(String[] args) throws SQLException {

        Properties properties = new Properties();
        properties.setProperty("user", "root");
        properties.setProperty("password", "bocanito");

        String url = "jdbc:mysql://localhost:3306/minions_db";

        Connection connection = DriverManager.getConnection(url, properties);
        PreparedStatement preparedStatement;
        ResultSet resultSet;
        String query;

        try (BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in))) {
            int[] minionIDs = Arrays.stream(bufferedReader.readLine().split(" ")).mapToInt(Integer::parseInt).toArray();
            int n = minionIDs.length;

            // increasing age and making the name lowercase
            query = """
                    UPDATE minions
                    SET age = age + 1, name = LOWER(name)
                    WHERE id = ?;
                    """;
            for (int minionID : minionIDs) {
                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setInt(1, minionID);
                preparedStatement.executeUpdate();
            }

            // printing all names and ages of the minions
            resultSet = connection.createStatement().executeQuery("SELECT name, age FROM minions");
            while (resultSet.next()) {
                System.out.printf("%s %d%n",
                        resultSet.getString("name"),
                        resultSet.getInt("age"));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }

    }

}
