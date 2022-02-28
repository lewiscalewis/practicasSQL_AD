import java.sql.*;

public class Tercero {
    public static void main(String[] args) {
        mayores();
    }
    public static void mayores(){
        try {
            Class.forName("org.hsqldb.jdbcDriver");
            Connection conn;
            // db parameters
            String url = "jdbc:hsqldb:file:src/db/HSQL";
            // create a connection to the database
            conn = DriverManager.getConnection(url);

            Statement consulta = conn.createStatement();
            ResultSet rs = consulta.executeQuery("SELECT * FROM doctores WHERE edad > 50");

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
