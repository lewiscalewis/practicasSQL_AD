DROP TABLE Pagos;
DROP TABLE DetallePedidos;
DROP TABLE Productos;
DROP TABLE Pedidos;
DROP TABLE Clientes;
DROP TABLE GamasProductos;
DROP TABLE Empleados;
DROP TABLE Oficinas;

CREATE TABLE Oficinas (
  CodigoOficina varchar(10) NOT NULL,
  Ciudad varchar(30) NOT NULL,
  Pais varchar(50) NOT NULL,
  Region varchar(50) DEFAULT NULL,
  CodigoPostal varchar(10) NOT NULL,
  Telefono varchar(20) NOT NULL,
  LineaDireccion1 varchar(50) NOT NULL,
  LineaDireccion2 varchar(50) DEFAULT NULL,
  CONSTRAINT pk_oficinas PRIMARY KEY (CodigoOficina)
);

CREATE TABLE Empleados (
  CodigoEmpleado integer NOT NULL,
  Nombre varchar(50) NOT NULL,
  Apellido1 varchar(50) NOT NULL,
  Apellido2 varchar(50) DEFAULT NULL,
  Extension varchar(10) NOT NULL,
  Email varchar(100) NOT NULL,
  CodigoOficina varchar(10) NOT NULL,
  CodigoJefe integer DEFAULT NULL,
  Puesto varchar(50) DEFAULT NULL,
  CONSTRAINT pk_empleados PRIMARY KEY (CodigoEmpleado),
  CONSTRAINT fk_empleadosOficinas FOREIGN KEY (CodigoOficina)
	REFERENCES Oficinas (CodigoOficina),
  CONSTRAINT fk_empleadosEmpleados FOREIGN KEY (CodigoJefe)
	REFERENCES Empleados (CodigoEmpleado)
);

CREATE TABLE GamasProductos (
  Gama varchar(50) NOT NULL,
  DescripcionTexto text,
  DescripcionHTML text,
  Imagen blob,
  CONSTRAINT pk_gamasProductos PRIMARY KEY (Gama)
);

CREATE TABLE Clientes (
  CodigoCliente integer NOT NULL,
  NombreCliente varchar(50) NOT NULL,
  NombreContacto varchar(30) DEFAULT NULL,
  ApellidoContacto varchar(30) DEFAULT NULL,
  Telefono varchar(15) NOT NULL,
  Fax varchar(15) NOT NULL,
  LineaDireccion1 varchar(50) NOT NULL,
  LineaDireccion2 varchar(50) DEFAULT NULL,
  Ciudad varchar(50) NOT NULL,
  Region varchar(50) DEFAULT NULL,
  Pais varchar(50) DEFAULT NULL,
  CodigoPostal varchar(10) DEFAULT NULL,
  CodigoEmpleadoRepVentas integer DEFAULT NULL,
  LimiteCredito numeric(15,2) DEFAULT NULL,
  CONSTRAINT pk_clientes PRIMARY KEY (CodigoCliente),
  CONSTRAINT fk_clientesEmpleados FOREIGN KEY (CodigoEmpleadoRepVentas)
	REFERENCES Empleados (CodigoEmpleado)
);

CREATE TABLE Pedidos (
  CodigoPedido integer NOT NULL,
  FechaPedido date NOT NULL,
  FechaEsperada date NOT NULL,
  FechaEntrega date DEFAULT NULL,
  Estado varchar(15) NOT NULL,
  Comentarios text,
  CodigoCliente integer NOT NULL,
  CONSTRAINT pk_pedidos PRIMARY KEY (CodigoPedido),
  CONSTRAINT fk_pedidosClientes FOREIGN KEY (CodigoCliente)
	REFERENCES Clientes (CodigoCliente)
);

CREATE TABLE Productos (
  CodigoProducto varchar(15) NOT NULL,
  Nombre varchar(70) NOT NULL,
  Gama varchar(50) NOT NULL,
  Dimensiones varchar(25) NULL,
  Proveedor varchar(50) DEFAULT NULL,
  Descripcion text NULL,
  CantidadEnStock smallint NOT NULL,
  PrecioVenta numeric(15,2) NOT NULL,
  PrecioProveedor numeric(15,2) DEFAULT NULL,
  CONSTRAINT pk_productos PRIMARY KEY (CodigoProducto),
  CONSTRAINT fk_productosGamas FOREIGN KEY (Gama)
	REFERENCES GamasProductos (Gama)
);

CREATE TABLE DetallePedidos (
  CodigoPedido integer NOT NULL,
  CodigoProducto varchar(15) NOT NULL,
  Cantidad integer NOT NULL,
  PrecioUnidad numeric(15,2) NOT NULL,
  NumeroLinea smallint NOT NULL,
  CONSTRAINT pk_detallePedidos PRIMARY KEY (CodigoPedido,CodigoProducto),
  CONSTRAINT fk_detallePedidosPedidos FOREIGN KEY (CodigoPedido)
	REFERENCES Pedidos (CodigoPedido),
  CONSTRAINT fk_detallePedidosProductos FOREIGN KEY (CodigoProducto)
	REFERENCES Productos (CodigoProducto)
);

