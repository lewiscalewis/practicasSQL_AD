import java.sql.*;

public class Primero {
    public static void main(String[] args) throws SQLException {
        pediatras();
    }

    public static void pediatras(){
        try {
            Class.forName("org.sqlite.JDBC");
            Connection conn;
            // db parameters
            String url = "jdbc:sqlite:src/db/identifier.sqlite";
            // create a connection to the database
            conn = DriverManager.getConnection(url);

            Statement consulta = conn.createStatement();
            ResultSet rs = consulta.executeQuery("SELECT * FROM doctores WHERE especialidad = 'pediatra'");

            while (rs.next()){
                System.out.println("Doctor: ");
                System.out.println(rs.getString("NIF"));
                System.out.println(rs.getString("nombre"));
                System.out.println(rs.getInt("edad"));
                System.out.println(rs.getString("especialidad"));
                System.out.println("--------------------------------------");
            }

            consulta.close();
            conn.close();

        } catch (SQLException e) {
            System.out.println(e.getMessage());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }
}
