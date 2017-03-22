/* Drop Tables */

IF ObJECt_ID('[bitacora_reclamo_auto]') IS NOT NULL DROP TABLE [bitacora_reclamo_auto];
IF ObJECt_ID('[reclamo_auto]') IS NOT NULL DROP TABLE [reclamo_auto];
IF ObJECt_ID('[auto_reclamo]') IS NOT NULL DROP TABLE [auto_reclamo];
IF ObJECt_ID('[bitacora_reclamos_medicos]') IS NOT NULL DROP TABLE [bitacora_reclamos_medicos];
IF ObJECt_ID('[bitacora_reclamos_varios]') IS NOT NULL DROP TABLE [bitacora_reclamos_varios];
IF ObJECt_ID('[reclamos_medicos]') IS NOT NULL DROP TABLE [reclamos_medicos];
IF ObJECt_ID('[reclamos_varios]') IS NOT NULL DROP TABLE [reclamos_varios];
IF ObJECt_ID('[usuario]') IS NOT NULL DROP TABLE [usuario];
IF ObJECt_ID('[cabina]') IS NOT NULL DROP TABLE [cabina];
IF ObJECt_ID('[sucursal]') IS NOT NULL DROP TABLE [sucursal];
IF ObJECt_ID('[empresa]') IS NOT NULL DROP TABLE [empresa];
IF ObJECt_ID('[estado]') IS NOT NULL DROP TABLE [estado];
IF ObJECt_ID('[pais]') IS NOT NULL DROP TABLE [pais];
IF ObJECt_ID('[reg_reclamos_medicos]') IS NOT NULL DROP TABLE [reg_reclamos_medicos];
IF ObJECt_ID('[reg_reclamo_varios]') IS NOT NULL DROP TABLE [reg_reclamo_varios];




/* Create Tables */

CREATE TABLE [auto_reclamo]
(
	[id] int NOT NULL IDENTITY ,
	[placa] nvarchar(30),
	[color] nvarchar(50),
	[chasis] nvarchar(50),
	[motor] nvarchar(50),
	[propietario] varchar(50),
	[marca] varchar(50),
	[poliza] varchar(50),
	PRIMARY KEY ([id])
);


CREATE TABLE [bitacora_reclamos_medicos]
(
	[id] int NOT NULL IDENTITY ,
	[descripcion] nvarchar(400),
	[hora_commit] time,
	[fecha_commit] date,
	[id_reclamos_medicos] int NOT NULL,
	PRIMARY KEY ([id])
);


CREATE TABLE [bitacora_reclamos_varios]
(
	[id] int NOT NULL IDENTITY ,
	[descripcion] varchar(400),
	[hora] time,
	[fecha] date,
	[id_reclamos_varios] int NOT NULL,
	PRIMARY KEY ([id])
);


CREATE TABLE [bitacora_reclamo_auto]
(
	[id] int NOT NULL IDENTITY ,
	[descripcion] nvarchar(400) NOT NULL,
	[fecha] date,
	[hora] time,
	[id_reclamo] int NOT NULL,
	PRIMARY KEY ([id])
);


CREATE TABLE [cabina]
(
	[id] int NOT NULL IDENTITY ,
	[nombre] nvarchar(50) NOT NULL,
	[direccion] nvarchar(50) NOT NULL,
	[telefono] nvarchar(20) NOT NULL,
	[id_sucursal] int NOT NULL,
	PRIMARY KEY ([id])
);


CREATE TABLE [empresa]
(
	[id] int NOT NULL IDENTITY ,
	[nombre] varchar(50),
	[id_pais] int NOT NULL,
	PRIMARY KEY ([id])
);


CREATE TABLE [estado]
(
	[id] int NOT NULL IDENTITY ,
	[nombre] nvarchar(30) NOT NULL,
	PRIMARY KEY ([id])
);


CREATE TABLE [pais]
(
	[id] int NOT NULL IDENTITY ,
	[nombre] varchar(50) NOT NULL,
	[moneda] varchar(30) NOT NULL,
	PRIMARY KEY ([id])
);


CREATE TABLE [reclamos_medicos]
(
	[id] int NOT NULL IDENTITY ,
	[reportante] nvarchar(50),
	[tipo_consulta] nvarchar(50),
	[correo] nvarchar(50),
	[telefono] nvarchar(50),
	[id_estado] int NOT NULL,
	[id_usuario] int NOT NULL,
	[id_cabina] int NOT NULL,
	[id_reg_reclamos_medicos] int NOT NULL,
	PRIMARY KEY ([id])
);


CREATE TABLE [reclamos_varios]
(
	[id] int NOT NULL IDENTITY ,
	[boleta] varchar(50),
	[titular] varchar(50),
	[ubicacion] varchar(70),
	[hora] time,
	[fecha] date,
	[reportante] varchar(60) NOT NULL,
	[telefono] varchar(30) NOT NULL,
	[ajustador] varchar(50),
	[version] varchar(300),
	[id_estado] int NOT NULL,
	[id_usuario] int NOT NULL,
	[id_reg_reclamos_varios] int NOT NULL,
	[id_cabina] int NOT NULL,
	[fecha_commit] date NOT NULL,
	[hora_commit] time NOT NULL,
	PRIMARY KEY ([id])
);