CREATE TABLE Pagos (
  CodigoCliente integer NOT NULL,
  FormaPago varchar(40) NOT NULL,
  IDTransaccion varchar(50) NOT NULL,
  FechaPago date NOT NULL,
  Cantidad numeric(15,2) NOT NULL,
  CONSTRAINT pk_pagos PRIMARY KEY (CodigoCliente,IDTransaccion),
  CONSTRAINT fk_pagosClientes FOREIGN KEY (CodigoCliente)
	REFERENCES Clientes (CodigoCliente)
);



INSERT INTO Oficinas VALUES ('BCN-ES','Barcelona','España','Barcelona','08019','+34 93 3561182','Avenida Diagonal, 38','3A escalera Derecha');
INSERT INTO Oficinas VALUES ('BOS-USA','Boston','EEUU','MA','02108','+1 215 837 0825','1550 Court Place','Suite 102');
INSERT INTO Oficinas VALUES ('LON-UK','Londres','Inglaterra','EMEA','EC2N 1HN','+44 20 78772041','52 Old Broad Street','Ground Floor');
INSERT INTO Oficinas VALUES ('MAD-ES','Madrid','España','Madrid','28032','+34 91 7514487','Bulevar Indalecio Prieto, 32','');
INSERT INTO Oficinas VALUES ('PAR-FR','Paris','Francia','EMEA','75017','+33 14 723 4404','29 Rue Jouffroy d''abbans','');
INSERT INTO Oficinas VALUES ('SFC-USA','San Francisco','EEUU','CA','94080','+1 650 219 4782','100 Market Street','Suite 300');
INSERT INTO Oficinas VALUES ('SYD-AU','Sydney','Australia','APAC','NSW 2010','+61 2 9264 2451','5-11 Wentworth Avenue','Floor #2');
INSERT INTO Oficinas VALUES ('TAL-ES','Talavera de la Reina','España','Castilla-LaMancha','45632','+34 925 867231','Francisco Aguirre, 32','5º piso (exterior)');
INSERT INTO Oficinas VALUES ('TOK-JP','Tokyo','Japón','Chiyoda-Ku','102-8578','+81 33 224 5000','4-1 Kioicho','');



