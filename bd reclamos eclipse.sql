
/* Drop Tables */

IF ObJECt_ID('[bitacora_reclamos_medicos]') IS NOT NULL DROP TABLE [bitacora_reclamos_medicos];
IF ObJECt_ID('[reclamos_medicos]') IS NOT NULL DROP TABLE [reclamos_medicos];
IF ObJECt_ID('[reg_reclamos_medicos]') IS NOT NULL DROP TABLE [reg_reclamos_medicos];
IF ObJECt_ID('[dbo.bitacora_reclamo_auto]') IS NOT NULL DROP TABLE [dbo.bitacora_reclamo_auto];
IF ObJECt_ID('[dbo.reclamo_auto]') IS NOT NULL DROP TABLE [dbo.reclamo_auto];
IF ObJECt_ID('[dbo.auto_reclamo]') IS NOT NULL DROP TABLE [dbo.auto_reclamo];
IF ObJECt_ID('[dbo.bitacora_reclamos_varios]') IS NOT NULL DROP TABLE [dbo.bitacora_reclamos_varios];
IF ObJECt_ID('[dbo.reclamos_varios]') IS NOT NULL DROP TABLE [dbo.reclamos_varios];
IF ObJECt_ID('[dbo.usuario]') IS NOT NULL DROP TABLE [dbo.usuario];
IF ObJECt_ID('[dbo.cabina]') IS NOT NULL DROP TABLE [dbo.cabina];
IF ObJECt_ID('[dbo.sucursal]') IS NOT NULL DROP TABLE [dbo.sucursal];
IF ObJECt_ID('[dbo.empresa]') IS NOT NULL DROP TABLE [dbo.empresa];
IF ObJECt_ID('[dbo.estado]') IS NOT NULL DROP TABLE [dbo.estado];
IF ObJECt_ID('[dbo.pais]') IS NOT NULL DROP TABLE [dbo.pais];
IF ObJECt_ID('[dbo.reg_reclamo_varios]') IS NOT NULL DROP TABLE [dbo.reg_reclamo_varios];




/* Create Tables */

CREATE TABLE [bitacora_reclamos_medicos]
(
	[id] int NOT NULL IDENTITY ,
	[descripcion] nvarchar(50),
	[hora_commit] time,
	[fecha_commit] date,
	[id_reclamo_medico] int NOT NULL,
	PRIMARY KEY ([id])
);


CREATE TABLE [reclamos_medicos]
(
	[id] int NOT NULL IDENTITY ,
	[reportante] nvarchar(50),
	[titular] nvarchar(50),
	[tipo_consulta] nvarchar(60),
	[correo] nvarchar(60),
	[telefono] nvarchar(40),
	[id_estado] int NOT NULL,
	[id_usuario] int NOT NULL,
	[id_cabina] int NOT NULL,
	[id_reg_reclamos_medicos] int NOT NULL,
	PRIMARY KEY ([id])
);


CREATE TABLE [reg_reclamos_medicos]
(
	[id ] int NOT NULL IDENTITY ,
	PRIMARY KEY ([id ])
);


CREATE TABLE [dbo.auto_reclamo]
(
	[id] int NOT NULL IDENTITY ,
	[placa] nvarchar(30),
	[color] nvarchar(50),
	[chasis] nvarchar(50),
	[motor] nvarchar(50),
	[propietario] nvarchar(50),
	[marca] nvarchar(50),
	[poliza] nvarchar(50),
	CONSTRAINT PK__auto_rec__3213E83FD1F35431 PRIMARY KEY ([id])
);


CREATE TABLE [dbo.bitacora_reclamos_varios]
(
	[id] int  NOT NULL IDENTITY ,
	[descripcion] nvarchar(300),
	[hora] time(2) DEFAULT '(getdate())',
	[fecha] date DEFAULT (getdate()),
	[id_reclamos_varios] int NOT NULL,
	CONSTRAINT PK__bitacora__3213E83F230366D3 PRIMARY KEY ([id])
);


CREATE TABLE [dbo.bitacora_reclamo_auto]
(
	[id] int NOT NULL IDENTITY ,
	[descripcion] nvarchar(200) NOT NULL,
	[fecha_commit] date DEFAULT (getdate()),
	[hora_commit] time(2) DEFAULT '(getdate())',
	[id_reclamo] int NOT NULL,
	CONSTRAINT PK__bitacora__3213E83F36F6BD55 PRIMARY KEY ([id])
);


