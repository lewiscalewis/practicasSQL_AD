DROP TABLE Partidos;
DROP TABLE Estadisticas;
DROP TABLE Jugadores;
DROP TABLE Equipos;

CREATE TABLE Equipos (
  Nombre varchar(20) NOT NULL,
  Ciudad varchar(20) DEFAULT NULL,
  Conferencia varchar(4) DEFAULT NULL,
  Division varchar(9) DEFAULT NULL,
  CONSTRAINT pk_equipos PRIMARY KEY (Nombre)
);

CREATE TABLE Jugadores (
  Codigo int NOT NULL,
  Nombre varchar(30) DEFAULT NULL,
  Procedencia varchar(20) DEFAULT NULL,
  Altura varchar(4) DEFAULT NULL,
  Peso int DEFAULT NULL,
  Posicion varchar(5) DEFAULT NULL,
  Nombre_equipo varchar(20) DEFAULT NULL,
  CONSTRAINT pk_jugadores PRIMARY KEY (Codigo),
  CONSTRAINT fk_jugadoresEquipos FOREIGN KEY (Nombre_equipo)
	REFERENCES Equipos(Nombre)
	ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE Estadisticas (
  Temporada varchar(5) NOT NULL ,
  Jugador int NOT NULL ,
  Puntos_por_partido float DEFAULT NULL,
  Asistencias_por_partido float DEFAULT NULL,
  Tapones_por_partido float DEFAULT NULL,
  Rebotes_por_partido float DEFAULT NULL,
  CONSTRAINT pk_estadisticas PRIMARY KEY (Temporada,Jugador),
  CONSTRAINT fk_estadisticasJugadores FOREIGN KEY (Jugador)
	REFERENCES Jugadores(Codigo)
	ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE Partidos (
  Codigo int NOT NULL,
  Equipo_local varchar(20) DEFAULT NULL,
  Equipo_visitante varchar(20) DEFAULT NULL,
  Puntos_local int DEFAULT NULL,
  Puntos_visitante int DEFAULT NULL,
  Temporada varchar(5) DEFAULT NULL,
  CONSTRAINT pk_partidos PRIMARY KEY (Codigo),
  CONSTRAINT fk_partidosEquipos1 FOREIGN KEY (Equipo_local)
	REFERENCES Equipos(nombre)
	ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT fk_partidosEquipos2 FOREIGN KEY (Equipo_visitante)
	REFERENCES Equipos(nombre)
	ON UPDATE CASCADE ON DELETE CASCADE
);



INSERT INTO Equipos VALUES ('Celtics','Boston','East','Atlantic');
INSERT INTO Equipos VALUES ('Raptors','Toronto','East','Atlantic');
INSERT INTO Equipos VALUES ('76ers','Philadelphia','East','Atlantic');
INSERT INTO Equipos VALUES ('Nets','New Jersey','East','Atlantic');
INSERT INTO Equipos VALUES ('Knicks','New York','East','Atlantic');
INSERT INTO Equipos VALUES ('Pistons','Detroit','East','Central');
INSERT INTO Equipos VALUES ('Cavaliers','Cleveland','East','Central');
INSERT INTO Equipos VALUES ('Pacers','Indiana','East','Central');
INSERT INTO Equipos VALUES ('Bulls','Chicago','East','Central');
INSERT INTO Equipos VALUES ('Bucks','Milwaukee','East','Central');
INSERT INTO Equipos VALUES ('Magic','Orlando','East','SouthEast');
INSERT INTO Equipos VALUES ('Wizards','Washington','East','SouthEast');
INSERT INTO Equipos VALUES ('Hawks','Atlanta','East','SouthEast');
INSERT INTO Equipos VALUES ('Bobcats','Charlotte','East','SouthEast');
INSERT INTO Equipos VALUES ('Heat','Miami','East','SouthEast');
INSERT INTO Equipos VALUES ('Jazz','Utah','West','NorthWest');
INSERT INTO Equipos VALUES ('Nuggets','Denver','West','NorthWest');
INSERT INTO Equipos VALUES ('Trail Blazers','Portland','West','NorthWest');
INSERT INTO Equipos VALUES ('Timberwolves','Minnesota','West','NorthWest');
INSERT INTO Equipos VALUES ('Supersonics','Seattle','West','NorthWest');
INSERT INTO Equipos VALUES ('Lakers','Los Angeles','West','Pacific');
INSERT INTO Equipos VALUES ('Suns','Phoenix','West','Pacific');
INSERT INTO Equipos VALUES ('Warriors','Golden State','West','Pacific');
INSERT INTO Equipos VALUES ('Kings','Sacramento','West','Pacific');
INSERT INTO Equipos VALUES ('Clippers','Los Angeles','West','Pacific');
INSERT INTO Equipos VALUES ('Hornets','New Orleans','West','SouthWest');
INSERT INTO Equipos VALUES ('Spurs','San Antonio','West','SouthWest');
INSERT INTO Equipos VALUES ('Rockets','Houston','West','SouthWest');
INSERT INTO Equipos VALUES ('Mavericks','Dallas','West','SouthWest');
INSERT INTO Equipos VALUES ('Grizzlies','Memphis','West','SouthWest');



INSERT INTO Jugadores VALUES (1,'Corey Brever','Florida','6-9',185,'F-G','Timberwolves');
INSERT INTO Jugadores VALUES (2,'Greg Buckner','Clemson','6-4',210,'G-F','Timberwolves');
INSERT INTO Jugadores VALUES (3,'Michael Doleac','Utah','6-11',262,'C','Timberwolves');
INSERT INTO Jugadores VALUES (4,'Randy Foye','Villanova','6-4',213,'G','Timberwolves');
INSERT INTO Jugadores VALUES (5,'Ryan Gomes','Providence','6-7',250,'F','Timberwolves');
INSERT INTO Jugadores VALUES (6,'Marko Jaric','Serbia','6-7',224,'G','Timberwolves');
INSERT INTO Jugadores VALUES (7,'Al Jefferson','Prentiss Hs','6-10',265,'C-F','Timberwolves');
INSERT INTO Jugadores VALUES (8,'Mark Madsen','Stanford','6-9',250,'C-F','Timberwolves');
INSERT INTO Jugadores VALUES (9,'Rashard McCants','North Carolina','6-4',21,'G','Timberwolves');
INSERT INTO Jugadores VALUES (10,'Chris Richard ','Florida','6-9',270,'F','Timberwolves');
INSERT INTO Jugadores VALUES (11,'Craig Smith','Boston College','6-8',250,'F-C','Timberwolves');
INSERT INTO Jugadores VALUES (12,'Kirk Snyder','Nevada-Reno','6-6',225,'G','Timberwolves');
INSERT INTO Jugadores VALUES (13,'Sebastian Telfair','Abraham Lincoln HS','6-0',175,'G','Timberwolves');
INSERT INTO Jugadores VALUES (14,'Antoine Walker','Kentucky','6-9',245,'F','Timberwolves');
INSERT INTO Jugadores VALUES (21,'Elton brand','duke','6-8',254,'F','Clippers');
INSERT INTO Jugadores VALUES (22,'Paul Davis','Michigan','6-11',270,'c','Clippers');
INSERT INTO Jugadores VALUES (23,'Dan Dickau','Gonzaga','6-0',180,'G','Clippers');
INSERT INTO Jugadores VALUES (24,'Nick Fazekas','Nevada-Reno','6-11',235,'F','Clippers');
INSERT INTO Jugadores VALUES (25,'Chris Kaman','Central Michigan','7-0',265,'C','Clippers');
INSERT INTO Jugadores VALUES (26,'Brevin Knight','Stanford','5-10',170,'G','Clippers');
INSERT INTO Jugadores VALUES (27,'Shaun Livingston','Peoria Central','6-7',182,'G','Clippers');
INSERT INTO Jugadores VALUES (28,'Corey Maggette','duke','6-6',225,'F','Clippers');
INSERT INTO Jugadores VALUES (29,'Cuttino Mobley','Rhode Island','6-4',215,'G','Clippers');
INSERT INTO Jugadores VALUES (30,'Smush Parker','Fordham','6-4',190,'G','Clippers');
INSERT INTO Jugadores VALUES (31,'Josh Powell','North Carolina State','6-9',240,'C-F','Clippers');
INSERT INTO Jugadores VALUES (32,'Quinton Ross','Southern Methodist','6-6',193,'G-F','Clippers');
INSERT INTO Jugadores VALUES (33,'Tim Thomas','Villanova','6-10',240,'F','Clippers');
INSERT INTO Jugadores VALUES (34,'al thornton','Florida State','6-8',220,'F','Clippers');
INSERT INTO Jugadores VALUES (35,'Marcus Williams','Arizona','6-7',207,'F','Clippers');
INSERT INTO Jugadores VALUES (41,'Andre Brown','De Paul','6-9',245,'F','Grizzlies');
INSERT INTO Jugadores VALUES (42,'Kwame Brown','Glynn Academy','6-11',270,'C','Grizzlies');
INSERT INTO Jugadores VALUES (43,'Brian Cardinal','Purdue','6-8',245,'F','Grizzlies');
INSERT INTO Jugadores VALUES (44,'Jason Collins','Stanford','7-0',255,'C-F','Grizzlies');
INSERT INTO Jugadores VALUES (45,'Mike Conley','Ohio State','6-1',180,'G','Grizzlies');
INSERT INTO Jugadores VALUES (46,'Javaris Crittenton','Georgia Tech','6-5',200,'G','Grizzlies');
INSERT INTO Jugadores VALUES (47,'Rudy Gay','Connecticut','6-8',222,'F','Grizzlies');
INSERT INTO Jugadores VALUES (48,'Casey Jacobsen','Stanford','6-6',215,'g','Grizzlies');
INSERT INTO Jugadores VALUES (49,'Kyle Lowry','Villanova','6-0',175,'G','Grizzlies');
INSERT INTO Jugadores VALUES (50,'Aaron Mckie','Temple','6-5',209,'G','Grizzlies');
INSERT INTO Jugadores VALUES (51,'Darko Milicic','Serbia Montenegro','7-0',275,'C-F','Grizzlies');
INSERT INTO Jugadores VALUES (52,'Mike Miller','Florida','6-8',218,'G-F','Grizzlies');
INSERT INTO Jugadores VALUES (53,'Juan Carlos Navarro','Spain','6-3',170,'G','Grizzlies');
INSERT INTO Jugadores VALUES (54,'Hakim Warrick','Syracuse','6-9',215,'F','Grizzlies');
INSERT INTO Jugadores VALUES (61,'Trevor Ariza','UCLA','6-8',210,'F','Lakers');
INSERT INTO Jugadores VALUES (62,'Kobe Bryant','Lower Merion HS (PA)','6-6',205,'G','Lakers');
INSERT INTO Jugadores VALUES (63,'Andrew Bynum','St. Joseph HS (NJ)','7-0',285,'C','Lakers');
INSERT INTO Jugadores VALUES (64,'Jordan Farmar','UCLA','6-2',180,'G','Lakers');
INSERT INTO Jugadores VALUES (65,'Derek Fisher','Arkansas-Little Rock','6-1',210,'G','Lakers');
INSERT INTO Jugadores VALUES (66,'Pau Gasol','Spain','7-0',250,'F-C','Lakers');
INSERT INTO Jugadores VALUES (67,'Didier Ilunga-Mbenga','Congo','7-0',255,'C','Lakers');
INSERT INTO Jugadores VALUES (68,'Coby Karl','Boise State','6-5',215,'G','Lakers');
INSERT INTO Jugadores VALUES (69,'Chris Mihm','Texas','7-0',265,'C','Lakers');
INSERT INTO Jugadores VALUES (70,'Ira Newble','Miami(Ohia)','6-7',220,'G-F','Lakers');
INSERT INTO Jugadores VALUES (71,'Lamar Odom','Rhode Island','6-10',230,'F','Lakers');
INSERT INTO Jugadores VALUES (72,'Vladimir Radmanovic','Serbia Montenegro','6-10',235,'F','Lakers');
INSERT INTO Jugadores VALUES (73,'Ronny Turiaf','Gonzaga','6-10',250,'F-C','Lakers');
INSERT INTO Jugadores VALUES (74,'Sasha Vujacic','Slovenia','6-7',205,'G','Lakers');
INSERT INTO Jugadores VALUES (75,'Luke Walton','Arizona','6-8',235,'F','Lakers');
INSERT INTO Jugadores VALUES (81,'Andrea Bargnani','Italy','7-0',250,'C-F','Raptors');
INSERT INTO Jugadores VALUES (82,'Maceo Baston','Michigan','6-10',230,'C-F','Raptors');
INSERT INTO Jugadores VALUES (84,'Primoz Brezec','Slovenia','7-1',255,'C','Raptors');
INSERT INTO Jugadores VALUES (85,'Jose Calderon','Spain','6-3',210,'G','Raptors');
INSERT INTO Jugadores VALUES (86,'Carlos Delfino','Argentina','6-6',230,'G','Raptors');
INSERT INTO Jugadores VALUES (87,'T.J. Ford','Texas','6-0',165,'G','Raptors');
INSERT INTO Jugadores VALUES (88,'Jorge Garbajosa','Spain','6-9',245,'F','Raptors');
INSERT INTO Jugadores VALUES (89,'Joey Graham','Oklahoma State','6-7',225,'F','Raptors');
INSERT INTO Jugadores VALUES (90,'Kris Humphries','Minnesota','6-9',235,'F','Raptors');
INSERT INTO Jugadores VALUES (91,'Linton Johnson III','Tulane','6-8',205,'F','Raptors');
INSERT INTO Jugadores VALUES (92,'Jason Kapono','UCLA','6-8',215,'F','Raptors');
INSERT INTO Jugadores VALUES (93,'Jamario Moon','Merdian CC (MS)','6-8',205,'F','Raptors');
INSERT INTO Jugadores VALUES (94,'Rasho Nesterovic','Slovenia','7-0',255,'C','Raptors');
INSERT INTO Jugadores VALUES (95,'Anthony Parker','Bradley','6-6',215,'G-F','Raptors');
INSERT INTO Jugadores VALUES (100,'Renaldo Balkman','South Carolina','6-8',202,'F','Knicks');

INSERT INTO Estadisticas VALUES ('03/04',283,5.9,2.2,1.54,1.6);
INSERT INTO Estadisticas VALUES ('04/05',283,4.6,1.8,0.98,1.6);
INSERT INTO Estadisticas VALUES ('05/06',283,12,4.7,2.4,2.9);
INSERT INTO Estadisticas VALUES ('06/07',283,4.9,1.3,0.89,0.8);
INSERT INTO Estadisticas VALUES ('05/06',85,5.5,4.5,0.1,2.2);
INSERT INTO Estadisticas VALUES ('06/07',85,8.7,5,0.1,1.7);
INSERT INTO Estadisticas VALUES ('07/08',283,9.5,3,1.33,2.1);
INSERT INTO Estadisticas VALUES ('07/08',85,11.6,8.2,0.1,2.9);
INSERT INTO Estadisticas VALUES ('03/04',580,7.9,2.4,0.1,1.8);
INSERT INTO Estadisticas VALUES ('05/06',580,13.1,2.8,0.1,2.6);
INSERT INTO Estadisticas VALUES ('06/07',64,4.4,1.9,0.1,1.7);
INSERT INTO Estadisticas VALUES ('06/07',580,18.1,4,0.2,2.7);
INSERT INTO Estadisticas VALUES ('07/08',580,15.8,2.7,0.2,2.4);
INSERT INTO Estadisticas VALUES ('07/08',441,4.3,1.3,0,1.1);
INSERT INTO Estadisticas VALUES ('07/08',64,9.1,2.7,0.1,2.2);
INSERT INTO Estadisticas VALUES ('07/08',81,10.2,1.2,0.4,3.8);
INSERT INTO Estadisticas VALUES ('06/07',24,1,0,0,0.8);
INSERT INTO Estadisticas VALUES ('03/04',601,4.5,1.3,0.1,4);
INSERT INTO Estadisticas VALUES ('04/05',601,3.8,1.3,0.2,3.1);
INSERT INTO Estadisticas VALUES ('05/06',601,3,0.4,0.1,1.9);
INSERT INTO Estadisticas VALUES ('96/97',483,14.8,1.5,2.1,6.3);
INSERT INTO Estadisticas VALUES ('07/08',591,2.2,0.7,0.2,0.7);
INSERT INTO Estadisticas VALUES ('06/07',601,9.8,2.1,0.5,4.6);
INSERT INTO Estadisticas VALUES ('97/98',483,12.1,1.8,3.7,7.4);
INSERT INTO Estadisticas VALUES ('98/99',483,7.2,0.3,1.6,5.5);
INSERT INTO Estadisticas VALUES ('99/00',483,10.2,0.8,2,7.8);
INSERT INTO Estadisticas VALUES ('00/01',483,12,0.8,2.2,11.5);
INSERT INTO Estadisticas VALUES ('01/02',483,11.1,1.1,1.7,11.1);
INSERT INTO Estadisticas VALUES ('02/03',483,7.6,1.6,1.4,7.2);
INSERT INTO Estadisticas VALUES ('03/04',483,8.6,1.8,2.6,10.1);
INSERT INTO Estadisticas VALUES ('07/08',24,4.3,0.6,0.5,3.7);
INSERT INTO Estadisticas VALUES ('04/05',483,10.3,2.3,3,10);
INSERT INTO Estadisticas VALUES ('05/06',483,12.8,2.1,3.3,11.9);
INSERT INTO Estadisticas VALUES ('07/08',601,6.8,2,1.21,4.5);
INSERT INTO Estadisticas VALUES ('06/07',483,11.2,3.2,3.3,11.7);
INSERT INTO Estadisticas VALUES ('07/08',483,9.3,3.3,3.3,13.3);
INSERT INTO Estadisticas VALUES ('07/08',443,6.1,0.9,1.5,7.6);
INSERT INTO Estadisticas VALUES ('05/06',284,1.6,0,0,1.3);
INSERT INTO Estadisticas VALUES ('06/07',284,2.3,0.2,0.1,1.5);
INSERT INTO Estadisticas VALUES ('06/07',443,7.1,0.6,1.1,7.4);
INSERT INTO Estadisticas VALUES ('05/06',443,5.7,0.6,1.3,7.8);

INSERT INTO Partidos VALUES (1,'Raptors','Lakers',74,117,'98/99');
INSERT INTO Partidos VALUES (2,'Raptors','Grizzlies',70,118,'98/99');
INSERT INTO Partidos VALUES (3,'Raptors','Clippers',105,76,'98/99');
INSERT INTO Partidos VALUES (4,'Raptors','Knicks',62,124,'98/99');
INSERT INTO Partidos VALUES (5,'Raptors','Timberwolves',66,68,'98/99');
INSERT INTO Partidos VALUES (6,'Raptors','Celtics',52,69,'98/99');
INSERT INTO Partidos VALUES (7,'Raptors','76ers',74,103,'98/99');
INSERT INTO Partidos VALUES (8,'Raptors','Nets',121,129,'98/99');
INSERT INTO Partidos VALUES (9,'Raptors','Pistons',100,85,'98/99');
INSERT INTO Partidos VALUES (10,'Raptors','Cavaliers',129,158,'98/99');
INSERT INTO Partidos VALUES (11,'Raptors','Pacers',100,70,'98/99');
INSERT INTO Partidos VALUES (12,'Raptors','Bulls',134,69,'98/99');
INSERT INTO Partidos VALUES (13,'Raptors','Bucks',66,118,'98/99');
INSERT INTO Partidos VALUES (14,'Raptors','Magic',74,140,'98/99');
INSERT INTO Partidos VALUES (15,'Raptors','Wizards',101,61,'98/99');
INSERT INTO Partidos VALUES (16,'Raptors','Hawks',128,139,'98/99');
INSERT INTO Partidos VALUES (17,'Raptors','Bobcats',88,68,'98/99');
INSERT INTO Partidos VALUES (18,'Raptors','Heat',125,119,'98/99');
INSERT INTO Partidos VALUES (19,'Raptors','Jazz',147,138,'98/99');
INSERT INTO Partidos VALUES (20,'Raptors','Nuggets',74,147,'98/99');
INSERT INTO Partidos VALUES (21,'Raptors','Trail Blazers',140,64,'98/99');
INSERT INTO Partidos VALUES (22,'Raptors','Supersonics',59,59,'98/99');
INSERT INTO Partidos VALUES (23,'Raptors','Warriors',76,74,'98/99');
INSERT INTO Partidos VALUES (24,'Raptors','Kings',57,115,'98/99');
INSERT INTO Partidos VALUES (25,'Raptors','Hornets',104,82,'98/99');
INSERT INTO Partidos VALUES (26,'Raptors','Spurs',116,51,'98/99');
INSERT INTO Partidos VALUES (27,'Raptors','Rockets',99,59,'98/99');
INSERT INTO Partidos VALUES (28,'Raptors','Mavericks',108,113,'98/99');
INSERT INTO Partidos VALUES (29,'Raptors','Suns',149,102,'98/99');
INSERT INTO Partidos VALUES (30,'Lakers','Raptors',76,158,'98/99');
INSERT INTO Partidos VALUES (31,'Lakers','Grizzlies',86,99,'98/99');
INSERT INTO Partidos VALUES (32,'Lakers','Clippers',151,98,'98/99');
INSERT INTO Partidos VALUES (33,'Lakers','Knicks',133,63,'98/99');
INSERT INTO Partidos VALUES (34,'Lakers','Timberwolves',75,137,'98/99');
INSERT INTO Partidos VALUES (35,'Lakers','Celtics',58,74,'98/99');
INSERT INTO Partidos VALUES (36,'Lakers','76ers',55,75,'98/99');
INSERT INTO Partidos VALUES (37,'Lakers','Nets',92,127,'98/99');
INSERT INTO Partidos VALUES (38,'Lakers','Pistons',114,147,'98/99');
INSERT INTO Partidos VALUES (39,'Lakers','Cavaliers',136,118,'98/99');
INSERT INTO Partidos VALUES (40,'Lakers','Pacers',130,156,'98/99');
INSERT INTO Partidos VALUES (41,'Lakers','Bulls',79,83,'98/99');
INSERT INTO Partidos VALUES (42,'Lakers','Bucks',114,153,'98/99');
INSERT INTO Partidos VALUES (43,'Lakers','Magic',153,127,'98/99');
INSERT INTO Partidos VALUES (44,'Lakers','Wizards',86,62,'98/99');
INSERT INTO Partidos VALUES (45,'Lakers','Hawks',105,59,'98/99');
INSERT INTO Partidos VALUES (46,'Lakers','Bobcats',80,87,'98/99');
INSERT INTO Partidos VALUES (47,'Lakers','Heat',150,143,'98/99');
INSERT INTO Partidos VALUES (48,'Lakers','Jazz',73,58,'98/99');
INSERT INTO Partidos VALUES (49,'Lakers','Nuggets',90,133,'98/99');
INSERT INTO Partidos VALUES (50,'Lakers','Trail Blazers',154,120,'98/99');
INSERT INTO Partidos VALUES (51,'Lakers','Supersonics',101,79,'98/99');
INSERT INTO Partidos VALUES (52,'Lakers','Warriors',75,129,'98/99');
INSERT INTO Partidos VALUES (53,'Lakers','Kings',131,67,'98/99');
INSERT INTO Partidos VALUES (54,'Lakers','Hornets',126,66,'98/99');
INSERT INTO Partidos VALUES (55,'Lakers','Spurs',79,102,'98/99');
INSERT INTO Partidos VALUES (56,'Lakers','Rockets',83,146,'98/99');
INSERT INTO Partidos VALUES (57,'Lakers','Mavericks',124,121,'98/99');
INSERT INTO Partidos VALUES (58,'Lakers','Suns',142,86,'98/99');
INSERT INTO Partidos VALUES (59,'Grizzlies','Raptors',87,144,'98/99');
INSERT INTO Partidos VALUES (60,'Grizzlies','Lakers',140,139,'98/99');
INSERT INTO Partidos VALUES (61,'Grizzlies','Clippers',142,127,'98/99');
INSERT INTO Partidos VALUES (62,'Grizzlies','Knicks',104,92,'98/99');
INSERT INTO Partidos VALUES (63,'Grizzlies','Timberwolves',120,61,'98/99');
INSERT INTO Partidos VALUES (64,'Grizzlies','Celtics',75,133,'98/99');
INSERT INTO Partidos VALUES (65,'Grizzlies','76ers',56,91,'98/99');
INSERT INTO Partidos VALUES (66,'Grizzlies','Nets',53,126,'98/99');
INSERT INTO Partidos VALUES (67,'Grizzlies','Pistons',102,128,'98/99');
INSERT INTO Partidos VALUES (68,'Grizzlies','Cavaliers',98,94,'98/99');
INSERT INTO Partidos VALUES (69,'Grizzlies','Pacers',136,134,'98/99');
INSERT INTO Partidos VALUES (70,'Grizzlies','Bulls',112,90,'98/99');
INSERT INTO Partidos VALUES (71,'Grizzlies','Bucks',59,111,'98/99');
INSERT INTO Partidos VALUES (72,'Grizzlies','Magic',97,89,'98/99');
INSERT INTO Partidos VALUES (73,'Grizzlies','Wizards',119,115,'98/99');
INSERT INTO Partidos VALUES (74,'Grizzlies','Hawks',107,125,'98/99');
INSERT INTO Partidos VALUES (75,'Grizzlies','Bobcats',57,84,'98/99');
INSERT INTO Partidos VALUES (76,'Grizzlies','Heat',123,129,'98/99');
INSERT INTO Partidos VALUES (77,'Grizzlies','Jazz',140,119,'98/99');
INSERT INTO Partidos VALUES (78,'Grizzlies','Nuggets',57,122,'98/99');
INSERT INTO Partidos VALUES (79,'Grizzlies','Trail Blazers',149,155,'98/99');
INSERT INTO Partidos VALUES (80,'Grizzlies','Supersonics',119,109,'98/99');
INSERT INTO Partidos VALUES (81,'Grizzlies','Warriors',132,76,'98/99');
INSERT INTO Partidos VALUES (82,'Grizzlies','Kings',116,104,'98/99');
INSERT INTO Partidos VALUES (83,'Grizzlies','Hornets',105,89,'98/99');
INSERT INTO Partidos VALUES (84,'Grizzlies','Spurs',86,82,'98/99');
INSERT INTO Partidos VALUES (85,'Grizzlies','Rockets',98,141,'98/99');
INSERT INTO Partidos VALUES (86,'Grizzlies','Mavericks',89,60,'98/99');
INSERT INTO Partidos VALUES (87,'Grizzlies','Suns',121,121,'98/99');
INSERT INTO Partidos VALUES (88,'Clippers','Raptors',135,98,'98/99');
INSERT INTO Partidos VALUES (89,'Clippers','Lakers',55,98,'98/99');
INSERT INTO Partidos VALUES (90,'Clippers','Grizzlies',136,111,'98/99');
INSERT INTO Partidos VALUES (91,'Clippers','Knicks',105,141,'98/99');
INSERT INTO Partidos VALUES (92,'Clippers','Timberwolves',106,144,'98/99');
INSERT INTO Partidos VALUES (93,'Clippers','Celtics',90,66,'98/99');
INSERT INTO Partidos VALUES (94,'Clippers','76ers',63,128,'98/99');
INSERT INTO Partidos VALUES (95,'Clippers','Nets',63,75,'98/99');
INSERT INTO Partidos VALUES (96,'Clippers','Pistons',59,97,'98/99');
INSERT INTO Partidos VALUES (97,'Clippers','Cavaliers',89,118,'98/99');
INSERT INTO Partidos VALUES (98,'Clippers','Pacers',142,112,'98/99');
INSERT INTO Partidos VALUES (99,'Clippers','Bulls',155,156,'98/99');
INSERT INTO Partidos VALUES (100,'Clippers','Bucks',110,97,'98/99');