INSERT INTO Empleados VALUES (1,'Marcos','Magaña','Perez','3897','marcos@jardineria.es','TAL-ES',NULL,'Director General');
INSERT INTO Empleados VALUES (2,'Ruben','López','Martinez','2899','rlopez@jardineria.es','TAL-ES',1,'Subdirector Marketing');
INSERT INTO Empleados VALUES (3,'Alberto','Soria','Carrasco','2837','asoria@jardineria.es','TAL-ES',2,'Subdirector Ventas');
INSERT INTO Empleados VALUES (4,'Maria','Solís','Jerez','2847','msolis@jardineria.es','TAL-ES',2,'Secretaria');
INSERT INTO Empleados VALUES (5,'Felipe','Rosas','Marquez','2844','frosas@jardineria.es','TAL-ES',3,'Representante Ventas');
INSERT INTO Empleados VALUES (6,'Juan Carlos','Ortiz','Serrano','2845','cortiz@jardineria.es','TAL-ES',3,'Representante Ventas');
INSERT INTO Empleados VALUES (7,'Carlos','Soria','Jimenez','2444','csoria@jardineria.es','MAD-ES',3,'Director Oficina');
INSERT INTO Empleados VALUES (8,'Mariano','López','Murcia','2442','mlopez@jardineria.es','MAD-ES',7,'Representante Ventas');
INSERT INTO Empleados VALUES (9,'Lucio','Campoamor','Martín','2442','lcampoamor@jardineria.es','MAD-ES',7,'Representante Ventas');
INSERT INTO Empleados VALUES (10,'Hilario','Rodriguez','Huertas','2444','hrodriguez@jardineria.es','MAD-ES',7,'Representante Ventas');
INSERT INTO Empleados VALUES (11,'Emmanuel','Magaña','Perez','2518','manu@jardineria.es','BCN-ES',3,'Director Oficina');
INSERT INTO Empleados VALUES (12,'José Manuel','Martinez','De la Osa','2519','jmmart@hotmail.es','BCN-ES',11,'Representante Ventas');
INSERT INTO Empleados VALUES (13,'David','Palma','Aceituno','2519','dpalma@jardineria.es','BCN-ES',11,'Representante Ventas');
INSERT INTO Empleados VALUES (14,'Oscar','Palma','Aceituno','2519','opalma@jardineria.es','BCN-ES',11,'Representante Ventas');
INSERT INTO Empleados VALUES (15,'Francois','Fignon','','9981','ffignon@gardening.com','PAR-FR',3,'Director Oficina');
INSERT INTO Empleados VALUES (16,'Lionel','Narvaez','','9982','lnarvaez@gardening.com','PAR-FR',15,'Representante Ventas');
INSERT INTO Empleados VALUES (17,'Laurent','Serra','','9982','lserra@gardening.com','PAR-FR',15,'Representante Ventas');
INSERT INTO Empleados VALUES (18,'Michael','Bolton','','7454','mbolton@gardening.com','SFC-USA',3,'Director Oficina');
INSERT INTO Empleados VALUES (19,'Walter Santiago','Sanchez','Lopez','7454','wssanchez@gardening.com','SFC-USA',18,'Representante Ventas');
INSERT INTO Empleados VALUES (20,'Hilary','Washington','','7565','hwashington@gardening.com','BOS-USA',3,'Director Oficina');
INSERT INTO Empleados VALUES (21,'Marcus','Paxton','','7565','mpaxton@gardening.com','BOS-USA',20,'Representante Ventas');
INSERT INTO Empleados VALUES (22,'Lorena','Paxton','','7665','lpaxton@gardening.com','BOS-USA',20,'Representante Ventas');
INSERT INTO Empleados VALUES (23,'Nei','Nishikori','','8734','nnishikori@gardening.com','TOK-JP',3,'Director Oficina');
INSERT INTO Empleados VALUES (24,'Narumi','Riko','','8734','nriko@gardening.com','TOK-JP',23,'Representante Ventas');
INSERT INTO Empleados VALUES (25,'Takuma','Nomura','','8735','tnomura@gardening.com','TOK-JP',23,'Representante Ventas');
INSERT INTO Empleados VALUES (26,'Amy','Johnson','','3321','ajohnson@gardening.com','LON-UK',3,'Director Oficina');
INSERT INTO Empleados VALUES (27,'Larry','Westfalls','','3322','lwestfalls@gardening.com','LON-UK',26,'Representante Ventas');
INSERT INTO Empleados VALUES (28,'John','Walton','','3322','jwalton@gardening.com','LON-UK',26,'Representante Ventas');
INSERT INTO Empleados VALUES (29,'Kevin','Fallmer','','3210','kfalmer@gardening.com','SYD-AU',3,'Director Oficina');
INSERT INTO Empleados VALUES (30,'Julian','Bellinelli','','3211','jbellinelli@gardening.com','SYD-AU',29,'Representante Ventas');
INSERT INTO Empleados VALUES (31,'Mariko','Kishi','','3211','mkishi@gardening.com','SYD-AU',29,'Representante Ventas');



INSERT INTO GamasProductos VALUES ('Herbaceas','Plantas para jardin decorativas',NULL,NULL);
INSERT INTO GamasProductos VALUES ('Herramientas','Herramientas para todo tipo de acción',NULL,NULL);
INSERT INTO GamasProductos VALUES ('Aromáticas','Plantas aromáticas',NULL,NULL);
INSERT INTO GamasProductos VALUES ('Frutales','Árboles pequeños de producción frutal',NULL,NULL);
INSERT INTO GamasProductos VALUES ('Ornamentales','Plantas vistosas para la decoración del jardín',NULL,NULL);