CREATE TABLE [dbo.cabina]
(
	[id] int NOT NULL IDENTITY ,
	[nombre] nvarchar(50) NOT NULL,
	[direccion] nvarchar(50) NOT NULL,
	[telefono] nvarchar(20) NOT NULL,
	[id_sucursal] int NOT NULL,
	CONSTRAINT PK__cabina__3213E83F95058B1A PRIMARY KEY ([id])
);


CREATE TABLE [dbo.empresa]
(
	[id] int NOT NULL IDENTITY ,
	[nombre] varchar(50),
	[id_pais] int NOT NULL,
	CONSTRAINT PK__empresa__3213E83FC2880786 PRIMARY KEY ([id])
);


CREATE TABLE [dbo.estado]
(
	[id] int NOT NULL IDENTITY ,
	[nombre] nvarchar(30) NOT NULL,
	CONSTRAINT PK__estado__3213E83F0E9281DE PRIMARY KEY ([id])
);


CREATE TABLE [dbo.pais]
(
	[id] int NOT NULL IDENTITY ,
	[nombre] varchar(50) NOT NULL,
	[moneda] varchar(30) NOT NULL,
	CONSTRAINT PK__pais__3213E83F10EBE32E PRIMARY KEY ([id])
);


CREATE TABLE [dbo.reclamos_varios]
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
	[id_usuario] int  NOT NULL,
	[id_reg_reclamos_varios] int  NOT NULL,
	[id_cabina] int NOT NULL,
	[fecha_commit] date DEFAULT (getdate()) NOT NULL,
	[hora_commit] time(2) DEFAULT '(getdate())' NOT NULL,
	CONSTRAINT PK__reclamos__3213E83F6CEDA402 PRIMARY KEY ([id])
);


CREATE TABLE [dbo.reclamo_auto]
(
	[id] int  NOT NULL IDENTITY ,
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
	[fecha_commit] date DEFAULT (getdate()),
	[hora_commit] time(2) DEFAULT '(getdate())',
	CONSTRAINT PK__reclamo___3213E83FE455F747 PRIMARY KEY ([id])
);


CREATE TABLE [dbo.reg_reclamo_varios]
(
	[id] int NOT NULL IDENTITY ,
	[poliza] varchar(50),
	[nombre] varchar(50),
	[apellido] varchar(50),
	[cliente] int,
	[status] varchar(20),
	[tipo] varchar(20),
	[direccion] varchar(50),
	[ramo] nvarchar(10),
	CONSTRAINT PK__reg_recl__3213E83F4DB4AC1A PRIMARY KEY ([id])
);


CREATE TABLE [dbo.sucursal]
(
	[id] int NOT NULL IDENTITY ,
	[nombre] nvarchar(50),
	[id_empresa] int NOT NULL,
	CONSTRAINT PK__sucursal__3213E83F2D0042A9 PRIMARY KEY ([id])
);


CREATE TABLE [dbo.usuario]
(
	[id] int NOT NULL IDENTITY ,
	[nombre] varchar(50) NOT NULL,
	[id_usuario] uniqueidentifier  NOT NULL,
	[id_cabina] int NOT NULL,
	CONSTRAINT PK__usuario__3213E83FD4CC4916 PRIMARY KEY ([id])
);



/* Create Foreign Keys */

ALTER TABLE [bitacora_reclamos_medicos]
	ADD FOREIGN KEY ([id_reclamo_medico])
	REFERENCES [reclamos_medicos] ([id])

;


ALTER TABLE [reclamos_medicos]
	ADD FOREIGN KEY ([id_reg_reclamos_medicos])
	REFERENCES [reg_reclamos_medicos] ([id ])

;


ALTER TABLE [dbo.reclamo_auto]
	ADD CONSTRAINT [FK__reclamo_a__id_au__41EDCAC5] FOREIGN KEY ([id_auto_reclamo])
	REFERENCES [dbo.auto_reclamo] ([id])

;


