import java.sql.*;

public class Segundo {
    public static void main(String[] args) {
        pacientes();
    }

    public static void pacientes(){
        try {
            Class.forName("org.apache.derby.jdbc.EmbeddedDriver");
            Connection conn;
            // db parameters
            String url = "jdbc:derby:src/db";
            // create a connection to the database
            conn = DriverManager.getConnection(url);

            Statement consulta = conn.createStatement();
            ResultSet rs = consulta.executeQuery("SELECT * FROM visitas WHERE fecha > '01/06/2015'");

            while (rs.next()){
                System.out.println("Paciente: ");
                System.out.println(rs.getString("NIF_Paciente"));
                System.out.println(rs.getDate("fecha"));
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