INSERT INTO Clientes VALUES (1,'DGPRODUCTIONS GARDEN','Daniel G','GoldFish','5556901745','5556901746','False Street 52 2 A',NULL,'San Francisco',NULL,'USA','24006',19,3000);
INSERT INTO Clientes VALUES (3,'Gardening Associates','Anne','Wright','5557410345','5557410346','Wall-e Avenue',NULL,'Miami','Miami','USA','24010',19,6000);
INSERT INTO Clientes VALUES (4,'Gerudo Valley','Link','Flaute','5552323129','5552323128','Oaks Avenue nº22',NULL,'New York',NULL,'USA','85495',22,12000);
INSERT INTO Clientes VALUES (5,'Tendo Garden','Akane','Tendo','55591233210','55591233211','Null Street nº69',NULL,'Miami',NULL,'USA','696969',22,600000);
INSERT INTO Clientes VALUES (6,'Lasas S.A.','Antonio','Lasas','34916540145','34914851312','C/Leganes 15',NULL,'Fuenlabrada','Madrid','Spain','28945',8,154310);
INSERT INTO Clientes VALUES (7,'Beragua','Jose','Bermejo','654987321','916549872','C/pintor segundo','Getafe','Madrid','Madrid','España','28942',11,20000);
INSERT INTO Clientes VALUES (8,'Club Golf Puerta del hierro','Paco','Lopez','62456810','919535678','C/sinesio delgado','Madrid','Madrid','Madrid','España','28930',11,40000);
INSERT INTO Clientes VALUES (9,'Naturagua','Guillermo','Rengifo','689234750','916428956','C/majadahonda','Boadilla','Madrid','Madrid','España','28947',11,32000);
INSERT INTO Clientes VALUES (10,'DaraDistribuciones','David','Serrano','675598001','916421756','C/azores','Fuenlabrada','Madrid','Madrid','España','28946',11,50000);
INSERT INTO Clientes VALUES (11,'Madrileña de riegos','Jose','Tacaño','655983045','916689215','C/Lagañas','Fuenlabrada','Madrid','Madrid','España','28943',11,20000);
INSERT INTO Clientes VALUES (12,'Lasas S.A.','Antonio','Lasas','34916540145','34914851312','C/Leganes 15',NULL,'Fuenlabrada','Madrid','Spain','28945',8,154310);
INSERT INTO Clientes VALUES (13,'Camunas Jardines S.L.','Pedro','Camunas','34914873241','34914871541','C/Virgenes 45','C/Princesas 2 1ºB','San Lorenzo del Escorial','Madrid','Spain','28145',8,16481);
INSERT INTO Clientes VALUES (14,'Dardena S.A.','Juan','Rodriguez','34912453217','34912484764','C/Nueva York 74',NULL,'Madrid','Madrid','Spain','28003',8,321000);
INSERT INTO Clientes VALUES (15,'Jardin de Flores','Javier','Villar','654865643','914538776','C/ Oña 34',NULL,'Madrid','Madrid','España','28950',30,40000);
INSERT INTO Clientes VALUES (16,'Flores Marivi','Maria','Rodriguez','666555444','912458657','C/Leganes24',NULL,'Fuenlabrada','Madrid','España','28945',5,1500);
INSERT INTO Clientes VALUES (17,'Flowers, S.A','Beatriz','Fernandez','698754159','978453216','C/Luis Salquillo4',NULL,'Montornes del valles','Barcelona','España','24586',5,3500);
INSERT INTO Clientes VALUES (18,'Naturajardin','Victoria','Cruz','612343529','916548735','Plaza Magallón 15',NULL,'Madrid','Madrid','España','28011',30,5050);
INSERT INTO Clientes VALUES (19,'Golf S.A.','Luis','Martinez','916458762','912354475','C/Estancado',NULL,'Santa cruz de Tenerife','Islas Canarias','España','38297',12,30000);
INSERT INTO Clientes VALUES (20,'AYMERICH GOLF MANAGEMENT, SL','Mario','Suarez','964493072','964493063','C/Letardo',NULL,'Barcelona','Cataluña','España','12320',12,20000);
INSERT INTO Clientes VALUES (21,'Aloha','Cristian','Rodrigez','916485852','914489898','C/Roman 3',NULL,'Canarias','Canarias','España','35488',12,50000);
INSERT INTO Clientes VALUES (22,'El Prat','Francisco','Camacho','916882323','916493211','Avenida Tibidabo',NULL,' Barcelona','Cataluña','España','12320',12,30000);
INSERT INTO Clientes VALUES (23,'Sotogrande','Maria','Santillana','915576622','914825645','C/Paseo del Parque',NULL,'Sotogrande','Cadiz','España','11310',12,60000);
INSERT INTO Clientes VALUES (24,'Vivero Humanes','Federico','Gomez','654987690','916040875','C/Miguel Echegaray 54',NULL,'Humanes','Madrid','España','28970',30,7430);
INSERT INTO Clientes VALUES (25,'Fuenla City','Tony','Muñoz Mena','675842139','915483754','C/Callo 52',NULL,'Fuenlabrada','Madrid','España','28574',5,4500);
INSERT INTO Clientes VALUES (26,'Jardines y Mansiones CACTUS SL','Eva María','Sánchez','916877445','914477777','Polígono Industrial Maspalomas, Nº52','Móstoles','Madrid','Madrid','España','29874',9,76000);
INSERT INTO Clientes VALUES (27,'Jardinerías Matías SL','Matías','San Martín','916544147','917897474','C/Francisco Arce, Nº44','Bustarviejo','Madrid','Madrid','España','37845',9,100500);
INSERT INTO Clientes VALUES (28,'Agrojardin','Benito','Lopez','675432926','916549264','C/Mar Caspio 43',NULL,'Getafe','Madrid','España','28904',30,8040);
INSERT INTO Clientes VALUES (29,'Top Campo','Joseluis','Sanchez','685746512','974315924','C/Ibiza 32',NULL,'Humanes','Madrid','España','28574',5,5500);
INSERT INTO Clientes VALUES (30,'Jardineria Sara','Sara','Marquez','675124537','912475843','C/Lima 1',NULL,'Fenlabrada','Madrid','España','27584',5,7500);
INSERT INTO Clientes VALUES (31,'Campohermoso','Luis','Jimenez','645925376','916159116','C/Peru 78',NULL,'Fuenlabrada','Madrid','España','28945',30,3250);
INSERT INTO Clientes VALUES (32,'france telecom','FraÃ§ois','Toulou','(33)5120578961','(33)5120578961','6 place d Alleray 15Ã¨me',NULL,'Paris',NULL,'France','75010',16,10000);
INSERT INTO Clientes VALUES (33,'Musée du Louvre','Pierre','Delacroux','(33)0140205050','(33)0140205442','Quai du Louvre',NULL,'Paris',NULL,'France','75058',16,30000);
INSERT INTO Clientes VALUES (35,'Tutifruti S.A','Jacob','Jones','2 9261-2433','2 9283-1695','level 24, St. Martins Tower.-31 Market St.',NULL,'Sydney','Nueva Gales del Sur','Australia','2000',31,10000);
INSERT INTO Clientes VALUES (36,'FLORES S.L.','Antonio','Romero','654352981','685249700','Avenida España',NULL,'Madrid','Fuenlabrada','España','29643',18,6000);
INSERT INTO Clientes VALUES (37,'THE MAGIC GARDEN','Richard','Mcain','926523468','9364875882','Lihgting Park',NULL,'London','London','United Kingdom','65930',18,10000);
INSERT INTO Clientes VALUES (38,'El Jardin Viviente S.L','Justin','Smith','2 8005-7161','2 8005-7162','176 Cumberland Street The rocks',NULL,'Sydney','Nueva Gales del Sur','Australia','2003',31,8000);



