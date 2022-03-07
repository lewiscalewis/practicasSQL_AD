package db4o;

public class Doctor {

    private String codigo;
    private String nombre;
    private int edad;
    String especialidad;

    public Doctor(){

    }

    public Doctor(String codigo, String nombre, int edad, String especialidad){
        this.codigo = codigo;
        this.nombre = nombre;
        this.edad = edad;
        this.especialidad = especialidad;
    }

    public int getEdad() {
        return edad;
    }

    public String getCodigo() {
        return codigo;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public String getNombre() {
        return nombre;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