CREATE TABLE [reclamo_auto]
(
	[id] int NOT NULL IDENTITY ,
	[boleta] varchar(50),
	[titular] varchar(70),
	[ubicacion] varchar(50),
	[hora] time,
	[fecha] date,
	[reportante] varchar(50),
	[piloto] varchar(50),
	[telefono] varchar(20),
	[ajustador] varchar(50),
	[version] varchar(300),
	[id_auto_reclamo] int NOT NULL,
	[id_estado] int NOT NULL,
	[id_cabina] int NOT NULL,
	[id_usuario] int NOT NULL,
	PRIMARY KEY ([id])
);


CREATE TABLE [reg_reclamos_medicos]
(
	[id] int NOT NULL IDENTITY ,
	[asegurado] nvarchar(70),
	[poliza] nvarchar(50),
	[ramo ] smallint,
	[tipo] nvarchar(5),
	[clase] nvarchar(5),
	[parentesco] nvarchar(10),
	PRIMARY KEY ([id])
);


CREATE TABLE [reg_reclamo_varios]
(
	[id] int NOT NULL IDENTITY ,
	[poliza] varchar(50),
	[nombre] varchar(50),
	[apellido] varchar(50),
	[cliente ] int,
	[status] varchar(20),
	[tipo] varchar(20),
	[direccion] varchar(50),
	[ramo] varchar(50),
	PRIMARY KEY ([id])
);


CREATE TABLE [sucursal]
(
	[id] int NOT NULL IDENTITY ,
	[nombre] nvarchar(50),
	[id_empresa] int NOT NULL,
	PRIMARY KEY ([id])
);


CREATE TABLE [usuario]
(
	[id] int NOT NULL IDENTITY ,
	[nombre] varchar(50),
	[id_usuario] uniqueidentifier  NOT NULL,
	[id_cabina] int NOT NULL,
	PRIMARY KEY ([id])
);



/* Create Foreign Keys */

ALTER TABLE [reclamo_auto]
	ADD FOREIGN KEY ([id_auto_reclamo])
	REFERENCES [auto_reclamo] ([id])

;


ALTER TABLE [reclamos_medicos]
	ADD FOREIGN KEY ([id_cabina])
	REFERENCES [cabina] ([id])

;


ALTER TABLE [reclamos_varios]
	ADD FOREIGN KEY ([id_cabina])
	REFERENCES [cabina] ([id])

;


ALTER TABLE [reclamo_auto]
	ADD FOREIGN KEY ([id_cabina])
	REFERENCES [cabina] ([id])

;


ALTER TABLE [usuario]
	ADD FOREIGN KEY ([id_cabina])
	REFERENCES [cabina] ([id])

;


ALTER TABLE [sucursal]
	ADD FOREIGN KEY ([id_empresa])
	REFERENCES [empresa] ([id])

;


ALTER TABLE [reclamos_medicos]
	ADD FOREIGN KEY ([id_estado])
	REFERENCES [estado] ([id])
	
;


ALTER TABLE [reclamos_varios]
	ADD FOREIGN KEY ([id_estado])
	REFERENCES [estado] ([id])

;


ALTER TABLE [reclamo_auto]
	ADD FOREIGN KEY ([id_estado])
	REFERENCES [estado] ([id])

;


ALTER TABLE [empresa]
	ADD FOREIGN KEY ([id_pais])
	REFERENCES [pais] ([id])

;


ALTER TABLE [bitacora_reclamos_medicos]
	ADD FOREIGN KEY ([id_reclamos_medicos])
	REFERENCES [reclamos_medicos] ([id])

;


ALTER TABLE [bitacora_reclamos_varios]
	ADD FOREIGN KEY ([id_reclamos_varios])
	REFERENCES [reclamos_varios] ([id])

;


ALTER TABLE [bitacora_reclamo_auto]
	ADD FOREIGN KEY ([id_reclamo])
	REFERENCES [reclamo_auto] ([id])

;


ALTER TABLE [reclamos_medicos]
	ADD FOREIGN KEY ([id_reg_reclamos_medicos])
	REFERENCES [reg_reclamos_medicos] ([id])

;


ALTER TABLE [reclamos_varios]
	ADD FOREIGN KEY ([id_reg_reclamos_varios])
	REFERENCES [reg_reclamo_varios] ([id])

;


ALTER TABLE [cabina]
	ADD FOREIGN KEY ([id_sucursal])
	REFERENCES [sucursal] ([id])
	


ALTER TABLE [reclamos_medicos]
	ADD FOREIGN KEY ([id_usuario])
	REFERENCES [usuario] ([id])
	
;


ALTER TABLE [reclamos_varios]
	ADD FOREIGN KEY ([id_usuario])
	REFERENCES [usuario] ([id])

;


ALTER TABLE [reclamo_auto]
	ADD FOREIGN KEY ([id_usuario])
	REFERENCES [usuario] ([id])

;



