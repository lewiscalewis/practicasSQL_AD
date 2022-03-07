import java.sql.*;

public class Sexto {
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
//        doctores();
//        pacientes();
//        visitas();
//        nuevoDoctor("54444654j", "pepe", 34, "cagaleras");
//        nuevoPaciente("8888848l", "paco", 6666666);
//        nuevaVisita("54444654j", "8888848l", "01/01/2015");
//        cumpleanos("54444654j");
          tfnoFijo();
    }

    public static void doctores(){
        try {
            Class.forName("org.sqlite.JDBC");
            Connection conn;
            // db parameters
            String url = "jdbc:sqlite:src/db/identifier.sqlite";
            // create a connection to the database
            conn = DriverManager.getConnection(url);

            Statement consulta = conn.createStatement();
            ResultSet rs = consulta.executeQuery("SELECT * FROM doctores");

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

    public static void pacientes(){
        try {
            Class.forName("org.sqlite.JDBC");
            Connection conn;
            // db parameters
            String url = "jdbc:sqlite:src/db/identifier.sqlite";
            // create a connection to the database
            conn = DriverManager.getConnection(url);

            Statement consulta = conn.createStatement();
            ResultSet rs = consulta.executeQuery("SELECT * FROM pacientes");

            while (rs.next()){
                System.out.println("Paciente: ");
                System.out.println(rs.getString("NIF"));
                System.out.println(rs.getString("nombre"));
                System.out.println(rs.getInt("tfln"));
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

    public static void visitas(){
        try {
            Class.forName("org.sqlite.JDBC");
            Connection conn;
            // db parameters
            String url = "jdbc:sqlite:src/db/identifier.sqlite";
            // create a connection to the database
            conn = DriverManager.getConnection(url);

            Statement consulta = conn.createStatement();
            ResultSet rs = consulta.executeQuery("SELECT * FROM visitas");

            while (rs.next()){
                System.out.println("Visita: ");
                System.out.println(rs.getString("NIF_doctor"));
                System.out.println(rs.getString("NIF_paciente"));
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

    public static void nuevoPaciente(String nif, String nombre, int tlfn) throws ClassNotFoundException, SQLException {
        Class.forName("org.sqlite.JDBC");
        Connection conn;
        // db parameters
        String url = "jdbc:sqlite:src/db/identifier.sqlite";
        // create a connection to the database
        conn = DriverManager.getConnection(url);

        Statement consulta = conn.createStatement();
        try{
            consulta.executeUpdate("INSERT INTO pacientes VALUES ('"+nif+"','" +nombre+"', '"+tlfn+"') ");
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public static void nuevoDoctor(String nif, String nombre, int edad, String especialidad) throws ClassNotFoundException, SQLException {
        Class.forName("org.sqlite.JDBC");
        Connection conn;
        // db parameters
        String url = "jdbc:sqlite:src/db/identifier.sqlite";
        // create a connection to the database
        conn = DriverManager.getConnection(url);

        Statement consulta = conn.createStatement();
        try{
            consulta.executeUpdate("INSERT INTO doctores (NIF, nombre, edad, especialidad) VALUES ('"+nif+"','" +nombre+"','"+edad+"','"+especialidad+"') ");
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public static void nuevaVisita(String doctor, String paciente, String fecha) throws SQLException, ClassNotFoundException {
        Class.forName("org.sqlite.JDBC");
        Connection conn;
        // db parameters
        String url = "jdbc:sqlite:src/db/identifier.sqlite";
        // create a connection to the database
        conn = DriverManager.getConnection(url);

        Statement consulta = conn.createStatement();
        try{
            consulta.executeUpdate("INSERT INTO visitas (NIF_doctor, NIF_paciente, fecha) VALUES ('"+doctor+"','" +paciente+"', '"+fecha+"') ");
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public static void cumpleanos(String doctor) throws ClassNotFoundException, SQLException {
        Class.forName("org.sqlite.JDBC");
        Connection conn;
        // db parameters
        String url = "jdbc:sqlite:src/db/identifier.sqlite";
        // create a connection to the database
        conn = DriverManager.getConnection(url);

        Statement consulta = conn.createStatement();
        try{
            ResultSet rs = consulta.executeQuery("SELECT edad FROM doctores WHERE NIF = " + "'"+doctor+"'");
            int edad = rs.getInt("edad");
            edad += 1;
            consulta.executeUpdate("UPDATE doctores set edad = "+edad+" WHERE doctor = " + "'"+doctor+"'");
        }catch (SQLException e){
            e.printStackTrace();
        }
    }

    public static void tfnoFijo() throws ClassNotFoundException, SQLException {
        Class.forName("org.sqlite.JDBC");
        Connection conn;
        // db parameters
        String url = "jdbc:sqlite:src/db/identifier.sqlite";
        // create a connection to the database
        conn = DriverManager.getConnection(url);

        Statement consulta = conn.createStatement();
        try{
            consulta.executeUpdate("SELECT REPLACE(tfln,'___%','950') FROM pacientes");
        }catch (SQLException e){
            e.printStackTrace();
        }
    }
}
