package db4o;

public class Paciente {

    String codigo;
    String nombre;
    String numero;

    public Paciente(String codigo, String nombre, String numero){
        this.codigo = codigo;
        this.numero = numero;
        this.nombre = nombre;
    }

    public Paciente() {

    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public String getCodigo() {
        return codigo;
    }

    public String getNumero() {
        return numero;
    }

    public void setNumero(String numero) {
        this.numero = numero;
    }

}
