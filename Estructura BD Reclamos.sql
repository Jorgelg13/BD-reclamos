USE [reclamos]
GO
/****** Object:  StoredProcedure [dbo].[pa_log_llamdas_Autos]    Script Date: 27/03/2017 20:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[pa_log_llamdas_Autos]

@id int
as
SELECT reclamo_auto.id, bitacora_reclamo_auto.descripcion, bitacora_reclamo_auto.fecha_commit, bitacora_reclamo_auto.hora_commit, bitacora_reclamo_auto.id_reclamo 
FROM bitacora_reclamo_auto INNER JOIN reclamo_auto 
ON bitacora_reclamo_auto.id_reclamo = reclamo_auto.id

where bitacora_reclamo_auto.id_reclamo = @id


GO
/****** Object:  StoredProcedure [dbo].[pa_ReportesAutos]    Script Date: 27/03/2017 20:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------------------------------
-------------procedimientos almacenados para reportes -------------------
create procedure [dbo].[pa_ReportesAutos]
@fechaInicio date,
@fechaFin date
as
SELECT
dbo.reclamo_auto.id,
dbo.reclamo_auto.boleta,
dbo.reclamo_auto.titular,
dbo.reclamo_auto.ubicacion,
dbo.reclamo_auto.hora,
dbo.reclamo_auto.fecha,
dbo.reclamo_auto.reportante,
dbo.reclamo_auto.piloto,
dbo.reclamo_auto.telefono,
dbo.reclamo_auto.ajustador,
dbo.reclamo_auto.version,
dbo.reclamo_auto.metodo,
dbo.auto_reclamo.poliza,
dbo.auto_reclamo.placa,
dbo.auto_reclamo.propietario,
dbo.auto_reclamo.ejecutivo,
dbo.auto_reclamo.aseguradora,
dbo.auto_reclamo.color,
dbo.auto_reclamo.chasis,
dbo.auto_reclamo.motor,
dbo.auto_reclamo.marca,
dbo.cabina.nombre as Cabina,
dbo.sucursal.nombre as Sucursal,
dbo.empresa.nombre as Empresa,
dbo.pais.nombre as Pais,
dbo.usuario.nombre as Usuario

FROM
dbo.auto_reclamo
INNER JOIN dbo.reclamo_auto ON dbo.reclamo_auto.id_auto_reclamo = dbo.auto_reclamo.id
INNER JOIN dbo.cabina ON dbo.reclamo_auto.id_cabina = dbo.cabina.id
INNER JOIN dbo.sucursal ON dbo.cabina.id_sucursal = dbo.sucursal.id
INNER JOIN dbo.empresa ON dbo.sucursal.id_empresa = dbo.empresa.id
INNER JOIN dbo.pais ON dbo.empresa.id_pais = dbo.pais.id
INNER JOIN dbo.usuario ON dbo.reclamo_auto.id_usuario = dbo.usuario.id AND dbo.cabina.id = dbo.usuario.id_cabina

where (fecha between @fechaInicio and @fechaFin)
GO
/****** Object:  StoredProcedure [dbo].[pa_ReportesDaños]    Script Date: 27/03/2017 20:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------
--procedimientos daños--------------
create procedure [dbo].[pa_ReportesDaños]
@fechaInicio date,
@fechaFin date
as
SELECT
dbo.reclamos_varios.id,
dbo.reclamos_varios.boleta,
dbo.reclamos_varios.titular,
dbo.reclamos_varios.ubicacion,
dbo.reclamos_varios.hora,
dbo.reclamos_varios.fecha,
dbo.reclamos_varios.reportante,
dbo.reclamos_varios.telefono,
dbo.reclamos_varios.ajustador,
dbo.reclamos_varios.version,
dbo.reclamos_varios.metodo,
dbo.reclamos_varios.fecha_commit,
dbo.reclamos_varios.hora_commit,
dbo.reg_reclamo_varios.poliza,
dbo.reg_reclamo_varios.nombre,
dbo.reg_reclamo_varios.apellido,
dbo.reg_reclamo_varios.cliente,
dbo.reg_reclamo_varios.status,
dbo.reg_reclamo_varios.tipo,
dbo.reg_reclamo_varios.direccion,
dbo.reg_reclamo_varios.ramo,
dbo.reg_reclamo_varios.ejecutivo,
dbo.reg_reclamo_varios.aseguradora,
dbo.cabina.nombre as Cabina,
dbo.sucursal.nombre as Sucursal,
dbo.empresa.nombre as Empresa,
dbo.pais.nombre as Pais,
dbo.usuario.nombre AS Usuario


FROM
dbo.reclamos_varios
INNER JOIN dbo.reg_reclamo_varios ON dbo.reclamos_varios.id_reg_reclamos_varios = dbo.reg_reclamo_varios.id
INNER JOIN dbo.cabina ON dbo.reclamos_varios.id_cabina = dbo.cabina.id
INNER JOIN dbo.sucursal ON dbo.cabina.id_sucursal = dbo.sucursal.id
INNER JOIN dbo.empresa ON dbo.sucursal.id_empresa = dbo.empresa.id
INNER JOIN dbo.pais ON dbo.empresa.id_pais = dbo.pais.id
INNER JOIN dbo.usuario ON dbo.reclamos_varios.id_usuario = dbo.usuario.id AND dbo.cabina.id = dbo.usuario.id_cabina
where (fecha between @fechaInicio and @fechaFin)

GO
/****** Object:  StoredProcedure [dbo].[pa_ReportesMedicos]    Script Date: 27/03/2017 20:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------------------------------------------------
--------Procediemientos reclamos Medicos---------------
create procedure [dbo].[pa_ReportesMedicos]
@fechaInicio date,
@fechaFin date
as
SELECT
dbo.reclamos_medicos.id,
dbo.reclamos_medicos.reportante,
dbo.reclamos_medicos.tipo_consulta,
dbo.reclamos_medicos.correo,
dbo.reclamos_medicos.telefono,
dbo.reclamos_medicos.metodo,
dbo.reclamos_medicos.hora_commit,
dbo.reclamos_medicos.fecha_commit,
dbo.reg_reclamos_medicos.asegurado,
dbo.reg_reclamos_medicos.poliza,
dbo.reg_reclamos_medicos.ramo,
dbo.reg_reclamos_medicos.tipo,
dbo.reg_reclamos_medicos.clase,
dbo.reg_reclamos_medicos.parentesco,
dbo.reg_reclamos_medicos.ejecutivo,
dbo.reg_reclamos_medicos.aseguradora,
dbo.cabina.nombre as Cabina,
dbo.sucursal.nombre as Sucursal,
dbo.empresa.nombre as Empresa,
dbo.pais.nombre as Pais,
dbo.usuario.nombre AS Usuario
FROM
dbo.reg_reclamos_medicos
INNER JOIN dbo.reclamos_medicos ON dbo.reclamos_medicos.id_reg_reclamos_medicos = dbo.reg_reclamos_medicos.id
INNER JOIN dbo.cabina ON dbo.reclamos_medicos.id_cabina = dbo.cabina.id
INNER JOIN dbo.sucursal ON dbo.cabina.id_sucursal = dbo.sucursal.id
INNER JOIN dbo.empresa ON dbo.sucursal.id_empresa = dbo.empresa.id
INNER JOIN dbo.pais ON dbo.empresa.id_pais = dbo.pais.id
INNER JOIN dbo.usuario ON dbo.reclamos_medicos.id_usuario = dbo.usuario.id AND dbo.cabina.id = dbo.usuario.id_cabina
where (fecha_commit between @fechaInicio and @fechaFin)

GO
/****** Object:  Table [dbo].[auto_reclamo]    Script Date: 27/03/2017 20:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auto_reclamo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[poliza] [nvarchar](50) NULL,
	[placa] [nvarchar](30) NULL,
	[propietario] [nvarchar](100) NULL,
	[ejecutivo] [nvarchar](120) NULL,
	[aseguradora] [nvarchar](120) NULL,
	[color] [nvarchar](20) NULL,
	[chasis] [nvarchar](50) NULL,
	[motor] [nvarchar](50) NULL,
	[marca] [nvarchar](50) NULL,
 CONSTRAINT [PK__auto_rec__3213E83F98119553] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bitacora_reclamo_auto]    Script Date: 27/03/2017 20:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacora_reclamo_auto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](200) NOT NULL,
	[fecha_commit] [date] NULL,
	[hora_commit] [time](0) NULL,
	[id_reclamo] [int] NOT NULL,
 CONSTRAINT [PK__bitacora__3213E83F990BF83A] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bitacora_reclamos_medicos]    Script Date: 27/03/2017 20:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacora_reclamos_medicos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](400) NULL,
	[hora_commit] [time](0) NULL,
	[fecha_commit] [date] NULL,
	[id_reclamos_medicos] [int] NOT NULL,
 CONSTRAINT [PK__bitacora__3213E83FD0CE6B3E] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bitacora_reclamos_varios]    Script Date: 27/03/2017 20:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bitacora_reclamos_varios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](400) NULL,
	[hora_commit] [time](0) NULL,
	[fecha_commit] [date] NULL,
	[id_reclamos_varios] [int] NOT NULL,
 CONSTRAINT [PK__bitacora__3213E83FFA71E2AF] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cabina]    Script Date: 27/03/2017 20:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cabina](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[direccion] [nvarchar](50) NOT NULL,
	[telefono] [nvarchar](20) NOT NULL,
	[id_sucursal] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[empresa]    Script Date: 27/03/2017 20:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[empresa](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[id_pais] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[estado]    Script Date: 27/03/2017 20:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estado](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[pais]    Script Date: 27/03/2017 20:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[pais](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[moneda] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reclamo_auto]    Script Date: 27/03/2017 20:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[reclamo_auto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[boleta] [varchar](50) NULL,
	[titular] [varchar](70) NULL,
	[ubicacion] [varchar](50) NULL,
	[hora] [time](7) NULL,
	[fecha] [date] NULL,
	[reportante] [nvarchar](50) NULL,
	[piloto] [nvarchar](50) NULL,
	[telefono] [nvarchar](50) NULL,
	[ajustador] [nvarchar](50) NULL,
	[version] [nvarchar](300) NULL,
	[metodo] [nvarchar](50) NULL,
	[id_auto_reclamo] [int] NOT NULL,
	[id_estado] [int] NOT NULL,
	[id_cabina] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
 CONSTRAINT [PK__reclamo___3213E83F611F4CE3] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reclamos_medicos]    Script Date: 27/03/2017 20:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reclamos_medicos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reportante] [nvarchar](50) NULL,
	[tipo_consulta] [nvarchar](50) NULL,
	[correo] [nvarchar](50) NULL,
	[telefono] [nvarchar](50) NULL,
	[metodo] [nvarchar](50) NULL,
	[id_estado] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_cabina] [int] NOT NULL,
	[id_reg_reclamos_medicos] [int] NOT NULL,
	[hora_commit] [time](2) NOT NULL,
	[fecha_commit] [date] NOT NULL,
 CONSTRAINT [PK__reclamos__3213E83F984E2DF3] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[reclamos_varios]    Script Date: 27/03/2017 20:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[reclamos_varios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[boleta] [varchar](50) NULL,
	[titular] [varchar](50) NULL,
	[ubicacion] [varchar](70) NULL,
	[hora] [time](2) NULL,
	[fecha] [date] NULL,
	[reportante] [nvarchar](60) NULL,
	[telefono] [nvarchar](50) NULL,
	[ajustador] [nvarchar](60) NULL,
	[version] [nvarchar](300) NULL,
	[metodo] [nvarchar](50) NULL,
	[id_estado] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_reg_reclamos_varios] [int] NOT NULL,
	[id_cabina] [int] NOT NULL,
	[fecha_commit] [date] NOT NULL,
	[hora_commit] [time](2) NOT NULL,
 CONSTRAINT [PK__reclamos__3213E83F329ACC0C] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reg_reclamo_varios]    Script Date: 27/03/2017 20:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reg_reclamo_varios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[poliza] [nvarchar](50) NULL,
	[nombre] [nvarchar](100) NULL,
	[apellido] [nvarchar](50) NULL,
	[cliente] [int] NULL,
	[status] [nvarchar](20) NULL,
	[tipo] [nvarchar](50) NULL,
	[direccion] [nvarchar](200) NULL,
	[ramo] [nvarchar](10) NULL,
	[ejecutivo] [nvarchar](100) NULL,
	[aseguradora] [nvarchar](100) NULL,
	[hora_commit] [time](2) NOT NULL,
	[fecha_commit] [date] NOT NULL,
 CONSTRAINT [PK__reg_recl__3213E83F7FC444C8] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[reg_reclamos_medicos]    Script Date: 27/03/2017 20:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reg_reclamos_medicos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[asegurado] [nvarchar](70) NULL,
	[poliza] [nvarchar](50) NULL,
	[ramo] [nvarchar](50) NULL,
	[tipo] [nvarchar](50) NULL,
	[clase] [nvarchar](20) NULL,
	[parentesco] [nvarchar](20) NULL,
	[ejecutivo] [nvarchar](100) NULL,
	[aseguradora] [nvarchar](100) NULL,
 CONSTRAINT [PK__reg_recl__3213E83F029367AA] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sucursal]    Script Date: 27/03/2017 20:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sucursal](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [nvarchar](50) NULL,
	[id_empresa] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[usuario]    Script Date: 27/03/2017 20:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NULL,
	[id_usuario] [uniqueidentifier] NOT NULL,
	[id_cabina] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[VistaReportesAutos]    Script Date: 27/03/2017 20:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[VistaReportesAutos]
as
SELECT
dbo.reclamo_auto.id,
dbo.reclamo_auto.boleta,
dbo.reclamo_auto.titular,
dbo.reclamo_auto.ubicacion,
dbo.reclamo_auto.hora,
dbo.reclamo_auto.fecha,
dbo.reclamo_auto.reportante,
dbo.reclamo_auto.piloto,
dbo.reclamo_auto.telefono,
dbo.reclamo_auto.ajustador,
dbo.reclamo_auto.version,
dbo.reclamo_auto.metodo,
dbo.auto_reclamo.poliza,
dbo.auto_reclamo.placa,
dbo.auto_reclamo.propietario,
dbo.auto_reclamo.ejecutivo,
dbo.auto_reclamo.aseguradora,
dbo.auto_reclamo.color,
dbo.auto_reclamo.chasis,
dbo.auto_reclamo.motor,
dbo.auto_reclamo.marca,
dbo.cabina.nombre as Cabina,
dbo.sucursal.nombre as Sucursal,
dbo.empresa.nombre as Empresa,
dbo.pais.nombre as Pais,
dbo.usuario.nombre as Usuario

FROM
dbo.auto_reclamo
INNER JOIN dbo.reclamo_auto ON dbo.reclamo_auto.id_auto_reclamo = dbo.auto_reclamo.id
INNER JOIN dbo.cabina ON dbo.reclamo_auto.id_cabina = dbo.cabina.id
INNER JOIN dbo.sucursal ON dbo.cabina.id_sucursal = dbo.sucursal.id
INNER JOIN dbo.empresa ON dbo.sucursal.id_empresa = dbo.empresa.id
INNER JOIN dbo.pais ON dbo.empresa.id_pais = dbo.pais.id
INNER JOIN dbo.usuario ON dbo.reclamo_auto.id_usuario = dbo.usuario.id AND dbo.cabina.id = dbo.usuario.id_cabina
GO
/****** Object:  View [dbo].[vistaReportesDaños]    Script Date: 27/03/2017 20:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[vistaReportesDaños]
as
SELECT
dbo.reclamos_varios.id,
dbo.reclamos_varios.boleta,
dbo.reclamos_varios.titular,
dbo.reclamos_varios.ubicacion,
dbo.reclamos_varios.hora,
dbo.reclamos_varios.fecha,
dbo.reclamos_varios.reportante,
dbo.reclamos_varios.telefono,
dbo.reclamos_varios.ajustador,
dbo.reclamos_varios.version,
dbo.reclamos_varios.metodo,
dbo.reclamos_varios.fecha_commit,
dbo.reclamos_varios.hora_commit,
dbo.reg_reclamo_varios.poliza,
dbo.reg_reclamo_varios.nombre,
dbo.reg_reclamo_varios.apellido,
dbo.reg_reclamo_varios.cliente,
dbo.reg_reclamo_varios.status,
dbo.reg_reclamo_varios.tipo,
dbo.reg_reclamo_varios.direccion,
dbo.reg_reclamo_varios.ramo,
dbo.reg_reclamo_varios.ejecutivo,
dbo.reg_reclamo_varios.aseguradora,
dbo.cabina.nombre as Cabina,
dbo.sucursal.nombre as Sucursal,
dbo.empresa.nombre as Empresa,
dbo.pais.nombre as Pais,
dbo.usuario.nombre AS Usuario


FROM
dbo.reclamos_varios
INNER JOIN dbo.reg_reclamo_varios ON dbo.reclamos_varios.id_reg_reclamos_varios = dbo.reg_reclamo_varios.id
INNER JOIN dbo.cabina ON dbo.reclamos_varios.id_cabina = dbo.cabina.id
INNER JOIN dbo.sucursal ON dbo.cabina.id_sucursal = dbo.sucursal.id
INNER JOIN dbo.empresa ON dbo.sucursal.id_empresa = dbo.empresa.id
INNER JOIN dbo.pais ON dbo.empresa.id_pais = dbo.pais.id
INNER JOIN dbo.usuario ON dbo.reclamos_varios.id_usuario = dbo.usuario.id AND dbo.cabina.id = dbo.usuario.id_cabina

GO
/****** Object:  View [dbo].[vistaReportesMedicos]    Script Date: 27/03/2017 20:45:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
----------------------------------------
-----vista reclamos medicos----------------
create view [dbo].[vistaReportesMedicos]
as
SELECT
dbo.reclamos_medicos.id,
dbo.reclamos_medicos.reportante,
dbo.reclamos_medicos.tipo_consulta,
dbo.reclamos_medicos.correo,
dbo.reclamos_medicos.telefono,
dbo.reclamos_medicos.metodo,
dbo.reclamos_medicos.hora_commit,
dbo.reclamos_medicos.fecha_commit,
dbo.reg_reclamos_medicos.asegurado,
dbo.reg_reclamos_medicos.poliza,
dbo.reg_reclamos_medicos.ramo,
dbo.reg_reclamos_medicos.tipo,
dbo.reg_reclamos_medicos.clase,
dbo.reg_reclamos_medicos.parentesco,
dbo.reg_reclamos_medicos.ejecutivo,
dbo.reg_reclamos_medicos.aseguradora,
dbo.cabina.nombre as Cabina,
dbo.sucursal.nombre as Sucursal,
dbo.empresa.nombre as Empresa,
dbo.pais.nombre as Pais,
dbo.usuario.nombre AS Usuario
FROM
dbo.reg_reclamos_medicos
INNER JOIN dbo.reclamos_medicos ON dbo.reclamos_medicos.id_reg_reclamos_medicos = dbo.reg_reclamos_medicos.id
INNER JOIN dbo.cabina ON dbo.reclamos_medicos.id_cabina = dbo.cabina.id
INNER JOIN dbo.sucursal ON dbo.cabina.id_sucursal = dbo.sucursal.id
INNER JOIN dbo.empresa ON dbo.sucursal.id_empresa = dbo.empresa.id
INNER JOIN dbo.pais ON dbo.empresa.id_pais = dbo.pais.id
INNER JOIN dbo.usuario ON dbo.reclamos_medicos.id_usuario = dbo.usuario.id AND dbo.cabina.id = dbo.usuario.id_cabina



GO
ALTER TABLE [dbo].[bitacora_reclamo_auto] ADD  CONSTRAINT [DF_bitacora_reclamo_auto_fecha]  DEFAULT (getdate()) FOR [fecha_commit]
GO
ALTER TABLE [dbo].[bitacora_reclamo_auto] ADD  CONSTRAINT [DF_bitacora_reclamo_auto_hora]  DEFAULT (getdate()) FOR [hora_commit]
GO
ALTER TABLE [dbo].[bitacora_reclamos_medicos] ADD  CONSTRAINT [DF_bitacora_reclamos_medicos_hora_commit]  DEFAULT (getdate()) FOR [hora_commit]
GO
ALTER TABLE [dbo].[bitacora_reclamos_medicos] ADD  CONSTRAINT [DF_bitacora_reclamos_medicos_fecha_commit]  DEFAULT (getdate()) FOR [fecha_commit]
GO
ALTER TABLE [dbo].[bitacora_reclamos_varios] ADD  CONSTRAINT [DF_bitacora_reclamos_varios_hora_commit]  DEFAULT (getdate()) FOR [hora_commit]
GO
ALTER TABLE [dbo].[bitacora_reclamos_varios] ADD  CONSTRAINT [DF_bitacora_reclamos_varios_fecha_commit]  DEFAULT (getdate()) FOR [fecha_commit]
GO
ALTER TABLE [dbo].[reclamos_medicos] ADD  CONSTRAINT [DF_reclamos_medicos_hora_commit]  DEFAULT (getdate()) FOR [hora_commit]
GO
ALTER TABLE [dbo].[reclamos_medicos] ADD  CONSTRAINT [DF_reclamos_medicos_fecha_commit]  DEFAULT (getdate()) FOR [fecha_commit]
GO
ALTER TABLE [dbo].[reclamos_varios] ADD  CONSTRAINT [DF_reclamos_varios_fecha_commit]  DEFAULT (getdate()) FOR [fecha_commit]
GO
ALTER TABLE [dbo].[reclamos_varios] ADD  CONSTRAINT [DF_reclamos_varios_hora_commit]  DEFAULT (getdate()) FOR [hora_commit]
GO
ALTER TABLE [dbo].[reg_reclamo_varios] ADD  CONSTRAINT [DF_reg_reclamo_varios_ora_commit]  DEFAULT (getdate()) FOR [hora_commit]
GO
ALTER TABLE [dbo].[reg_reclamo_varios] ADD  CONSTRAINT [DF_reg_reclamo_varios_fehca_commit]  DEFAULT (getdate()) FOR [fecha_commit]
GO
ALTER TABLE [dbo].[bitacora_reclamo_auto]  WITH CHECK ADD  CONSTRAINT [FK__bitacora___id_re__09A971A2] FOREIGN KEY([id_reclamo])
REFERENCES [dbo].[reclamo_auto] ([id])
GO
ALTER TABLE [dbo].[bitacora_reclamo_auto] CHECK CONSTRAINT [FK__bitacora___id_re__09A971A2]
GO
ALTER TABLE [dbo].[bitacora_reclamos_medicos]  WITH CHECK ADD  CONSTRAINT [FK__bitacora___id_re__07C12930] FOREIGN KEY([id_reclamos_medicos])
REFERENCES [dbo].[reclamos_medicos] ([id])
GO
ALTER TABLE [dbo].[bitacora_reclamos_medicos] CHECK CONSTRAINT [FK__bitacora___id_re__07C12930]
GO
ALTER TABLE [dbo].[bitacora_reclamos_varios]  WITH CHECK ADD  CONSTRAINT [FK__bitacora___id_re__08B54D69] FOREIGN KEY([id_reclamos_varios])
REFERENCES [dbo].[reclamos_varios] ([id])
GO
ALTER TABLE [dbo].[bitacora_reclamos_varios] CHECK CONSTRAINT [FK__bitacora___id_re__08B54D69]
GO
ALTER TABLE [dbo].[cabina]  WITH CHECK ADD FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id])
GO
ALTER TABLE [dbo].[empresa]  WITH CHECK ADD FOREIGN KEY([id_pais])
REFERENCES [dbo].[pais] ([id])
GO
ALTER TABLE [dbo].[reclamo_auto]  WITH CHECK ADD  CONSTRAINT [FK__reclamo_a__id_au__7E37BEF6] FOREIGN KEY([id_auto_reclamo])
REFERENCES [dbo].[auto_reclamo] ([id])
GO
ALTER TABLE [dbo].[reclamo_auto] CHECK CONSTRAINT [FK__reclamo_a__id_au__7E37BEF6]
GO
ALTER TABLE [dbo].[reclamo_auto]  WITH CHECK ADD  CONSTRAINT [FK__reclamo_a__id_ca__01142BA1] FOREIGN KEY([id_cabina])
REFERENCES [dbo].[cabina] ([id])
GO
ALTER TABLE [dbo].[reclamo_auto] CHECK CONSTRAINT [FK__reclamo_a__id_ca__01142BA1]
GO
ALTER TABLE [dbo].[reclamo_auto]  WITH CHECK ADD  CONSTRAINT [FK__reclamo_a__id_es__05D8E0BE] FOREIGN KEY([id_estado])
REFERENCES [dbo].[estado] ([id])
GO
ALTER TABLE [dbo].[reclamo_auto] CHECK CONSTRAINT [FK__reclamo_a__id_es__05D8E0BE]
GO
ALTER TABLE [dbo].[reclamo_auto]  WITH CHECK ADD  CONSTRAINT [FK__reclamo_a__id_us__0F624AF8] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[reclamo_auto] CHECK CONSTRAINT [FK__reclamo_a__id_us__0F624AF8]
GO
ALTER TABLE [dbo].[reclamos_medicos]  WITH CHECK ADD  CONSTRAINT [FK__reclamos___id_ca__7F2BE32F] FOREIGN KEY([id_cabina])
REFERENCES [dbo].[cabina] ([id])
GO
ALTER TABLE [dbo].[reclamos_medicos] CHECK CONSTRAINT [FK__reclamos___id_ca__7F2BE32F]
GO
ALTER TABLE [dbo].[reclamos_medicos]  WITH CHECK ADD  CONSTRAINT [FK__reclamos___id_es__03F0984C] FOREIGN KEY([id_estado])
REFERENCES [dbo].[estado] ([id])
GO
ALTER TABLE [dbo].[reclamos_medicos] CHECK CONSTRAINT [FK__reclamos___id_es__03F0984C]
GO
ALTER TABLE [dbo].[reclamos_medicos]  WITH CHECK ADD  CONSTRAINT [FK__reclamos___id_re__0A9D95DB] FOREIGN KEY([id_reg_reclamos_medicos])
REFERENCES [dbo].[reg_reclamos_medicos] ([id])
GO
ALTER TABLE [dbo].[reclamos_medicos] CHECK CONSTRAINT [FK__reclamos___id_re__0A9D95DB]
GO
ALTER TABLE [dbo].[reclamos_medicos]  WITH CHECK ADD  CONSTRAINT [FK__reclamos___id_us__0D7A0286] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[reclamos_medicos] CHECK CONSTRAINT [FK__reclamos___id_us__0D7A0286]
GO
ALTER TABLE [dbo].[reclamos_varios]  WITH CHECK ADD  CONSTRAINT [FK__reclamos___id_ca__00200768] FOREIGN KEY([id_cabina])
REFERENCES [dbo].[cabina] ([id])
GO
ALTER TABLE [dbo].[reclamos_varios] CHECK CONSTRAINT [FK__reclamos___id_ca__00200768]
GO
ALTER TABLE [dbo].[reclamos_varios]  WITH CHECK ADD  CONSTRAINT [FK__reclamos___id_es__04E4BC85] FOREIGN KEY([id_estado])
REFERENCES [dbo].[estado] ([id])
GO
ALTER TABLE [dbo].[reclamos_varios] CHECK CONSTRAINT [FK__reclamos___id_es__04E4BC85]
GO
ALTER TABLE [dbo].[reclamos_varios]  WITH CHECK ADD  CONSTRAINT [FK__reclamos___id_re__0B91BA14] FOREIGN KEY([id_reg_reclamos_varios])
REFERENCES [dbo].[reg_reclamo_varios] ([id])
GO
ALTER TABLE [dbo].[reclamos_varios] CHECK CONSTRAINT [FK__reclamos___id_re__0B91BA14]
GO
ALTER TABLE [dbo].[reclamos_varios]  WITH CHECK ADD  CONSTRAINT [FK__reclamos___id_us__0E6E26BF] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[reclamos_varios] CHECK CONSTRAINT [FK__reclamos___id_us__0E6E26BF]
GO
ALTER TABLE [dbo].[sucursal]  WITH CHECK ADD FOREIGN KEY([id_empresa])
REFERENCES [dbo].[empresa] ([id])
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD FOREIGN KEY([id_cabina])
REFERENCES [dbo].[cabina] ([id])
GO
