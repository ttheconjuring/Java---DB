import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.sql.*;
import java.util.Arrays;
import java.util.Properties;

public class ChangeTownNamesCasing {

    public static void main(String[] args) throws SQLException {

        Properties properties = new Properties();
        properties.setProperty("user", "root");
        properties.setProperty("password", "bocanito");

        String url = "jdbc:mysql://localhost:3306/minions_db";

        Connection connection = DriverManager.getConnection(url, properties);
        PreparedStatement preparedStatement;
        ResultSet resultSet;

        String country = null;

        try (BufferedReader bufferedReader = new BufferedReader(new InputStreamReader(System.in))) {
            country = bufferedReader.readLine();
        } catch (IOException e) {
            e.printStackTrace();
        }

        String query = "SELECT * FROM towns WHERE country = ?";
        preparedStatement = connection.prepareStatement(query);
        preparedStatement.setString(1, country);
        resultSet = preparedStatement.executeQuery();
        if (!resultSet.next()) {
            System.out.println("No town names were affected.");
        } else {
            query = """            
                    UPDATE towns
                    SET name = UPPER(name)
                    WHERE country = ?;""";

            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, country);

            preparedStatement.executeUpdate();

            query = "SELECT COUNT(*) FROM towns WHERE country = ?;";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, country);
            resultSet = preparedStatement.executeQuery();
            int n = -1;
            if (resultSet.next()) {
                n = resultSet.getInt(1);
                System.out.printf("%d town names were affected.%n", n);
            }

            query = "SELECT name FROM towns WHERE country = ?;";
            preparedStatement = connection.prepareStatement(query);
            preparedStatement.setString(1, country);
            resultSet = preparedStatement.executeQuery();
            String[] townNamesArray = new String[n];
            int i = 0;
            while (resultSet.next()) {
                townNamesArray[i++] = resultSet.getString("name");
            }
            System.out.println(Arrays.toString(townNamesArray));

        }

    }

}
