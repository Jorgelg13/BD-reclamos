USE [reclamos]
GO
/****** Object:  StoredProcedure [dbo].[pa_reportesAutorizaciones]    Script Date: 4/04/2017 15:01:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[pa_reportesAutorizaciones]
@fechaInicio date,
@fechaFin date
as
SELECT
dbo.autorizaciones.reportante,
dbo.autorizaciones.id,
dbo.autorizaciones.tipo_consulta,
dbo.autorizaciones.tipo_estado,
dbo.autorizaciones.correo,
dbo.autorizaciones.telefono,
dbo.autorizaciones.metodo,
dbo.autorizaciones.hora_commit,
dbo.autorizaciones.fecha_commit,
dbo.autorizaciones.tipo_estado,
dbo.reg_reclamos_medicos.asegurado,
dbo.reg_reclamos_medicos.poliza,
dbo.reg_reclamos_medicos.ramo,
dbo.reg_reclamos_medicos.tipo,
dbo.reg_reclamos_medicos.clase,
dbo.reg_reclamos_medicos.ejecutivo,
dbo.reg_reclamos_medicos.aseguradora,
dbo.reg_reclamos_medicos.contratante,
dbo.cabina.nombre as cabina,
dbo.sucursal.nombre as sucursal,
dbo.empresa.nombre as empresa,
dbo.pais.nombre as pais,
dbo.usuario.nombre as nombre

FROM
dbo.autorizaciones
INNER JOIN dbo.reg_reclamos_medicos ON dbo.autorizaciones.id_reg_reclamos_medicos = dbo.reg_reclamos_medicos.id
INNER JOIN dbo.cabina ON dbo.autorizaciones.id_cabina = dbo.cabina.id
INNER JOIN dbo.sucursal ON dbo.cabina.id_sucursal = dbo.sucursal.id
INNER JOIN dbo.empresa ON dbo.sucursal.id_empresa = dbo.empresa.id
INNER JOIN dbo.pais ON dbo.empresa.id_pais = dbo.pais.id
INNER JOIN dbo.usuario ON dbo.usuario.id_cabina = dbo.cabina.id AND dbo.autorizaciones.id_usuario = dbo.usuario.id
where (fecha_commit between @fechaInicio and @fechaFin) and (autorizaciones.tipo_estado = 'Cerrado')
GO
/****** Object:  StoredProcedure [dbo].[pa_ReportesAutos]    Script Date: 4/04/2017 15:01:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
------------------------------------------
-------------procedimientos almacenados para reportes -------------------
CREATE procedure [dbo].[pa_ReportesAutos]
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
dbo.reclamo_auto.id_estado,
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

where (fecha between @fechaInicio and @fechaFin) and (reclamo_auto.id_estado = 2)
GO
/****** Object:  StoredProcedure [dbo].[pa_ReportesDaños]    Script Date: 4/04/2017 15:01:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---------------------------------------
--procedimientos daños--------------
CREATE procedure [dbo].[pa_ReportesDaños]
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
dbo.reclamos_varios.id_estado,
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
where (fecha between @fechaInicio and @fechaFin) and (reclamos_varios.id_estado = 2)

GO
/****** Object:  StoredProcedure [dbo].[pa_ReportesMedicos]    Script Date: 4/04/2017 15:01:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------------------------------------------------
--------Procediemientos reclamos Medicos---------------
CREATE procedure [dbo].[pa_ReportesMedicos]
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
dbo.reclamos_medicos.id_estado,
dbo.reg_reclamos_medicos.asegurado,
dbo.reg_reclamos_medicos.poliza,
dbo.reg_reclamos_medicos.ramo,
dbo.reg_reclamos_medicos.tipo,
dbo.reg_reclamos_medicos.clase,
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
where (fecha_commit between @fechaInicio and @fechaFin) and (reclamos_medicos.id_estado = 2)
GO
/****** Object:  Table [dbo].[auto_reclamo]    Script Date: 4/04/2017 15:01:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[auto_reclamo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[placa] [nvarchar](30) NULL,
	[color] [nvarchar](50) NULL,
	[chasis] [nvarchar](50) NULL,
	[motor] [nvarchar](50) NULL,
	[propietario] [varchar](100) NULL,
	[marca] [varchar](50) NULL,
	[poliza] [nvarchar](50) NULL,
	[ejecutivo] [nvarchar](100) NULL,
	[aseguradora] [nvarchar](100) NULL,
	[contratante] [nvarchar](100) NULL,
 CONSTRAINT [PK__auto_rec__3213E83F63F48AD6] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[autorizaciones]    Script Date: 4/04/2017 15:01:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[autorizaciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reportante] [nvarchar](100) NULL,
	[tipo_consulta] [nvarchar](75) NULL,
	[tipo_estado] [nvarchar](50) NULL,
	[correo] [nvarchar](100) NULL,
	[telefono] [nvarchar](30) NULL,
	[metodo] [nvarchar](30) NULL,
	[hora_commit] [time](0) NOT NULL,
	[fecha_commit] [date] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_cabina] [int] NOT NULL,
	[id_reg_reclamos_medicos] [int] NOT NULL,
 CONSTRAINT [PK__autoriza__3213E83F9D405D00] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bitacora_autorizaciones]    Script Date: 4/04/2017 15:01:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacora_autorizaciones](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](300) NULL,
	[estado] [nvarchar](50) NULL,
	[hora_commit] [time](0) NULL,
	[fecha_commit] [date] NULL,
	[id_autorizaciones] [int] NOT NULL,
 CONSTRAINT [PK__bitacora__3213E83FE1444352] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bitacora_reclamo_auto]    Script Date: 4/04/2017 15:01:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacora_reclamo_auto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](600) NOT NULL,
	[fecha_commit] [date] NULL,
	[hora_commit] [time](0) NULL,
	[id_reclamo] [int] NOT NULL,
 CONSTRAINT [PK__bitacora__3213E83F125B0078] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bitacora_reclamos_medicos]    Script Date: 4/04/2017 15:01:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacora_reclamos_medicos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](600) NULL,
	[hora_commit] [time](0) NULL,
	[fecha_commit] [date] NULL,
	[id_reclamos_medicos] [int] NOT NULL,
 CONSTRAINT [PK__bitacora__3213E83FC18A86E1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bitacora_reclamos_varios]    Script Date: 4/04/2017 15:01:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bitacora_reclamos_varios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](600) NULL,
	[hora_commit] [time](0) NULL,
	[fecha_commit] [date] NULL,
	[id_reclamos_varios] [int] NOT NULL,
 CONSTRAINT [PK__bitacora__3213E83FFCD6E1A2] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cabina]    Script Date: 4/04/2017 15:01:28 ******/
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
/****** Object:  Table [dbo].[empresa]    Script Date: 4/04/2017 15:01:28 ******/
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
/****** Object:  Table [dbo].[estado]    Script Date: 4/04/2017 15:01:28 ******/
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
/****** Object:  Table [dbo].[pais]    Script Date: 4/04/2017 15:01:28 ******/
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
/****** Object:  Table [dbo].[reclamo_auto]    Script Date: 4/04/2017 15:01:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[reclamo_auto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[boleta] [varchar](50) NULL,
	[titular] [varchar](150) NULL,
	[ubicacion] [varchar](300) NULL,
	[hora] [time](2) NULL,
	[fecha] [date] NULL,
	[reportante] [varchar](100) NULL,
	[piloto] [varchar](100) NULL,
	[telefono] [varchar](20) NULL,
	[ajustador] [varchar](100) NULL,
	[version] [varchar](500) NULL,
	[metodo] [nvarchar](20) NULL,
	[id_auto_reclamo] [int] NOT NULL,
	[id_estado] [int] NOT NULL,
	[id_cabina] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[hora_commit] [time](0) NULL,
	[fecha_commit] [date] NULL,
 CONSTRAINT [PK__reclamo___3213E83FC1C03F27] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reclamos_medicos]    Script Date: 4/04/2017 15:01:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reclamos_medicos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[reportante] [nvarchar](100) NULL,
	[tipo_consulta] [nvarchar](50) NULL,
	[correo] [nvarchar](100) NULL,
	[telefono] [nvarchar](50) NULL,
	[metodo] [nvarchar](20) NULL,
	[id_estado] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_cabina] [int] NOT NULL,
	[id_reg_reclamos_medicos] [int] NOT NULL,
	[hora_commit] [time](0) NULL,
	[fecha_commit] [date] NULL,
 CONSTRAINT [PK__reclamos__3213E83F430D84CD] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[reclamos_varios]    Script Date: 4/04/2017 15:01:28 ******/
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
	[ubicacion] [varchar](200) NULL,
	[hora] [time](7) NULL,
	[fecha] [date] NULL,
	[reportante] [varchar](100) NOT NULL,
	[telefono] [varchar](30) NOT NULL,
	[ajustador] [varchar](100) NULL,
	[version] [varchar](500) NULL,
	[metodo] [nvarchar](20) NULL,
	[id_estado] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_reg_reclamos_varios] [int] NOT NULL,
	[id_cabina] [int] NOT NULL,
	[hora_commit] [time](0) NOT NULL,
	[fecha_commit] [date] NOT NULL,
 CONSTRAINT [PK__reclamos__3213E83F6211E1E8] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reg_reclamo_varios]    Script Date: 4/04/2017 15:01:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[reg_reclamo_varios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[poliza] [varchar](50) NULL,
	[nombre] [varchar](100) NULL,
	[apellido] [varchar](70) NULL,
	[cliente ] [int] NULL,
	[status] [varchar](20) NULL,
	[tipo] [varchar](20) NULL,
	[direccion] [varchar](150) NULL,
	[ramo] [nvarchar](20) NULL,
	[ejecutivo] [nvarchar](100) NULL,
	[aseguradora] [nvarchar](100) NULL,
	[contratante] [nvarchar](100) NULL,
 CONSTRAINT [PK__reg_recl__3213E83F4C0D1AE7] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reg_reclamos_medicos]    Script Date: 4/04/2017 15:01:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[reg_reclamos_medicos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[asegurado] [nvarchar](100) NULL,
	[poliza] [nvarchar](50) NULL,
	[ramo] [nvarchar](20) NULL,
	[tipo] [nvarchar](20) NULL,
	[clase] [nvarchar](20) NULL,
	[ejecutivo] [nvarchar](100) NULL,
	[aseguradora] [nvarchar](100) NULL,
	[contratante] [nvarchar](100) NULL,
 CONSTRAINT [PK__reg_recl__3213E83F3B0DAF85] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[sucursal]    Script Date: 4/04/2017 15:01:28 ******/
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
/****** Object:  Table [dbo].[usuario]    Script Date: 4/04/2017 15:01:28 ******/
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
/****** Object:  Table [dbo].[ViewBusquedaAuto]    Script Date: 4/04/2017 15:01:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ViewBusquedaAuto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ramo] [nvarchar](20) NULL,
	[poliza] [nvarchar](50) NULL,
	[vigi] [date] NULL,
	[vigf] [date] NULL,
	[nombre] [nvarchar](50) NULL,
	[color] [nvarchar](50) NULL,
	[gst_nombre] [nvarchar](100) NULL,
	[contratante] [nvarchar](100) NULL,
	[motor] [nvarchar](50) NULL,
	[chasis] [nvarchar](50) NULL,
	[marca] [nvarchar](50) NULL,
	[placa] [nvarchar](50) NULL,
	[solicitud] [nvarchar](20) NULL,
	[secart] [nvarchar](20) NULL,
	[modelo] [nvarchar](20) NULL,
	[valorauto] [nvarchar](50) NULL,
	[propietario] [nvarchar](100) NULL,
	[estado] [nvarchar](20) NULL,
 CONSTRAINT [PK_ViewBusquedaAuto] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vistaReclamosDaños]    Script Date: 4/04/2017 15:01:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vistaReclamosDaños](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[poliza] [nvarchar](50) NULL,
	[ramo] [nvarchar](20) NULL,
	[vigi] [date] NULL,
	[vigf] [date] NULL,
	[gst_nombre] [nvarchar](100) NULL,
	[nombre] [nvarchar](100) NULL,
	[contratante] [nvarchar](100) NULL,
	[cliente] [nvarchar](100) NULL,
	[status] [nvarchar](20) NULL,
	[apellido] [nvarchar](50) NULL,
	[tipo] [nvarchar](20) NULL,
	[direccion] [nvarchar](200) NULL,
	[NombreCliente] [nvarchar](100) NULL,
 CONSTRAINT [PK_vistaReclamosDaños] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[vistaReclamosMedicos]    Script Date: 4/04/2017 15:01:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vistaReclamosMedicos](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[ramo] [nvarchar](20) NULL,
	[poliza] [nvarchar](20) NULL,
	[tipo] [nvarchar](20) NULL,
	[clase] [nvarchar](20) NULL,
	[asegurado] [nvarchar](100) NULL,
	[nombre] [nvarchar](100) NULL,
	[gst_nombre] [nvarchar](100) NULL,
	[contratante] [nvarchar](100) NULL,
	[vigi] [date] NULL,
	[vigf] [date] NULL,
 CONSTRAINT [PK_vistaReclamosMedicos] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[autorizaciones] ADD  CONSTRAINT [DF_autorizaciones_hora_commit]  DEFAULT (getdate()) FOR [hora_commit]
GO
ALTER TABLE [dbo].[autorizaciones] ADD  CONSTRAINT [DF_autorizaciones_fecha_commit]  DEFAULT (getdate()) FOR [fecha_commit]
GO
ALTER TABLE [dbo].[bitacora_autorizaciones] ADD  CONSTRAINT [DF_bitacora_autorizaciones_hora_commit]  DEFAULT (getdate()) FOR [hora_commit]
GO
ALTER TABLE [dbo].[bitacora_autorizaciones] ADD  CONSTRAINT [DF_bitacora_autorizaciones_fecha_commit]  DEFAULT (getdate()) FOR [fecha_commit]
GO
ALTER TABLE [dbo].[bitacora_reclamo_auto] ADD  CONSTRAINT [DF_bitacora_reclamo_auto_fecha_commit]  DEFAULT (getdate()) FOR [fecha_commit]
GO
ALTER TABLE [dbo].[bitacora_reclamo_auto] ADD  CONSTRAINT [DF_bitacora_reclamo_auto_hora_commit]  DEFAULT (getdate()) FOR [hora_commit]
GO
ALTER TABLE [dbo].[bitacora_reclamos_medicos] ADD  CONSTRAINT [DF_bitacora_reclamos_medicos_hora_commit]  DEFAULT (getdate()) FOR [hora_commit]
GO
ALTER TABLE [dbo].[bitacora_reclamos_medicos] ADD  CONSTRAINT [DF_bitacora_reclamos_medicos_fecha_commit]  DEFAULT (getdate()) FOR [fecha_commit]
GO
ALTER TABLE [dbo].[bitacora_reclamos_varios] ADD  CONSTRAINT [DF_bitacora_reclamos_varios_hora_commit]  DEFAULT (getdate()) FOR [hora_commit]
GO
ALTER TABLE [dbo].[bitacora_reclamos_varios] ADD  CONSTRAINT [DF_bitacora_reclamos_varios_fecha_commit]  DEFAULT (getdate()) FOR [fecha_commit]
GO
ALTER TABLE [dbo].[reclamo_auto] ADD  CONSTRAINT [DF_reclamo_auto_hora_commit]  DEFAULT (getdate()) FOR [hora_commit]
GO
ALTER TABLE [dbo].[reclamo_auto] ADD  CONSTRAINT [DF_reclamo_auto_fecha_commit]  DEFAULT (getdate()) FOR [fecha_commit]
GO
ALTER TABLE [dbo].[reclamos_medicos] ADD  CONSTRAINT [DF_reclamos_medicos_hora_commit]  DEFAULT (getdate()) FOR [hora_commit]
GO
ALTER TABLE [dbo].[reclamos_medicos] ADD  CONSTRAINT [DF_reclamos_medicos_fecha_commit]  DEFAULT (getdate()) FOR [fecha_commit]
GO
ALTER TABLE [dbo].[reclamos_varios] ADD  CONSTRAINT [DF_reclamos_varios_hora_commit]  DEFAULT (getdate()) FOR [hora_commit]
GO
ALTER TABLE [dbo].[reclamos_varios] ADD  CONSTRAINT [DF_reclamos_varios_fecha_commit]  DEFAULT (getdate()) FOR [fecha_commit]
GO
ALTER TABLE [dbo].[autorizaciones]  WITH CHECK ADD  CONSTRAINT [FK__autorizac__id_ca__30F848ED] FOREIGN KEY([id_cabina])
REFERENCES [dbo].[cabina] ([id])
GO
ALTER TABLE [dbo].[autorizaciones] CHECK CONSTRAINT [FK__autorizac__id_ca__30F848ED]
GO
ALTER TABLE [dbo].[autorizaciones]  WITH CHECK ADD  CONSTRAINT [FK__autorizac__id_re__3D5E1FD2] FOREIGN KEY([id_reg_reclamos_medicos])
REFERENCES [dbo].[reg_reclamos_medicos] ([id])
GO
ALTER TABLE [dbo].[autorizaciones] CHECK CONSTRAINT [FK__autorizac__id_re__3D5E1FD2]
GO
ALTER TABLE [dbo].[autorizaciones]  WITH CHECK ADD  CONSTRAINT [FK__autorizac__id_us__412EB0B6] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[autorizaciones] CHECK CONSTRAINT [FK__autorizac__id_us__412EB0B6]
GO
ALTER TABLE [dbo].[bitacora_autorizaciones]  WITH CHECK ADD  CONSTRAINT [FK__bitacora___id_au__2F10007B] FOREIGN KEY([id_autorizaciones])
REFERENCES [dbo].[autorizaciones] ([id])
GO
ALTER TABLE [dbo].[bitacora_autorizaciones] CHECK CONSTRAINT [FK__bitacora___id_au__2F10007B]
GO
ALTER TABLE [dbo].[bitacora_reclamo_auto]  WITH CHECK ADD  CONSTRAINT [FK__bitacora___id_re__3C69FB99] FOREIGN KEY([id_reclamo])
REFERENCES [dbo].[reclamo_auto] ([id])
GO
ALTER TABLE [dbo].[bitacora_reclamo_auto] CHECK CONSTRAINT [FK__bitacora___id_re__3C69FB99]
GO
ALTER TABLE [dbo].[bitacora_reclamos_medicos]  WITH CHECK ADD  CONSTRAINT [FK__bitacora___id_re__3A81B327] FOREIGN KEY([id_reclamos_medicos])
REFERENCES [dbo].[reclamos_medicos] ([id])
GO
ALTER TABLE [dbo].[bitacora_reclamos_medicos] CHECK CONSTRAINT [FK__bitacora___id_re__3A81B327]
GO
ALTER TABLE [dbo].[bitacora_reclamos_varios]  WITH CHECK ADD  CONSTRAINT [FK__bitacora___id_re__47DBAE45] FOREIGN KEY([id_reclamos_varios])
REFERENCES [dbo].[reclamos_varios] ([id])
GO
ALTER TABLE [dbo].[bitacora_reclamos_varios] CHECK CONSTRAINT [FK__bitacora___id_re__47DBAE45]
GO
ALTER TABLE [dbo].[cabina]  WITH CHECK ADD FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id])
GO
ALTER TABLE [dbo].[empresa]  WITH CHECK ADD FOREIGN KEY([id_pais])
REFERENCES [dbo].[pais] ([id])
GO
ALTER TABLE [dbo].[reclamo_auto]  WITH CHECK ADD  CONSTRAINT [FK__reclamo_a__id_au__300424B4] FOREIGN KEY([id_auto_reclamo])
REFERENCES [dbo].[auto_reclamo] ([id])
GO
ALTER TABLE [dbo].[reclamo_auto] CHECK CONSTRAINT [FK__reclamo_a__id_au__300424B4]
GO
ALTER TABLE [dbo].[reclamo_auto]  WITH CHECK ADD  CONSTRAINT [FK__reclamo_a__id_ca__33D4B598] FOREIGN KEY([id_cabina])
REFERENCES [dbo].[cabina] ([id])
GO
ALTER TABLE [dbo].[reclamo_auto] CHECK CONSTRAINT [FK__reclamo_a__id_ca__33D4B598]
GO
ALTER TABLE [dbo].[reclamo_auto]  WITH CHECK ADD  CONSTRAINT [FK__reclamo_a__id_es__38996AB5] FOREIGN KEY([id_estado])
REFERENCES [dbo].[estado] ([id])
GO
ALTER TABLE [dbo].[reclamo_auto] CHECK CONSTRAINT [FK__reclamo_a__id_es__38996AB5]
GO
ALTER TABLE [dbo].[reclamo_auto]  WITH CHECK ADD  CONSTRAINT [FK__reclamo_a__id_us__440B1D61] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[reclamo_auto] CHECK CONSTRAINT [FK__reclamo_a__id_us__440B1D61]
GO
ALTER TABLE [dbo].[reclamos_medicos]  WITH CHECK ADD  CONSTRAINT [FK__reclamos___id_ca__4E88ABD4] FOREIGN KEY([id_cabina])
REFERENCES [dbo].[cabina] ([id])
GO
ALTER TABLE [dbo].[reclamos_medicos] CHECK CONSTRAINT [FK__reclamos___id_ca__4E88ABD4]
GO
ALTER TABLE [dbo].[reclamos_medicos]  WITH CHECK ADD  CONSTRAINT [FK__reclamos___id_es__4F7CD00D] FOREIGN KEY([id_estado])
REFERENCES [dbo].[estado] ([id])
GO
ALTER TABLE [dbo].[reclamos_medicos] CHECK CONSTRAINT [FK__reclamos___id_es__4F7CD00D]
GO
ALTER TABLE [dbo].[reclamos_medicos]  WITH CHECK ADD  CONSTRAINT [FK__reclamos___id_re__3E52440B] FOREIGN KEY([id_reg_reclamos_medicos])
REFERENCES [dbo].[reg_reclamos_medicos] ([id])
GO
ALTER TABLE [dbo].[reclamos_medicos] CHECK CONSTRAINT [FK__reclamos___id_re__3E52440B]
GO
ALTER TABLE [dbo].[reclamos_medicos]  WITH CHECK ADD  CONSTRAINT [FK__reclamos___id_us__5165187F] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[reclamos_medicos] CHECK CONSTRAINT [FK__reclamos___id_us__5165187F]
GO
ALTER TABLE [dbo].[reclamos_varios]  WITH CHECK ADD  CONSTRAINT [FK__reclamos___id_ca__52593CB8] FOREIGN KEY([id_cabina])
REFERENCES [dbo].[cabina] ([id])
GO
ALTER TABLE [dbo].[reclamos_varios] CHECK CONSTRAINT [FK__reclamos___id_ca__52593CB8]
GO
ALTER TABLE [dbo].[reclamos_varios]  WITH CHECK ADD  CONSTRAINT [FK__reclamos___id_es__534D60F1] FOREIGN KEY([id_estado])
REFERENCES [dbo].[estado] ([id])
GO
ALTER TABLE [dbo].[reclamos_varios] CHECK CONSTRAINT [FK__reclamos___id_es__534D60F1]
GO
ALTER TABLE [dbo].[reclamos_varios]  WITH CHECK ADD  CONSTRAINT [FK__reclamos___id_re__5441852A] FOREIGN KEY([id_reg_reclamos_varios])
REFERENCES [dbo].[reg_reclamo_varios] ([id])
GO
ALTER TABLE [dbo].[reclamos_varios] CHECK CONSTRAINT [FK__reclamos___id_re__5441852A]
GO
ALTER TABLE [dbo].[reclamos_varios]  WITH CHECK ADD  CONSTRAINT [FK__reclamos___id_us__5535A963] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[reclamos_varios] CHECK CONSTRAINT [FK__reclamos___id_us__5535A963]
GO
ALTER TABLE [dbo].[sucursal]  WITH CHECK ADD FOREIGN KEY([id_empresa])
REFERENCES [dbo].[empresa] ([id])
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD FOREIGN KEY([id_cabina])
REFERENCES [dbo].[cabina] ([id])
GO
