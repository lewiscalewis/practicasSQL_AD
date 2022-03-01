import java.sql.*;

public class Cuarto {
    public static void main(String[] args) {
        telefonos();
    }
    public static void telefonos(){
        try {
            Class.forName("org.h2.Driver");
            Connection conn;
            // db parameters
            String url = "jdbc:h2:C:/Users/lewis/IdeaProjects/practicasSQL_AD/src/db";
            // create a connection to the database
            conn = DriverManager.getConnection(url);

            Statement consulta = conn.createStatement();
            ResultSet rs = consulta.executeQuery("SELECT PACIENTES.NOMBRE, PACIENTES.TFLN  FROM PACIENTES WHERE NOMBRE LIKE '%a'");

            while (rs.next()){
                System.out.println("Paciente: ");
                System.out.println(rs.getString("nombre"));
                System.out.println(rs.getString("tfln"));
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