ALTER TABLE [reclamos_medicos]
	ADD FOREIGN KEY ([id_cabina])
	REFERENCES [dbo.cabina] ([id])

;


ALTER TABLE [dbo.reclamos_varios]
	ADD CONSTRAINT [FK__reclamos___id_ca__42E1EEFE] FOREIGN KEY ([id_cabina])
	REFERENCES [dbo.cabina] ([id])

;


ALTER TABLE [dbo.reclamo_auto]
	ADD CONSTRAINT [FK__reclamo_a__id_ca__43D61337] FOREIGN KEY ([id_cabina])
	REFERENCES [dbo.cabina] ([id])

;


ALTER TABLE [dbo.usuario]
	ADD CONSTRAINT [FK__usuario__id_cabi__38996AB5] FOREIGN KEY ([id_cabina])
	REFERENCES [dbo.cabina] ([id])

;


ALTER TABLE [dbo.sucursal]
	ADD CONSTRAINT [FK__sucursal__id_emp__398D8EEE] FOREIGN KEY ([id_empresa])
	REFERENCES [dbo.empresa] ([id])

;


ALTER TABLE [dbo.sucursal]
	ADD CONSTRAINT [FK__sucursal__id_emp__3A81B327] FOREIGN KEY ([id_empresa])
	REFERENCES [dbo.empresa] ([id])

;


ALTER TABLE [reclamos_medicos]
	ADD FOREIGN KEY ([id_estado])
	REFERENCES [dbo.estado] ([id])

;


ALTER TABLE [dbo.reclamos_varios]
	ADD CONSTRAINT [FK__reclamos___id_es__46B27FE2] FOREIGN KEY ([id_estado])
	REFERENCES [dbo.estado] ([id])

;


ALTER TABLE [dbo.reclamo_auto]
	ADD CONSTRAINT [FK__reclamo_a__id_es__47A6A41B] FOREIGN KEY ([id_estado])
	REFERENCES [dbo.estado] ([id])

;


ALTER TABLE [dbo.empresa]
	ADD CONSTRAINT [FK__empresa__id_pais__30F848ED] FOREIGN KEY ([id_pais])
	REFERENCES [dbo.pais] ([id])

;


ALTER TABLE [dbo.empresa]
	ADD CONSTRAINT [FK__empresa__id_pais__300424B4] FOREIGN KEY ([id_pais])
	REFERENCES [dbo.pais] ([id])

;


ALTER TABLE [dbo.bitacora_reclamos_varios]
	ADD FOREIGN KEY ([id_reclamos_varios])
	REFERENCES [dbo.reclamos_varios] ([id])

;


ALTER TABLE [dbo.bitacora_reclamo_auto]
	ADD CONSTRAINT [FK__bitacora___id_re__4A8310C6] FOREIGN KEY ([id_reclamo])
	REFERENCES [dbo.reclamo_auto] ([id])

;


ALTER TABLE [dbo.reclamos_varios]
	ADD CONSTRAINT [FK__reclamos___id_re__4B7734FF] FOREIGN KEY ([id_reg_reclamos_varios])
	REFERENCES [dbo.reg_reclamo_varios] ([id])

;


ALTER TABLE [dbo.cabina]
	ADD CONSTRAINT [FK__cabina__id_sucur__2F10007B] FOREIGN KEY ([id_sucursal])
	REFERENCES [dbo.sucursal] ([id])

;


ALTER TABLE [dbo.cabina]
	ADD CONSTRAINT [FK__cabina__id_sucur__2E1BDC42] FOREIGN KEY ([id_sucursal])
	REFERENCES [dbo.sucursal] ([id])

;


ALTER TABLE [reclamos_medicos]
	ADD FOREIGN KEY ([id_usuario])
	REFERENCES [dbo.usuario] ([id])
	
;


ALTER TABLE [dbo.reclamos_varios]
	ADD CONSTRAINT [FK__reclamos___id_us__4D5F7D71] FOREIGN KEY ([id_usuario])
	REFERENCES [dbo.usuario] ([id])
	
;


ALTER TABLE [dbo.reclamo_auto]
	ADD CONSTRAINT [FK__reclamo_a__id_us__4E53A1AA] FOREIGN KEY ([id_usuario])
	REFERENCES [dbo.usuario] ([id])

;