INSERT INTO Pedidos VALUES (1,'2006-01-17','2006-01-19','2006-01-19','Entregado','Pagado a plazos',5);
INSERT INTO Pedidos VALUES (2,'2007-10-23','2007-10-28','2007-10-26','Entregado','La entrega llego antes de lo esperado',5);
INSERT INTO Pedidos VALUES (3,'2008-06-20','2008-06-25',NULL,'Rechazado','Limite de credito superado',5);
INSERT INTO Pedidos VALUES (4,'2009-01-20','2009-01-26',NULL,'Pendiente',NULL,5);
INSERT INTO Pedidos VALUES (8,'2008-11-09','2008-11-14','2008-11-14','Entregado','El cliente paga la mitad con tarjeta y la otra mitad con efectivo, se le realizan dos facturas',1);
INSERT INTO Pedidos VALUES (9,'2008-12-22','2008-12-27','2008-12-28','Entregado','El cliente comprueba la integridad del paquete, todo correcto',1);
INSERT INTO Pedidos VALUES (10,'2009-01-15','2009-01-20',NULL,'Pendiente','El cliente llama para confirmar la fecha - Esperando al proveedor',3);
INSERT INTO Pedidos VALUES (11,'2009-01-20','2009-01-27',NULL,'Pendiente','El cliente requiere que el pedido se le entregue de 16:00h a 22:00h',1);
INSERT INTO Pedidos VALUES (12,'2009-01-22','2009-01-27',NULL,'Pendiente','El cliente requiere que el pedido se le entregue de 9:00h a 13:00h',1);
INSERT INTO Pedidos VALUES (13,'2009-01-12','2009-01-14','2009-01-15','entregado',NULL,7);
INSERT INTO Pedidos VALUES (14,'2009-01-02','2009-01-02',null,'rechazado','mal pago',7);
INSERT INTO Pedidos VALUES (15,'2009-01-09','2009-01-12','2009-01-11','entregado',NULL,7);
INSERT INTO Pedidos VALUES (16,'2009-01-06','2009-01-07','2009-01-15','entregado',NULL,7);
INSERT INTO Pedidos VALUES (17,'2009-01-08','2009-01-09','2009-01-11','entregado','mal estado',7);
INSERT INTO Pedidos VALUES (18,'2009-01-05','2009-01-06','2009-01-07','entregado',NULL,9);
INSERT INTO Pedidos VALUES (19,'2009-01-18','2009-02-12',NULL,'pendiente','entregar en murcia',9);
INSERT INTO Pedidos VALUES (20,'2009-01-20','2009-02-15',NULL,'pendiente',NULL,9);
INSERT INTO Pedidos VALUES (21,'2009-01-09','2009-01-09','2009-01-09','rechazado','mal pago',9);
INSERT INTO Pedidos VALUES (22,'2009-01-11','2009-01-11','2009-01-13','entregado',NULL,9);
INSERT INTO Pedidos VALUES (23,'2008-12-30','2009-01-10',NULL,'Rechazado','El pedido fue anulado por el cliente',5);
INSERT INTO Pedidos VALUES (24,'2008-07-14','2008-07-31','2008-07-25','Entregado',NULL,14);
INSERT INTO Pedidos VALUES (25,'2009-02-02','2009-02-08',NULL,'Rechazado','El cliente carece de saldo en la cuenta asociada',1);
INSERT INTO Pedidos VALUES (26,'2009-02-06','2009-02-12',NULL,'Rechazado','El cliente anula la operacion para adquirir mas productos',3);
INSERT INTO Pedidos VALUES (27,'2009-02-07','2009-02-13',NULL,'Entregado','El pedido aparece como entregado pero no sabemos en que fecha',3);
INSERT INTO Pedidos VALUES (28,'2009-02-10','2009-02-17','2009-02-20','Entregado','El cliente se queja bastante de la espera asociada al producto',3);
INSERT INTO Pedidos VALUES (29,'2008-08-01','2008-09-01','2008-09-01','Rechazado','El cliente no está conforme con el pedido',14);
INSERT INTO Pedidos VALUES (30,'2008-08-03','2008-09-03','2008-08-31','Entregado',NULL,13);
INSERT INTO Pedidos VALUES (31,'2008-09-04','2008-09-30','2008-10-04','Rechazado','El cliente ha rechazado por llegar 5 dias tarde',13);
INSERT INTO Pedidos VALUES (32,'2007-01-07','2007-01-19','2007-01-27','Entregado','Entrega tardia, el cliente puso reclamacion',4);
INSERT INTO Pedidos VALUES (33,'2007-05-20','2007-05-28',NULL,'Rechazado','El pedido fue anulado por el cliente',4);
INSERT INTO Pedidos VALUES (34,'2007-06-20','2008-06-28','2008-06-28','Entregado','Pagado a plazos',4);
INSERT INTO Pedidos VALUES (35,'2008-03-10','2009-03-20',NULL,'Rechazado','Limite de credito superado',4);
INSERT INTO Pedidos VALUES (36,'2008-10-15','2008-12-15','2008-12-10','Entregado',NULL,14);
INSERT INTO Pedidos VALUES (37,'2008-11-03','2009-11-13',NULL,'Pendiente','El pedido nunca llego a su destino',4);
INSERT INTO Pedidos VALUES (38,'2009-03-05','2009-03-06','2009-03-07','Entregado',NULL,19);
INSERT INTO Pedidos VALUES (39,'2009-03-06','2009-03-07','2009-03-09','Pendiente',NULL,19);
INSERT INTO Pedidos VALUES (40,'2009-03-09','2009-03-10','2009-03-13','Rechazado',NULL,19);


