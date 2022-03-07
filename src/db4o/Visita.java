package db4o;

public class Visita {

    Doctor doctores;
    Paciente paciente;
    String fecha;

    public Visita(Doctor doctores, Paciente paciente, String fecha) {
        this.doctores = doctores;
        this.paciente = paciente;
        this.fecha = fecha;
    }

    public Visita() {

    }

    public Doctor getDoctores() {
        return doctores;
    }

    public String getFecha() {
        return fecha;
    }

    public Paciente getPaciente() {
        return paciente;
    }

    public void setDoctores(Doctor doctores) {
        this.doctores = doctores;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public void setPaciente(Paciente paciente) {
        this.paciente = paciente;
    }
}
