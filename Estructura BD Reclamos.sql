USE [reclamos]
GO
/****** Object:  Table [dbo].[auto_reclamo]    Script Date: 22/03/2017 10:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[auto_reclamo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[placa] [nvarchar](30) NULL,
	[color] [nvarchar](50) NULL,
	[chasis] [nvarchar](50) NULL,
	[motor] [nvarchar](50) NULL,
	[propietario] [nvarchar](50) NULL,
	[marca] [nvarchar](50) NULL,
	[poliza] [nvarchar](50) NULL,
 CONSTRAINT [PK__auto_rec__3213E83FD1F35431] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bitacora_reclamo_auto]    Script Date: 22/03/2017 10:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacora_reclamo_auto](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](200) NOT NULL,
	[fecha_commit] [date] NULL,
	[hora_commit] [time](2) NULL,
	[id_reclamo] [int] NOT NULL,
 CONSTRAINT [PK__bitacora__3213E83F36F6BD55] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[bitacora_reclamos_varios]    Script Date: 22/03/2017 10:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bitacora_reclamos_varios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [nvarchar](300) NULL,
	[hora] [time](2) NULL,
	[fecha] [date] NULL,
	[id_reclamos_varios] [int] NOT NULL,
 CONSTRAINT [PK__bitacora__3213E83F230366D3] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[cabina]    Script Date: 22/03/2017 10:45:17 ******/
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
/****** Object:  Table [dbo].[empresa]    Script Date: 22/03/2017 10:45:17 ******/
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
/****** Object:  Table [dbo].[estado]    Script Date: 22/03/2017 10:45:17 ******/
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
/****** Object:  Table [dbo].[pais]    Script Date: 22/03/2017 10:45:17 ******/
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
/****** Object:  Table [dbo].[reclamo_auto]    Script Date: 22/03/2017 10:45:17 ******/
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
	[reportante] [varchar](50) NULL,
	[piloto] [varchar](50) NULL,
	[telefono] [varchar](20) NULL,
	[ajustador] [varchar](50) NULL,
	[version] [varchar](300) NULL,
	[id_auto_reclamo] [int] NOT NULL,
	[id_estado] [int] NOT NULL,
	[id_cabina] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[fecha_commit] [date] NULL,
	[hora_commit] [time](2) NULL,
 CONSTRAINT [PK__reclamo___3213E83FE455F747] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reclamos_varios]    Script Date: 22/03/2017 10:45:17 ******/
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
	[hora] [time](7) NULL,
	[fecha] [date] NULL,
	[reportante] [varchar](60) NOT NULL,
	[telefono] [varchar](30) NOT NULL,
	[ajustador] [varchar](50) NULL,
	[version] [varchar](300) NULL,
	[id_estado] [int] NOT NULL,
	[id_usuario] [int] NOT NULL,
	[id_reg_reclamos_varios] [int] NOT NULL,
	[id_cabina] [int] NOT NULL,
	[fecha_commit] [date] NOT NULL,
	[hora_commit] [time](2) NOT NULL,
 CONSTRAINT [PK__reclamos__3213E83F6CEDA402] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[reg_reclamo_varios]    Script Date: 22/03/2017 10:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[reg_reclamo_varios](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[poliza] [varchar](50) NULL,
	[nombre] [varchar](50) NULL,
	[apellido] [varchar](50) NULL,
	[cliente] [int] NULL,
	[status] [varchar](20) NULL,
	[tipo] [varchar](20) NULL,
	[direccion] [varchar](50) NULL,
	[ramo] [nvarchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[sucursal]    Script Date: 22/03/2017 10:45:17 ******/
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
/****** Object:  Table [dbo].[usuario]    Script Date: 22/03/2017 10:45:17 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[usuario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[id_usuario] [uniqueidentifier] NOT NULL,
	[id_cabina] [int] NOT NULL,
 CONSTRAINT [PK__usuario__3213E83FD4CC4916] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[bitacora_reclamo_auto] ADD  CONSTRAINT [DF_bitacora_reclamo_auto_fecha]  DEFAULT (getdate()) FOR [fecha_commit]
GO
ALTER TABLE [dbo].[bitacora_reclamo_auto] ADD  CONSTRAINT [DF_bitacora_reclamo_auto_hora]  DEFAULT (getdate()) FOR [hora_commit]
GO
ALTER TABLE [dbo].[bitacora_reclamos_varios] ADD  CONSTRAINT [DF_bitacora_reclamos_varios_hora]  DEFAULT (getdate()) FOR [hora]
GO
ALTER TABLE [dbo].[bitacora_reclamos_varios] ADD  CONSTRAINT [DF_bitacora_reclamos_varios_fecha]  DEFAULT (getdate()) FOR [fecha]
GO
ALTER TABLE [dbo].[reclamo_auto] ADD  CONSTRAINT [DF_reclamo_auto_fecha_commit]  DEFAULT (getdate()) FOR [fecha_commit]
GO
ALTER TABLE [dbo].[reclamo_auto] ADD  CONSTRAINT [DF_reclamo_auto_hora_commit]  DEFAULT (getdate()) FOR [hora_commit]
GO
ALTER TABLE [dbo].[reclamos_varios] ADD  CONSTRAINT [DF_reclamos_varios_fecha_commit]  DEFAULT (getdate()) FOR [fecha_commit]
GO
ALTER TABLE [dbo].[reclamos_varios] ADD  CONSTRAINT [DF_reclamos_varios_hora_commit]  DEFAULT (getdate()) FOR [hora_commit]
GO
ALTER TABLE [dbo].[bitacora_reclamo_auto]  WITH CHECK ADD  CONSTRAINT [FK__bitacora___id_re__4A8310C6] FOREIGN KEY([id_reclamo])
REFERENCES [dbo].[reclamo_auto] ([id])
GO
ALTER TABLE [dbo].[bitacora_reclamo_auto] CHECK CONSTRAINT [FK__bitacora___id_re__4A8310C6]
GO
ALTER TABLE [dbo].[cabina]  WITH CHECK ADD FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id])
GO
ALTER TABLE [dbo].[cabina]  WITH CHECK ADD FOREIGN KEY([id_sucursal])
REFERENCES [dbo].[sucursal] ([id])
GO
ALTER TABLE [dbo].[empresa]  WITH CHECK ADD FOREIGN KEY([id_pais])
REFERENCES [dbo].[pais] ([id])
GO
ALTER TABLE [dbo].[empresa]  WITH CHECK ADD FOREIGN KEY([id_pais])
REFERENCES [dbo].[pais] ([id])
GO
ALTER TABLE [dbo].[reclamo_auto]  WITH CHECK ADD  CONSTRAINT [FK__reclamo_a__id_au__41EDCAC5] FOREIGN KEY([id_auto_reclamo])
REFERENCES [dbo].[auto_reclamo] ([id])
GO
ALTER TABLE [dbo].[reclamo_auto] CHECK CONSTRAINT [FK__reclamo_a__id_au__41EDCAC5]
GO
ALTER TABLE [dbo].[reclamo_auto]  WITH CHECK ADD  CONSTRAINT [FK__reclamo_a__id_ca__43D61337] FOREIGN KEY([id_cabina])
REFERENCES [dbo].[cabina] ([id])
GO
ALTER TABLE [dbo].[reclamo_auto] CHECK CONSTRAINT [FK__reclamo_a__id_ca__43D61337]
GO
ALTER TABLE [dbo].[reclamo_auto]  WITH CHECK ADD  CONSTRAINT [FK__reclamo_a__id_es__47A6A41B] FOREIGN KEY([id_estado])
REFERENCES [dbo].[estado] ([id])
GO
ALTER TABLE [dbo].[reclamo_auto] CHECK CONSTRAINT [FK__reclamo_a__id_es__47A6A41B]
GO
ALTER TABLE [dbo].[reclamo_auto]  WITH CHECK ADD  CONSTRAINT [FK__reclamo_a__id_us__4E53A1AA] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[reclamo_auto] CHECK CONSTRAINT [FK__reclamo_a__id_us__4E53A1AA]
GO
ALTER TABLE [dbo].[reclamos_varios]  WITH CHECK ADD  CONSTRAINT [FK__reclamos___id_ca__42E1EEFE] FOREIGN KEY([id_cabina])
REFERENCES [dbo].[cabina] ([id])
GO
ALTER TABLE [dbo].[reclamos_varios] CHECK CONSTRAINT [FK__reclamos___id_ca__42E1EEFE]
GO
ALTER TABLE [dbo].[reclamos_varios]  WITH CHECK ADD  CONSTRAINT [FK__reclamos___id_es__46B27FE2] FOREIGN KEY([id_estado])
REFERENCES [dbo].[estado] ([id])
GO
ALTER TABLE [dbo].[reclamos_varios] CHECK CONSTRAINT [FK__reclamos___id_es__46B27FE2]
GO
ALTER TABLE [dbo].[reclamos_varios]  WITH CHECK ADD  CONSTRAINT [FK__reclamos___id_re__4B7734FF] FOREIGN KEY([id_reg_reclamos_varios])
REFERENCES [dbo].[reg_reclamo_varios] ([id])
GO
ALTER TABLE [dbo].[reclamos_varios] CHECK CONSTRAINT [FK__reclamos___id_re__4B7734FF]
GO
ALTER TABLE [dbo].[reclamos_varios]  WITH CHECK ADD  CONSTRAINT [FK__reclamos___id_us__4D5F7D71] FOREIGN KEY([id_usuario])
REFERENCES [dbo].[usuario] ([id])
GO
ALTER TABLE [dbo].[reclamos_varios] CHECK CONSTRAINT [FK__reclamos___id_us__4D5F7D71]
GO
ALTER TABLE [dbo].[sucursal]  WITH CHECK ADD FOREIGN KEY([id_empresa])
REFERENCES [dbo].[empresa] ([id])
GO
ALTER TABLE [dbo].[sucursal]  WITH CHECK ADD FOREIGN KEY([id_empresa])
REFERENCES [dbo].[empresa] ([id])
GO
ALTER TABLE [dbo].[usuario]  WITH CHECK ADD  CONSTRAINT [FK__usuario__id_cabi__38996AB5] FOREIGN KEY([id_cabina])
REFERENCES [dbo].[cabina] ([id])
GO
ALTER TABLE [dbo].[usuario] CHECK CONSTRAINT [FK__usuario__id_cabi__38996AB5]
GO