INSERT INTO Productos VALUES ('11679','Sierra de Poda 400MM','Herramientas','0,258','HiperGarden Tools','Gracias a la poda se consigue manipular un poco la naturaleza, dándole la forma que más nos guste. Este trabajo básico de jardinería también facilita que las plantas crezcan de un modo más equilibrado, y que las flores y los frutos vuelvan cada año con regularidad. Lo mejor es dar forma cuando los ejemplares son jóvenes, de modo que exijan pocos cuidados cuando sean adultos. Además de saber cuándo y cómo hay que podar, tener unas herramientas adecuadas para esta labor es también de vital importancia.',15,14,11);
INSERT INTO Productos VALUES ('21636','Pala','Herramientas','0,156','HiperGarden Tools','Palas de acero con cresta de corte en la punta para cortar bien el terreno. Buena penetración en tierras muy compactas.',15,14,13);
INSERT INTO Productos VALUES ('22225','Rastrillo de Jardín','Herramientas','1,064','HiperGarden Tools','Fabuloso rastillo que le ayudará a eliminar piedras, hojas, ramas y otros elementos incómodos en su jardín.',15,12,11);
INSERT INTO Productos VALUES ('30310','Azadón','Herramientas','0,168','HiperGarden Tools','Longitud:24cm. Herramienta fabricada en acero y pintura epoxi,alargando su durabilidad y preveniendo la corrosión.Diseño pensado para el ahorro de trabajo.',15,12,11);
INSERT INTO Productos VALUES ('AR-001','Ajedrea','Aromáticas','15-20','Murcia Seasons','Planta aromática que fresca se utiliza para condimentar carnes y ensaladas, y seca, para pastas, sopas y guisantes',140,1,0);
INSERT INTO Productos VALUES ('AR-002','Lavándula Dentata','Aromáticas','15-20','Murcia Seasons','Espliego de jardín, Alhucema rizada, Alhucema dentada, Cantueso rizado. Familia: Lamiaceae.Origen: España y Portugal. Mata de unos 60 cm de alto. Las hojas son aromáticas, dentadas y de color verde grisáceas.  Produce compactas espigas de flores pequeñas, ligeramente aromáticas, tubulares,de color azulado y con brácteas púrpuras.  Frutos: nuececillas alargadas encerradas en el tubo del cáliz.  Se utiliza en jardineria y no en perfumeria como otros cantuesos, espliegos y lavandas.  Tiene propiedades aromatizantes y calmantes. Adecuadas para la formación de setos bajos. Se dice que su aroma ahuyenta pulgones y otros insectos perjudiciales para las plantas vecinas.',140,1,0);
INSERT INTO Productos VALUES ('AR-003','Mejorana','Aromáticas','15-20','Murcia Seasons','Origanum majorana. No hay que confundirlo con el orégano. Su sabor se parece más al tomillo, pero es más dulce y aromático.Se usan las hojas frescas o secas, picadas, machacadas o en polvo, en sopas, rellenos, quiches y tartas, tortillas, platos con papas y, como aderezo, en ramilletes de hierbas.El sabor delicado de la mejorana se elimina durante la cocción, de manera que es mejor agregarla cuando el plato esté en su punto o en aquéllos que apenas necesitan cocción.',140,1,0);
INSERT INTO Productos VALUES ('AR-004','Melissa ','Aromáticas','15-20','Murcia Seasons','Es una planta perenne (dura varios años) conocida por el agradable y característico olor a limón que desprenden en verano. Nunca debe faltar en la huerta o jardín por su agradable aroma y por los variados usos que tiene: planta olorosa, condimentaria y medicinal. Su cultivo es muy fácil. Le va bien un suelo ligero, con buen drenaje y riego sin exceso. A pleno sol o por lo menos 5 horas de sol por día. Cada año, su abonado mineral correspondiente.En otoño, la melisa pierde el agradable olor a limón que desprende en verano sus flores azules y blancas. En este momento se debe cortar a unos 20 cm. del suelo. Brotará de forma densa en primavera.',140,1,0);
INSERT INTO Productos VALUES ('AR-005','Mentha Sativa','Aromáticas','15-20','Murcia Seasons','Â¿Quién no conoce la Hierbabuena? Se trata de una plantita muy aromática, agradable y cultivada extensamente por toda España. Es hierba perenne (por tanto vive varios años, no es anual). Puedes cultivarla en maceta o plantarla en la tierra del jardín o en un rincón del huerto. Lo más importante es que cuente con bastante agua. En primavera debes aportar fertilizantes minerales. Vive mejor en semisombra que a pleno sol.Si ves orugas o los agujeros en hojas consecuencia de su ataque, retíralas una a una a mano; no uses insecticidas químicos.',140,1,0);
INSERT INTO Productos VALUES ('AR-006','Petrosilium Hortense (Peregil)','Aromáticas','15-20','Murcia Seasons','Nombre científico o latino: Petroselinum hortense, Petroselinum crispum. Nombre común o vulgar: Perejil, Perejil rizado Familia: Umbelliferae (Umbelíferas). Origen: el origen del perejil se encuentra en el Mediterraneo. Esta naturalizada en casi toda Europa. Se utiliza como condimento y para adorno, pero también en ensaladas. Se suele regalar en las fruterías y verdulerías.El perejil lo hay de 2 tipos: de hojas planas y de hojas rizadas.',140,1,0);
INSERT INTO Productos VALUES ('AR-007','Salvia Mix','Aromáticas','15-20','Murcia Seasons','La Salvia es un pequeño arbusto que llega hasta el metro de alto.Tiene una vida breve, de unos pocos años.En el jardín, como otras aromáticas, queda muy bien en una rocalla o para hacer una bordura perfumada a cada lado de un camino de Salvia. Abona después de cada corte y recorta el arbusto una vez pase la floración.',140,1,0);
INSERT INTO Productos VALUES ('AR-008','Thymus Citriodra (Tomillo limón)','Aromáticas','15-20','Murcia Seasons','Nombre común o vulgar: Tomillo, Tremoncillo Familia: Labiatae (Labiadas).Origen: Región mediterránea.Arbustillo bajo, de 15 a 40 cm de altura. Las hojas son muy pequeñas, de unos 6 mm de longitud; según la variedad pueden ser verdes, verdes grisáceas, amarillas, o jaspeadas. Las flores aparecen de mediados de primavera hasta bien entrada la época estival y se presentan en racimos terminales que habitualmente son de color violeta o púrpura aunque también pueden ser blancas. Esta planta despide un intenso y típico aroma, que se incrementa con el roce. El tomillo resulta de gran belleza cuando está en flor. El tomillo atrae a avispas y abejas. En jardinería se usa como manchas, para hacer borduras, para aromatizar el ambiente, llenar huecos, cubrir rocas, para jardines en miniatura, etc. Arranque las flores y hojas secas del tallo y añadálos a un popurri, introdúzcalos en saquitos de hierbas o en la almohada.También puede usar las ramas secas con flores para añadir aroma y textura a cestos abiertos.',140,1,0);
INSERT INTO Productos VALUES ('AR-009','Thymus Vulgaris','Aromáticas','15-20','Murcia Seasons','Nombre común o vulgar: Tomillo, Tremoncillo Familia: Labiatae (Labiadas). Origen: Región mediterránea. Arbustillo bajo, de 15 a 40 cm de altura. Las hojas son muy pequeñas, de unos 6 mm de longitud; según la variedad pueden ser verdes, verdes grisáceas, amarillas, o jaspeadas. Las flores aparecen de mediados de primavera hasta bien entrada la época estival y se presentan en racimos terminales que habitualmente son de color violeta o púrpura aunque también pueden ser blancas. Esta planta despide un intenso y típico aroma, que se incrementa con el roce. El tomillo resulta de gran belleza cuando está en flor. El tomillo atrae a avispas y abejas.\r\n En jardinería se usa como manchas, para hacer borduras, para aromatizar el ambiente, llenar huecos, cubrir rocas, para jardines en miniatura, etc. Arranque las flores y hojas secas del tallo y añadálos a un popurri, introdúzcalos en saquitos de hierbas o en la almohada. También puede usar las ramas secas con flores para añadir aroma y textura a cestos abiertos.',140,1,0);




