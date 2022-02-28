CREATE TABLE pacientes(
	    NIF varchar(9),
    nombre varchar(30),
    tfln int(9),
    primary key (NIF)
);

CREATE TABLE doctores(
	    NIF varchar(9),
    nombre varchar(30),
    edad int(2),
    especialidad varchar(30),
    primary key (NIF)
);

CREATE TABLE visitas(
	NIF_doctor varchar(9),
    NIF_paciente varchar(9),
    fecha date,
    foreign key (NIF_doctor) references doctores(NIF)
    on update cascade on delete restrict,
    foreign key (NIF_paciente) references pacientes(NIF)
    on update cascade on delete restrict
);

INSERT INTO doctores (NIF, nombre, edad, especialidad) VALUES ("66666666F", "Holmes", 45, "pediatra");
INSERT INTO doctores (NIF, nombre, edad, especialidad) VALUES ("77777777G", "Moriarti", 54, "general");
INSERT INTO doctores (NIF, nombre, edad, especialidad) VALUES ("88888888H", "Watson", 54, "odontólogo");

INSERT INTO pacientes (NIF, nombre, tfln) VALUES ("11111111A", "Pedro", 611111111);
INSERT INTO pacientes (NIF, nombre, tfln) VALUES ("22222222B", "Mónica", 622222222);
INSERT INTO pacientes (NIF, nombre, tfln) VALUES ("33333333C", "Elena", 633333333);

INSERT INTO visitas (NIF_doctor, NIF_paciente, fecha) VALUES ("66666666F", "11111111A", 01/01/2015);
INSERT INTO visitas (NIF_doctor, NIF_paciente, fecha) VALUES ("66666666F", "22222222B", 01/01/2016);
INSERT INTO visitas (NIF_doctor, NIF_paciente, fecha) VALUES ("77777777G", "11111111A", 01/01/2017);
INSERT INTO visitas (NIF_doctor, NIF_paciente, fecha) VALUES ("88888888H", "33333333C", 01/06/2015);
