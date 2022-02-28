CREATE TABLE pacientes(
                          NIF varchar(9),
                          nombre varchar(30),
                          tfln int,
                          primary key (NIF)
);

CREATE TABLE doctores(
                         NIF varchar(9),
                         nombre varchar(30),
                         edad int,
                         especialidad varchar(30),
                         primary key (NIF)
);

CREATE TABLE visitas(
                        NIF_doctor varchar(9),
                        NIF_paciente varchar(9),
                        fecha date,
                        foreign key (NIF_doctor) references doctores(NIF)
                            on delete restrict,
                        foreign key (NIF_paciente) references pacientes(NIF)
                            on delete restrict
);

INSERT INTO doctores VALUES ('66666666F', 'Holmes', 45, 'pediatra');
INSERT INTO doctores VALUES ('77777777G', 'Moriarti', 54, 'general');
INSERT INTO doctores VALUES ('88888888H', 'Watson', 54, 'odontólogo');

INSERT INTO pacientes VALUES ('11111111A', 'Pedro', 611111111);
INSERT INTO pacientes VALUES ('22222222B', 'Mónica', 622222222);
INSERT INTO pacientes VALUES ('33333333C', 'Elena', 633333333);

INSERT INTO visitas VALUES ('66666666F', '11111111A', '2015-01-01');
INSERT INTO visitas VALUES ('66666666F', '22222222B', '2016-01-01');
INSERT INTO visitas VALUES ('77777777G', '11111111A', '2017-01-01');
INSERT INTO visitas VALUES ('88888888H', '33333333C', '2015-06-01');