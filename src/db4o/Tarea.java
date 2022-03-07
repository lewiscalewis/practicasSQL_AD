package db4o;

import com.db4o.Db4oEmbedded;
import com.db4o.ObjectContainer;
import com.db4o.ObjectSet;

public class Tarea {
	final static String DBPer = "src/db4o/consultorio.yap";
	
	public static void main(String[] args) {

	}
	
	public static void insertaDatos() {

		ObjectContainer db = Db4oEmbedded.openFile(Db4oEmbedded.newConfiguration(), DBPer);
		
		Doctor[] doctores = new Doctor[3];
		doctores[0] = new Doctor("66666666F", "Holmes", 45, "pediatra");
		doctores[1] = new Doctor("77777777G", "Moriarti", 54, "general");
		doctores[2] = new Doctor("88888888H", "Warson", 54, "odontologo");
		
		Paciente[] pacientes = new Paciente[3];
		pacientes[0] = new Paciente("11111111A", "Pedro", "611111111");
		pacientes[1] = new Paciente("22222222B", "Monica", "622222222");
		pacientes[2] = new Paciente("33333333C", "Elena", "633333333");
		
		Visita[] visitas = new Visita[4];
		visitas[0] = new Visita(doctores[0], pacientes[0], "01/01/2015");
		visitas[1] = new Visita(doctores[0], pacientes[1], "01/01/2016");
		visitas[2] = new Visita(doctores[1], pacientes[0], "01/01/2017");
		visitas[3] = new Visita(doctores[2], pacientes[2], "01/06/2015");

		for (int i = 0; i < doctores.length; i++) {
			db.store(doctores[i]);
		}

		for (int i = 0; i < pacientes.length; i++) {
			db.store(pacientes[i]);
		}
		
		for (int i = 0; i < visitas.length; i++) {
			db.store(visitas[i]);
		}
		
		db.close();
		
		System.out.println("ESTA BASE DE DATOS DA SIDA Y NO SE USA PERO TE LA HE CREADO XD");
	}
	
	public static void pediatras() {

		ObjectContainer db = Db4oEmbedded.openFile(Db4oEmbedded.newConfiguration(), DBPer);

		Doctor doctor = new Doctor();
		doctor.setEspecialidad("pediatra");
		
		ObjectSet<Doctor> respuesta = db.queryByExample(doctor);
				
		System.out.println("Pediatras:");
		if (respuesta.size() == 0) {
			System.out.println("No hay ningún registro");
		} else {
			while (respuesta.hasNext()) {
				Doctor e = (Doctor) respuesta.next();
				System.out.println("Nombre: " + e.getNombre());
			}
		}
		
		db.close();
	}
	
	public static int cuentaObjetos() {
		int total = 0;
		
		ObjectContainer db = Db4oEmbedded.openFile(Db4oEmbedded.newConfiguration(), DBPer);

		Doctor doctor = new Doctor();
		Paciente paciente = new Paciente();
		Visita visita = new Visita();
				
		ObjectSet<Doctor> doctores = db.queryByExample(doctor);
		ObjectSet<Paciente> pacientes = db.queryByExample(paciente);
		ObjectSet<Visita> visitas = db.queryByExample(visita);
				
		if (doctores.size() == 0) {
			total += 0;
		} else {
			total += doctores.size();
		}
		
		if (pacientes.size() == 0) {
			total += 0;
		} else {
			total += pacientes.size();
		}
		
		if (visitas.size() == 0) {
			total += 0;
		} else {
			total += visitas.size();
		}
		
		db.close();
		
		return total;
	}
	
	public static int cuentaObjetos(Class clase) {
		int total = 0;
		
		Doctor doctor = new Doctor();
		Paciente paciente = new Paciente();
		Visita visita = new Visita();
		
		ObjectContainer db = Db4oEmbedded.openFile(Db4oEmbedded.newConfiguration(), DBPer);
		
		if (clase.isInstance(doctor)) {
			ObjectSet<Doctor> doctores = db.queryByExample(clase);
			if (doctores.size() == 0) {
				total += 0;
			} else {
				total += doctores.size();
			}
		} else if (clase.isInstance(paciente)) {
			ObjectSet<Paciente> pacientes = db.queryByExample(clase);
			if (pacientes.size() == 0) {
				total += 0;
			} else {
				total += pacientes.size();
			}
		} else if (clase.isInstance(visita)){
			ObjectSet<Visita> visitas = db.queryByExample(clase);
			if (visitas.size() == 0) {
				total += 0;
			} else {
				total += visitas.size();
			}
		}
		
		db.close();
		
		return total;	
	}
	
	public static void borraVisitas() {
		ObjectContainer db = Db4oEmbedded.openFile(Db4oEmbedded.newConfiguration(), DBPer);
				
		Visita visita = new Visita();
				
		ObjectSet<Visita> respuesta = db.queryByExample(visita);
				
		int contador = 0;
		
		if (respuesta.size() == 0) {
			System.out.println("No se puede borrar");
		} else {
			while (respuesta.hasNext()) {
				Visita v = (Visita) respuesta.next();
				db.delete(v);
				contador++;
			}			
		}
		System.out.println("Se han borrado " + contador + " registros");
		
		db.close();
	}
	
	public static void borraDoctores() {
		ObjectContainer db = Db4oEmbedded.openFile(Db4oEmbedded.newConfiguration(), DBPer);
		
		Doctor doctor = new Doctor();
				
		ObjectSet<Doctor> respuesta = db.queryByExample(doctor);
				
		int cont = 0;
		
		if (respuesta.size() == 0) {
			System.out.println("No hay registros de doctores para borrar...");
		} else {
			while (respuesta.hasNext()) {
				Doctor d = (Doctor) respuesta.next();
				db.delete(d);
				cont++;
			}			
		}
		System.out.println("Se han borrado " + cont + " registros");
		
		db.close();
	}
	
	public static void borraPacientes() {
		ObjectContainer db = Db4oEmbedded.openFile(Db4oEmbedded.newConfiguration(), DBPer);
		
		Paciente paciente = new Paciente();
				
		ObjectSet<Paciente> respuesta = db.queryByExample(paciente);
				
		int contador = 0;
		
		if (respuesta.size() == 0) {
			System.out.println("No se puede borrar");
		} else {
			while (respuesta.hasNext()) {
				Paciente p = (Paciente) respuesta.next();
				db.delete(p);
				contador++;
			}			
		}
		System.out.println("Se han borrado " + contador + " registros");
		
		db.close();
	}
}