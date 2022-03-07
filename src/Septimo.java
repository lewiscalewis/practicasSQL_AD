import java.sql.*;

public class Septimo {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        equipos();
        presidentes();
        jugadores();
        equipos();
        partidos();
        goles();
//        nuevoPresidente("fdsfd", "dasdas", "edwqd", "2000-09-21", 2010);
//        nuevoJugador("elXoc", "dasdas", "2000-09-21", "defensa", "EQ003");
        goleadores();
        mFichajes("Real Estepa");
        clasificacion();
    }

    public static void equipos() throws SQLException, ClassNotFoundException {
        Connection c = connectionSQL();
        Statement s = c.createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM equipos");

        while (rs.next()){
            System.out.println("Equipos\n-----------------------------------\n"+rs.getString("Codigo"));
            System.out.println(rs.getString("Nombre"));
            System.out.println(rs.getString("Estadio"));
            System.out.println(rs.getInt("Aforo"));
            System.out.println(rs.getDate("Fundacion"));
            System.out.println(rs.getString("Presidente")+"\n");
        }
        c.close();

    }

    public static void presidentes() throws SQLException, ClassNotFoundException {
        Connection c = connectionSQL();
        Statement s = c.createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM presidentes");

        while (rs.next()){
            System.out.println("Presidentes\n-----------------------------------\n"+rs.getString("Dni"));
            System.out.println(rs.getString("Nombre"));
            System.out.println(rs.getString("Apellidos"));
            System.out.println(rs.getDate("Fecha_nac"));
            System.out.println(rs.getInt("Anno")+"\n");
        }
        c.close();
    }

    public static void jugadores() throws SQLException, ClassNotFoundException {
        Connection c = connectionSQL();
        Statement s = c.createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM jugadores");

        while (rs.next()){
            System.out.println("Jugadores\n-----------------------------------\n"+rs.getString("Codigo"));
            System.out.println(rs.getString("Nombre"));
            System.out.println(rs.getDate("Fecha"));
            System.out.println(rs.getString("Cod_equipo"));
            System.out.println(rs.getString("Posicion")+"\n");
        }
        c.close();
    }

    public static void partidos() throws SQLException, ClassNotFoundException {
        Connection c = connectionSQL();
        Statement s = c.createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM partidos");

        while (rs.next()){
            System.out.println("Partidos\n-----------------------------------\n"+rs.getString("Codigo"));
            System.out.println(rs.getDate("Fecha"));
            System.out.println(rs.getString("Equipo_local"));
            System.out.println(rs.getString("Equipo_visitante")+"\n");
        }
        c.close();
    }

    public static void goles() throws SQLException, ClassNotFoundException {
        Connection c = connectionSQL();
        Statement s = c.createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM goles");

        while (rs.next()){
            System.out.println("Goles\n-----------------------------------\n"+rs.getString("Cod_Partido"));
            System.out.println(rs.getInt("Minuto"));
            System.out.println(rs.getString("Descripcion"));
            System.out.println(rs.getInt("PropiaPuerta"));
            System.out.println(rs.getString("Cod_jugador")+"\n");
        }
        c.close();
    }

    public static void nuevoPresidente(String dni, String nombre, String apellidos, String fecha_nac, int anno) throws SQLException, ClassNotFoundException {
        Connection c = connectionSQL();
        PreparedStatement s = c.prepareStatement("INSERT INTO presidentes (Dni, Nombre, Apellidos, Fecha_nac, Anno) VALUES (?, ?, ?, ?, ?)");

        s.setString(1, dni);
        s.setString(2, nombre);
        s.setString(3, apellidos);
        s.setString(4, fecha_nac);
        s.setInt(5, anno);

        try {
            System.out.println("Presidente insertado, tablas afectadas: "+s.executeUpdate());
        }catch (SQLException e){
            e.printStackTrace();
        }
        c.close();
    }

    public static void nuevoJugador(String codigo, String nombre, String fecha, String posicion, String equipo) throws SQLException, ClassNotFoundException {
        Connection c = connectionSQL();
        PreparedStatement s = c.prepareStatement("INSERT INTO jugadores (Codigo, Nombre, Fecha, Posicion, Cod_equipo) VALUES (?, ?, ?, ?, ?)");

        s.setString(1, codigo);
        s.setString(2, nombre);
        s.setString(3, fecha);
        s.setString(4, posicion);
        s.setString(5, equipo);

        try {
            System.out.println("Jugador insertado, tablas afectadas: "+s.executeUpdate());
        }catch (SQLException e){
            e.printStackTrace();
        }
        c.close();
    }

    public static void goleadores() throws SQLException, ClassNotFoundException {
        Connection c = connectionSQL();
        Statement s = c.createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM jugadores");
        Statement s1 = c.createStatement();
        ResultSet rs1;

        while (rs.next()){
            System.out.println("Goleadores\n-----------------------------------\n"+rs.getString("Codigo"));
            System.out.println(rs.getString("Nombre"));
            System.out.println(rs.getDate("Fecha"));
            System.out.println(rs.getString("Cod_equipo"));
            System.out.println(rs.getString("Posicion"));
            rs1 = s1.executeQuery("SELECT count(COD_jugador) as goles FROM jugadores LEFT JOIN goles g on jugadores.Codigo = g.Cod_jugador WHERE jugadores.Codigo = '"+rs.getString("Codigo")+"'");
            rs1.next();
            System.out.println("Goles marcados : "+rs1.getString("goles")+"\n");
        }
        c.close();
    }

    public static void mFichajes(String equipo) throws SQLException, ClassNotFoundException {
        Connection c = connectionSQL();
        CallableStatement cst = c.prepareCall("{call fichaje (?,?,?)}");

        Statement s = c.createStatement();
        ResultSet rs = s.executeQuery("SELECT Cod_equipo, Codigo, count(Minuto) as Goles FROM jugadores, goles WHERE Cod_equipo = \'"+equipo+"\' AND Cod_jugador = jugadores.Codigo");

        while (rs.next()){
            cst.setString(1, rs.getString("Codigo"));
            cst.setString(2, rs.getString("Cod_equipo"));
            cst.setInt(3, rs.getInt("Goles"));
        }

        try {
            cst.execute();
            System.out.println("Jugadores de "+equipo+" cambiados!");
        }catch (SQLException e){
            System.out.println("Ha ocurrido un error al ejecutar el procedimiento almacenado fichajes - MYSQL");
        }
        c.close();
    }

    public static void clasificacion() throws SQLException, ClassNotFoundException {
        Connection c = connectionSQL();

        Statement s = c.createStatement();
        ResultSet rs = s.executeQuery("SELECT * FROM equipos");
        String sql = "{ ? = call golesEquipo (?) } ";

        // Preparamos la llamada
        CallableStatement llamada = c.prepareCall(sql);

        while (rs.next()){

            // Establecemos los marcadores y registramos la salida
            llamada.registerOutParameter(1, Types.INTEGER);
            llamada.setString(2, rs.getString("Codigo"));

            // Ejecutamos la sentencia
            llamada.execute();
            System.out.println("Equipo "+rs.getString("Nombre")+", goles: "+llamada.getInt(1));
        }

        llamada.close();
        c.close();
    }

    public static Connection connectionSQL() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/Liga", "root", "root");
        return c;
    }

}