INSERT INTO DetallePedidos VALUES (1,'FR-67',10,70,3);
INSERT INTO DetallePedidos VALUES (1,'OR-127',40,4,1);
INSERT INTO DetallePedidos VALUES (1,'OR-141',25,4,2);
INSERT INTO DetallePedidos VALUES (1,'OR-241',15,19,4);
INSERT INTO DetallePedidos VALUES (1,'OR-99',23,14,5);
INSERT INTO DetallePedidos VALUES (2,'FR-4',3,29,6);
INSERT INTO DetallePedidos VALUES (2,'FR-40',7,8,7);
INSERT INTO DetallePedidos VALUES (2,'OR-140',50,4,3);
INSERT INTO DetallePedidos VALUES (2,'OR-141',20,5,2);
INSERT INTO DetallePedidos VALUES (2,'OR-159',12,6,5);
INSERT INTO DetallePedidos VALUES (2,'OR-227',67,64,1);
INSERT INTO DetallePedidos VALUES (2,'OR-247',5,462,4);
INSERT INTO DetallePedidos VALUES (3,'FR-48',120,9,6);
INSERT INTO DetallePedidos VALUES (3,'OR-122',32,5,4);
INSERT INTO DetallePedidos VALUES (3,'OR-123',11,5,5);
INSERT INTO DetallePedidos VALUES (3,'OR-213',30,266,1);
INSERT INTO DetallePedidos VALUES (3,'OR-217',15,65,2);
INSERT INTO DetallePedidos VALUES (3,'OR-218',24,25,3);
INSERT INTO DetallePedidos VALUES (4,'FR-31',12,8,7);
INSERT INTO DetallePedidos VALUES (4,'FR-34',42,8,6);
INSERT INTO DetallePedidos VALUES (4,'FR-40',42,9,8);
INSERT INTO DetallePedidos VALUES (4,'OR-152',3,6,5);
INSERT INTO DetallePedidos VALUES (4,'OR-155',4,6,3);
INSERT INTO DetallePedidos VALUES (4,'OR-156',17,9,4);
INSERT INTO DetallePedidos VALUES (4,'OR-157',38,10,2);
INSERT INTO DetallePedidos VALUES (4,'OR-222',21,59,1);
INSERT INTO DetallePedidos VALUES (8,'FR-106',3,11,1);
INSERT INTO DetallePedidos VALUES (8,'FR-108',1,32,2);
INSERT INTO DetallePedidos VALUES (8,'FR-11',10,100,3);
INSERT INTO DetallePedidos VALUES (9,'AR-001',80,1,3);
INSERT INTO DetallePedidos VALUES (9,'AR-008',450,1,2);
INSERT INTO DetallePedidos VALUES (9,'FR-106',80,8,1);
INSERT INTO DetallePedidos VALUES (9,'FR-69',15,91,2);
INSERT INTO DetallePedidos VALUES (10,'FR-82',5,70,2);
INSERT INTO DetallePedidos VALUES (10,'FR-91',30,75,1);
INSERT INTO DetallePedidos VALUES (10,'OR-234',5,64,3);

