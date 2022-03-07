import java.sql.*;

public class Quinto {
    public static void main(String[] args) {
        //prueba(args[0]);
        prueba("Nba");
    }

    public static void prueba(String url) {
        try {
            // Cargar el driver
            Class.forName("org.sqlite.JDBC");
            // Establecemos la conexion con la BD
            Connection conexion = DriverManager.getConnection("jdbc:sqlite:src/db/"+url);

            // Creamos objeto DatabaseMetaData
            DatabaseMetaData dbmd = conexion.getMetaData();

            System.out.println("Información sobre la base de datos:");
            System.out.println("===================================");
            System.out.println("Nombre : " + dbmd.getDatabaseProductName());
            System.out.println("Driver : " + dbmd.getDriverName());
            System.out.println("URL    : " + dbmd.getURL());

            //Recorrer filas

            ResultSet rst;
            ResultSet rsc;
            rst = dbmd.getTables(null, null, null, null);
            String tabla="";

            while(rst.next()){

                tabla = rst.getObject(3).toString();
                System.out.println("Nombre de Tabla: "+tabla);
                ResultSet rsp = dbmd.getPrimaryKeys(null, null, tabla);
                ResultSet claves = dbmd.getImportedKeys(null, null, tabla);

                if(rsp.next()){
                    System.out.println("Primary Key: "+rsp.getObject(4));
                    if(claves.next()){
                        System.out.println("Clave Extranjera: "+claves.getString("FKTABLE_NAME"));
                        claves.close();
                    }
                    rsp.close();
                }

                rsc = dbmd.getColumns(null, null, tabla, null);

                while(rsc.next()){
                    System.out.println("    Columna "+rsc.getString(4));
                    System.out.println("    Tipo: "+rsc.getString(6));
                }

                rsc.close();

            }

            ResultSet procedimientos = dbmd.getProcedures(null, null, null);
            int contador = 0;

            System.out.println("\nProcedimientos:");
            System.out.println("===============");

            while (procedimientos.next()) {
                String proc_name = procedimientos.getString("PROCEDURE_NAME");
                String proc_type = procedimientos.getString("PROCEDURE_TYPE");
                System.out.println("Nombre Procedimiento: " + proc_name + ", Tipo: "+ proc_type);
                contador++;
            }

            //Funciones
            System.out.println("\nFUNCIONES\n===============");

            try{
                ResultSet rs2 = dbmd.getFunctions(null, null, "%");
                while (rs2.next()) {
                    System.out.println("Funcion: '" + rs2.getString("FUNCTION_NAME")
                            + "' de tipo: " + rs2.getString("FUNCTION_TYPE"));
                    contador++;
                }
            }catch (SQLFeatureNotSupportedException e){
                System.out.println("No soportados");
            }

            System.out.println("Total de subprogramas: "+contador);
            rst.close();

            conexion.close();
        } catch (ClassNotFoundException cnfE) {
            cnfE.printStackTrace();
        } catch (SQLException sqlE) {
            sqlE.printStackTrace();
            System.err.println("\nHubo problemas con la base de datos:");
            System.err.println("Mensaje:\t"+sqlE.getMessage());
            System.err.println("Estado SQL:\t"+sqlE.getSQLState());
            System.err.println("Código Error:\t"+sqlE.getErrorCode());
        }
    }
}