INSERT INTO Pagos VALUES (1,'PayPal','ak-std-000001','2008-11-10',2000);
INSERT INTO Pagos VALUES (1,'PayPal','ak-std-000002','2008-12-10',2000);
INSERT INTO Pagos VALUES (3,'PayPal','ak-std-000003','2009-01-16',5000);
INSERT INTO Pagos VALUES (3,'PayPal','ak-std-000004','2009-02-16',5000);
INSERT INTO Pagos VALUES (3,'PayPal','ak-std-000005','2009-02-19',926);
INSERT INTO Pagos VALUES (4,'PayPal','ak-std-000006','2007-01-08',20000);
INSERT INTO Pagos VALUES (4,'PayPal','ak-std-000007','2007-01-08',20000);
INSERT INTO Pagos VALUES (4,'PayPal','ak-std-000008','2007-01-08',20000);
INSERT INTO Pagos VALUES (4,'PayPal','ak-std-000009','2007-01-08',20000);
INSERT INTO Pagos VALUES (4,'PayPal','ak-std-000010','2007-01-08',1849);
INSERT INTO Pagos VALUES (5,'Transferencia','ak-std-000011','2006-01-18',23794);
INSERT INTO Pagos VALUES (7,'Cheque','ak-std-000012','2009-01-13',2390);
INSERT INTO Pagos VALUES (9,'PayPal','ak-std-000013','2009-01-06',929);


