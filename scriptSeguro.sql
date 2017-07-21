USE [seguro]
GO
/****** Object:  Table [dbo].[asegurado]    Script Date: 13/07/2017 09:07:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[asegurado](
	[ramo] [int] NOT NULL,
	[poliza] [varchar](30) NOT NULL,
	[secren] [int] NOT NULL,
	[secuencia] [int] NOT NULL,
	[certificado] [varchar](50) NOT NULL,
	[tipo] [char](1) NULL,
	[clase] [varchar](12) NULL,
	[parentesco] [char](2) NULL,
	[asegurado] [varchar](60) NULL,
	[edad_maxima] [tinyint] NULL,
	[suma_asegurada] [float] NULL,
	[suma_asegurada_myda] [float] NULL,
	[suma_asegurada_dental] [float] NULL,
	[suma_asegurada_vida] [float] NULL,
	[fecha_incluido] [datetime] NULL,
	[fecha_eliminacion] [datetime] NULL,
	[fecha_vence_plan] [datetime] NULL,
	[monto_vida] [float] NULL,
	[monto_itp] [float] NULL,
	[monto_mda] [float] NULL,
	[valor_monto_vida] [float] NULL,
	[valor_monto_itp] [float] NULL,
	[valor_monto_mda] [float] NULL,
	[monto_solo] [float] NULL,
	[monto_dependiente] [float] NULL,
	[monto_familiar] [float] NULL,
	[itbm] [bit] NULL,
	[impuestosalud] [float] NULL,
	[ajuste_vida] [float] NULL,
	[ajuste_salud] [float] NULL,
	[sexo] [char](1) NULL,
	[fechanac] [datetime] NULL,
	[status] [varchar](15) NULL,
	[fechareg] [datetime] NULL,
	[usuario] [varchar](20) NULL,
	[categoriasalud] [char](1) NULL,
	[plansalud] [char](10) NULL,
	[tarifa1] [float] NULL,
	[tarifa2] [float] NULL,
	[tarifa3] [float] NULL,
	[numeroempleado] [varchar](20) NULL,
	[centrodecosto] [varchar](50) NULL,
	[vip] [bit] NULL,
	[tarifa4] [float] NULL,
	[suma_aseguradaopc] [float] NULL,
	[monto_mdaopc] [float] NULL,
	[tarifa5] [float] NULL,
	[monto_accpersonales] [float] NULL,
	[monto_conyuge] [float] NULL,
	[monto_otros] [float] NULL,
	[tarifa6] [float] NULL,
	[cedula] [varchar](20) NULL,
	[filial] [varchar](50) NULL,
	[tipo_cuenta] [nchar](2) NULL,
	[numero_cuenta] [varchar](30) NULL,
	[comentario] [varchar](5000) NULL,
	[fecha_efectividad] [datetime] NULL,
	[fecha_revision] [datetime] NULL,
	[secuencia_principal] [int] NULL,
	[fechareg_incluido] [datetime] NULL,
	[fechareg_eliminacion] [datetime] NULL,
	[monto_otro1] [float] NULL,
	[monto_otro2] [float] NULL,
	[cia_carta_movto] [int] NULL,
	[no_carta_movto] [int] NULL,
	[fechareg_exclusion] [datetime] NULL,
	[numero_solicitud] [int] NULL,
	[itbm_vida] [float] NULL,
	[cobertura] [char](3) NULL,
	[tipo_cobertura] [char](1) NULL,
	[porc_vida] [float] NULL,
	[ruta_banco] [varchar](10) NULL,
	[tutor_beneficiario] [varchar](150) NULL,
	[pais] [int] NULL,
	[correlativo_certif] [varchar](50) NULL,
	[fecha_incluido2] [datetime] NULL,
	[fecha_eliminacion2] [datetime] NULL,
	[nombre_dirigido_a] [varchar](150) NULL,
	[apellido_dirigido_a] [varchar](150) NULL
) ON [PRIMARY]
SET ANSI_PADDING OFF
ALTER TABLE [dbo].[asegurado] ADD [correo1] [varchar](50) NULL
ALTER TABLE [dbo].[asegurado] ADD [correo2] [varchar](50) NULL
SET ANSI_PADDING ON
ALTER TABLE [dbo].[asegurado] ADD [segundo_nombre] [varchar](50) NULL
ALTER TABLE [dbo].[asegurado] ADD [apellido] [varchar](50) NULL
ALTER TABLE [dbo].[asegurado] ADD [segundo_apellido] [varchar](50) NULL
ALTER TABLE [dbo].[asegurado] ADD [decasada] [varchar](50) NULL
ALTER TABLE [dbo].[asegurado] ADD [forma_pago_salud_porc_oficina] [float] NULL
ALTER TABLE [dbo].[asegurado] ADD [forma_pago_salud_porc_asegurado] [float] NULL
ALTER TABLE [dbo].[asegurado] ADD [forma_pago_salud_fijo_oficina] [float] NULL
ALTER TABLE [dbo].[asegurado] ADD [forma_pago_salud_fijo_asegurado] [float] NULL
ALTER TABLE [dbo].[asegurado] ADD [forma_pago_vida_porc_oficina] [float] NULL
ALTER TABLE [dbo].[asegurado] ADD [forma_pago_vida_porc_asegurado] [float] NULL
ALTER TABLE [dbo].[asegurado] ADD [forma_pago_vida_fijo_oficina] [float] NULL
ALTER TABLE [dbo].[asegurado] ADD [forma_pago_vida_fijo_asegurado] [float] NULL
ALTER TABLE [dbo].[asegurado] ADD [telefono_personal] [varchar](30) NULL
ALTER TABLE [dbo].[asegurado] ADD [telefono_celular] [varchar](30) NULL
ALTER TABLE [dbo].[asegurado] ADD [Direccion] [varchar](200) NULL
ALTER TABLE [dbo].[asegurado] ADD [Apartado] [varchar](200) NULL
ALTER TABLE [dbo].[asegurado] ADD [TelOficina] [varchar](15) NULL
ALTER TABLE [dbo].[asegurado] ADD [CAhorro] [varchar](200) NULL
ALTER TABLE [dbo].[asegurado] ADD [Banco] [varchar](200) NULL
ALTER TABLE [dbo].[asegurado] ADD [CCorriente] [varchar](200) NULL
ALTER TABLE [dbo].[asegurado] ADD [Correo] [varchar](100) NULL
ALTER TABLE [dbo].[asegurado] ADD [Salario] [float] NULL
ALTER TABLE [dbo].[asegurado] ADD [Ocupacion] [varchar](50) NULL
ALTER TABLE [dbo].[asegurado] ADD [fechaServicio] [datetime] NULL
ALTER TABLE [dbo].[asegurado] ADD [fechaPermanente] [datetime] NULL
ALTER TABLE [dbo].[asegurado] ADD [fechaIncluye] [datetime] NULL
ALTER TABLE [dbo].[asegurado] ADD [vipasegurado] [bit] NULL
 CONSTRAINT [PK_asegurado] PRIMARY KEY NONCLUSTERED 
(
	[ramo] ASC,
	[poliza] ASC,
	[secren] ASC,
	[secuencia] ASC,
	[certificado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[autos]    Script Date: 13/07/2017 09:07:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[autos](
	[ramo] [smallint] NOT NULL,
	[solicitud] [int] NULL,
	[poliza] [nvarchar](30) NOT NULL,
	[secren] [int] NOT NULL,
	[secart] [int] NOT NULL,
	[vigi] [datetime] NULL,
	[vigf] [datetime] NULL,
	[valorauto] [float] NULL,
	[aaauto] [datetime] NULL,
	[acreedor] [char](10) NULL,
	[marca] [char](10) NULL,
	[color] [char](10) NULL,
	[uso] [char](10) NULL,
	[motor] [nvarchar](30) NULL,
	[chasis] [nvarchar](20) NULL,
	[nombrecond] [nvarchar](150) NULL,
	[apellidocond] [nvarchar](150) NULL,
	[placa] [nvarchar](15) NULL,
	[observacion] [varchar](5000) NULL,
	[fechareg] [datetime] NULL,
	[sexo] [char](1) NULL,
	[fechacond] [datetime] NULL,
	[cedulacond] [varchar](30) NULL,
	[puertas] [int] NULL,
	[cilindros] [int] NULL,
	[pasajeros] [int] NULL,
	[peso] [int] NULL,
	[descuento] [float] NULL,
	[VIN] [varchar](30) NULL,
	[vencimiento_placa] [datetime] NULL,
	[modelo] [int] NULL,
	[Contratante] [char](30) NULL,
	[DesctoBuenaExp] [float] NULL,
	[OrdenDesc] [char](1) NULL,
	[centro_costo] [varchar](50) NULL,
	[factura] [int] NULL,
	[abolladura] [int] NULL,
	[detalle_abolladura] [varchar](5000) NULL,
	[suma_extra] [int] NULL,
	[detalle_extra] [varchar](5000) NULL,
	[detalle_factura] [varchar](150) NULL,
	[TipoVehiculo] [int] NULL,
	[tipoBien] [int] NULL,
	[primaUnidad] [float] NULL,
	[propietario] [varchar](75) NULL,
	[beneficiarios] [varchar](150) NULL,
	[fecha_alta_baja] [datetime] NULL,
	[estado] [char](1) NULL,
	[facturar_a] [varchar](75) NULL,
	[fac_direccion] [varchar](300) NULL,
	[nit] [varchar](10) NULL,
	[codigo_postal] [varchar](10) NULL,
	[prima_neta] [float] NULL,
	[otros] [float] NULL,
	[gastos_emision] [float] NULL,
	[fraccionamiento] [float] NULL,
	[asisto] [float] NULL,
	[iva] [float] NULL,
	[prima_total] [float] NULL,
	[tarifa] [smallint] NULL,
	[poliza_anterior] [varchar](30) NULL,
	[codigon] [varchar](9) NULL,
	[inciso] [smallint] NULL,
	[inciso_cia] [varchar](10) NULL,
	[e_mail] [varchar](50) NULL,
	[cliente_no] [varchar](50) NULL,
 CONSTRAINT [PK_autos] PRIMARY KEY CLUSTERED 
(
	[ramo] ASC,
	[poliza] ASC,
	[secren] ASC,
	[secart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ciaseg]    Script Date: 13/07/2017 09:07:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ciaseg](
	[cia] [int] NOT NULL,
	[nombre] [nvarchar](50) NOT NULL,
	[tel1] [nvarchar](15) NULL,
	[tel2] [nvarchar](15) NULL,
	[contacto1] [nvarchar](40) NULL,
	[contacto2] [nvarchar](40) NULL,
	[direccion] [varchar](255) NULL,
	[fechareg] [smalldatetime] NULL,
	[fax] [nvarchar](15) NULL,
	[comision_cobro] [float] NULL,
	[ruc] [varchar](50) NULL,
	[nombre_corto] [varchar](50) NULL,
	[orden_cotizador] [smallint] NULL,
	[Factordp1] [float] NULL,
	[Factordp2] [float] NULL,
	[ImageUrl] [varchar](500) NULL,
	[imagePath] [varchar](250) NULL,
	[CiaBac] [int] NULL,
	[emisor_vida] [bit] NULL,
	[emisor_autos] [bit] NULL,
	[emisor_incendio] [bit] NULL,
	[emisor_ingreso_seguro] [bit] NULL,
	[imprime_sib] [char](1) NULL,
 CONSTRAINT [PK_ciaseg] PRIMARY KEY CLUSTERED 
(
	[cia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[clientes]    Script Date: 13/07/2017 09:07:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[clientes](
	[cliente] [numeric](18, 0) NOT NULL,
	[tipo] [varchar](10) NULL,
	[fechanac] [datetime] NULL,
	[cedula] [varchar](30) NULL,
	[ruc] [varchar](50) NULL,
	[nombre] [varchar](100) NULL,
	[apellido] [varchar](50) NULL,
	[decasada] [varchar](50) NULL,
	[relacion] [numeric](18, 0) NULL,
	[fechareg] [datetime] NULL,
	[sexo] [varchar](1) NULL,
	[fumador] [bit] NULL,
	[cuantos_fuma_x_dia] [smallint] NULL,
	[ingreso] [float] NULL,
	[ocupacion] [numeric](18, 0) NULL,
	[clas] [char](10) NULL,
	[gestor] [numeric](18, 0) NULL,
	[patrono] [varchar](50) NULL,
	[agencia] [numeric](18, 0) NULL,
	[Cod_Corredor] [varchar](6) NULL,
	[usuario] [varchar](20) NULL,
	[numero_qa] [varchar](25) NULL,
	[pasaporte] [varchar](30) NULL,
	[direccion] [varchar](255) NULL,
	[apartado] [varchar](25) NULL,
	[zona] [varchar](20) NULL,
	[hijos] [numeric](18, 0) NULL,
	[pasatiempos] [numeric](18, 0) NULL,
	[estado_civil] [numeric](18, 0) NULL,
	[vip] [bit] NULL,
	[corporativo] [char](1) NOT NULL,
	[posee_residencia] [char](1) NULL,
	[tiene_hipoteca] [char](1) NULL,
	[ejecutivo_cta] [int] NOT NULL,
	[frecuencia_ingerir_licor] [char](1) NULL,
	[estado] [char](1) NULL,
	[otra_ocupacion] [varchar](50) NULL,
	[piloto_privado] [bit] NULL,
	[piloto_comercial] [bit] NULL,
	[cargo] [varchar](50) NULL,
	[nacionalidad] [int] NULL,
	[hobbi] [smallint] NULL,
	[anotaciones] [varchar](5000) NULL,
	[postdata] [varchar](5000) NULL,
	[seguro_social] [varchar](15) NULL,
	[codigo_patrono] [int] NULL,
	[anotaciones2] [varchar](5000) NULL,
	[vencimiento_licencia] [datetime] NULL,
	[tipoempresa] [int] NULL,
	[carnet] [bit] NULL,
	[fecha_emision_carnet] [datetime] NULL,
	[segundo_nombre] [varchar](50) NULL,
	[segundo_apellido] [varchar](50) NULL,
	[tipo_cliente_vida] [varchar](1) NULL,
	[apostol] [bit] NULL,
	[clasificacion_corporativo] [varchar](5) NULL,
	[clasificacion_colectivo] [varchar](5) NULL,
	[vinculado] [numeric](18, 0) NULL,
	[FormatoRey] [varchar](25) NULL,
	[idioma_cartas] [char](1) NULL,
	[website] [varchar](50) NULL,
	[origen_cuenta] [int] NULL,
	[ventas_anuales] [float] NULL,
	[no_empleados] [int] NULL,
	[ingreso_estimado] [float] NULL,
	[otro_corredor] [char](3) NULL,
	[otro_corredor_maneja] [varchar](250) NULL,
	[pais_residencia] [numeric](18, 0) NULL,
	[profesion] [numeric](18, 0) NULL,
	[usuario_creo] [varchar](20) NULL,
	[casa_matriz_nombre] [varchar](100) NULL,
	[casa_matriz_direccion] [varchar](200) NULL,
	[casa_matriz_website] [varchar](50) NULL,
	[productor] [varchar](50) NULL,
	[comision_otrocorredor] [bit] NULL,
	[corresponsal] [int] NULL,
	[codigon] [varchar](9) NULL,
	[envio_quincena] [int] NULL,
	[referidox] [smallint] NULL,
	[referidox_detalle] [varchar](100) NULL,
	[paiscontacto] [smallint] NULL,
	[contactofuerapais] [varchar](100) NULL,
	[dv] [varchar](30) NULL,
	[usuario_web] [varchar](20) NULL,
	[persona_exp_politica] [char](1) NULL,
	[actua_nom_propio] [char](1) NULL,
	[primer_nombre_rl] [varchar](100) NULL,
	[segundo_nombre_rl] [varchar](100) NULL,
	[primer_apellido_rl] [varchar](100) NULL,
	[segundo_apellido_rl] [varchar](100) NULL,
	[apellido_casada_rl] [varchar](100) NULL,
	[dpi_rl] [varchar](50) NULL,
	[nacionalidad_rl] [int] NULL,
	[pasaporte_rl] [varchar](30) NULL,
	[fechanac_rl] [datetime] NULL,
	[pais_rl] [numeric](18, 0) NULL,
	[origen] [varchar](50) NULL,
	[referido] [varchar](50) NULL,
	[multiproducto] [bit] NULL,
	[ruta_autorizada] [bit] NULL,
	[campania] [varchar](50) NULL,
	[ruta] [varchar](15) NULL,
 CONSTRAINT [PK_clientes] PRIMARY KEY CLUSTERED 
(
	[cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cobeart]    Script Date: 13/07/2017 09:07:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cobeart](
	[ramo] [int] NOT NULL,
	[solicitud] [int] NULL,
	[poliza] [nvarchar](30) NOT NULL,
	[secren] [int] NOT NULL,
	[secart] [int] NOT NULL,
	[cober] [int] NOT NULL,
	[limite1] [float] NULL,
	[limite2] [float] NULL,
	[deducible] [float] NULL,
	[prima] [float] NULL,
	[fechareg] [smalldatetime] NULL,
	[porcentaje] [float] NULL,
	[limite_responsabilidad] [varchar](1000) NULL,
	[limite_dias] [int] NULL,
	[porcComision] [float] NULL,
	[general] [varchar](1) NULL,
 CONSTRAINT [PK_cobeart] PRIMARY KEY CLUSTERED 
(
	[ramo] ASC,
	[poliza] ASC,
	[secren] ASC,
	[secart] ASC,
	[cober] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cobertura]    Script Date: 13/07/2017 09:07:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cobertura](
	[ramo] [smallint] NOT NULL,
	[cobertura] [smallint] NOT NULL,
	[descr] [varchar](200) NULL,
	[Tercero] [bit] NOT NULL,
	[CodTradicional] [char](1) NULL,
	[desclarga] [varchar](200) NULL,
	[fechareg] [smalldatetime] NULL,
	[idcob] [int] NULL,
	[dpda] [char](1) NULL,
	[cotizador] [bit] NULL,
	[endoso_especial] [bit] NULL,
	[Web] [smallint] NULL,
	[EndosoPrincipal] [smallint] NULL,
	[tipo] [varchar](10) NULL,
	[aplica_bomberos] [varchar](1) NULL,
 CONSTRAINT [PK_cobertura_1] PRIMARY KEY CLUSTERED 
(
	[ramo] ASC,
	[cobertura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[gestores]    Script Date: 13/07/2017 09:07:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[gestores](
	[gst_codigo_gestor] [int] NOT NULL,
	[gst_nombre] [varchar](50) NOT NULL,
	[gst_directo] [varchar](8) NOT NULL,
	[puesto] [nvarchar](50) NULL,
	[gst_correo] [nvarchar](100) NULL,
	[usuario_commit] [nvarchar](50) NULL,
	[firma] [int] NULL,
	[estado] [int] NULL,
	[noi] [int] NULL,
	[usuario_sistema] [nvarchar](50) NULL,
	[id_clasificacion] [int] NULL,
	[telefono] [nvarchar](50) NULL,
	[movil] [nvarchar](50) NULL,
	[comision_nueva] [int] NULL,
	[comision_renovacion] [int] NULL,
	[comision_organica] [int] NULL,
	[no_credencial] [nchar](10) NULL,
	[nombre_corto] [nvarchar](150) NULL,
	[descripcion] [text] NULL,
	[impresora] [int] NULL,
	[limite_nueva] [decimal](18, 2) NULL,
	[limite_renovacion] [decimal](18, 2) NULL,
	[limite_organica] [decimal](18, 2) NULL,
	[ducret_nueva] [decimal](18, 2) NULL,
	[ducret_renovacion] [decimal](18, 2) NULL,
	[ducret_organica] [decimal](18, 2) NULL,
	[status] [varchar](15) NULL,
	[grupo_econo] [int] NULL,
	[id_departamento] [int] NULL,
 CONSTRAINT [PK_gestores] PRIMARY KEY CLUSTERED 
(
	[gst_codigo_gestor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[poliza]    Script Date: 13/07/2017 09:07:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[poliza](
	[solicitud] [numeric](18, 0) NOT NULL,
	[cia] [int] NOT NULL,
	[poliza] [nvarchar](30) NOT NULL,
	[ramo] [smallint] NOT NULL,
	[poliza_agencia] [varchar](30) NULL,
	[vigi] [datetime] NULL,
	[vigf] [datetime] NULL,
	[cliente] [numeric](18, 0) NOT NULL,
	[porccom] [float] NULL,
	[secren] [smallint] NOT NULL,
	[status] [nvarchar](15) NULL,
	[tipo] [nvarchar](6) NOT NULL,
	[endoso] [varchar](15) NULL,
	[prima] [float] NULL,
	[impuesto] [float] NULL,
	[total] [float] NULL,
	[primacobadi] [float] NULL,
	[fechacont] [datetime] NULL,
	[fechareg] [datetime] NULL,
	[formapago] [int] NULL,
	[bombero] [float] NULL,
	[Asisto] [float] NULL,
	[Fraccionamiento] [float] NULL,
	[frecuencia] [varchar](15) NULL,
	[Numeropago] [smallint] NULL,
	[descendoso] [varchar](5000) NULL,
	[saldo] [float] NOT NULL,
	[saldoimpuesto] [float] NOT NULL,
	[saldototal] [float] NOT NULL,
	[descuento] [float] NULL,
	[porcdescuento] [float] NULL,
	[corredor1] [int] NULL,
	[corredor2] [smallint] NULL,
	[corredor3] [smallint] NULL,
	[sumaaseg] [float] NULL,
	[sumPrima] [float] NULL,
	[sumImpuesto] [float] NULL,
	[sumTotal] [float] NULL,
	[porcimpuesto] [float] NULL,
	[Planes] [smallint] NULL,
	[ubicacion] [nvarchar](75) NULL,
	[fechabaja] [datetime] NULL,
	[renauto] [bit] NULL,
	[Causa] [int] NULL,
	[Tiposol] [int] NULL,
	[Agencia] [int] NULL,
	[Administracion] [bit] NULL,
	[secendoso] [int] NOT NULL,
	[facultativo] [bit] NULL,
	[declarativa] [bit] NULL,
	[coaseguro] [bit] NULL,
	[reemplaza] [varchar](50) NULL,
	[cobracia] [bit] NULL,
	[dir_tipo_direccion] [smallint] NULL,
	[bda_barriada] [smallint] NULL,
	[cda_ciudad] [smallint] NULL,
	[prv_provincia] [smallint] NULL,
	[dir_secuencia] [smallint] NULL,
	[codigo_postal] [varchar](10) NULL,
	[DescontarComision] [bit] NULL,
	[usuario] [varchar](20) NULL,
	[cobertura] [varchar](255) NULL,
	[ubicacion_2] [varchar](255) NULL,
	[interes_as] [varchar](255) NULL,
	[fechacancelacion] [datetime] NULL,
	[primacancelacion] [float] NULL,
	[fee] [float] NULL,
	[resultado] [char](3) NULL,
	[ejecutivo_cta] [int] NULL,
	[grupo_economico] [smallint] NULL,
	[contratante] [varchar](255) NULL,
	[cedula_contratante] [varchar](40) NULL,
	[sobretarifa] [float] NULL,
	[prima_vida] [float] NULL,
	[fecha_prox_vencto_beneficios] [datetime] NULL,
	[prima_mensual_vida_beneficios] [float] NULL,
	[fecha_entrega_acuse] [datetime] NULL,
	[usuario_registra_acuse] [varchar](30) NULL,
	[fecha_registro_acuse] [datetime] NULL,
	[fecha_prox_vencto_benef_reg] [datetime] NULL,
	[fecha_solicitud] [datetime] NULL,
	[gestor] [int] NULL,
	[ramo_reclamo] [char](1) NULL,
	[mostrar_web] [bit] NOT NULL,
	[fechaaniv] [datetime] NULL,
	[compania_descto_salario] [int] NULL,
	[sucursal] [int] NULL,
	[prestamo] [varchar](50) NULL,
	[tipo_plan_vida] [char](1) NULL,
	[prima_comisionable] [float] NULL,
	[porc_sobre_comision] [float] NULL,
	[prima_exceso] [float] NULL,
	[porc_comision_exceso] [float] NULL,
	[mes_declaracion] [int] NULL,
	[anio_declaracion] [int] NULL,
	[porccom_vida] [float] NULL,
	[valuacion] [float] NULL,
	[primaminembarque] [float] NULL,
	[sucursal_codigo] [varchar](10) NULL,
	[agencia_sucursal] [varchar](10) NULL,
	[anios_finan] [tinyint] NULL,
	[poliza_termino] [bit] NULL,
	[tarifa_emb_directo] [float] NULL,
	[porcdesc_tarjeta] [float] NULL,
	[descueto_tarjeta] [float] NULL,
	[cargo_x_manejo] [float] NULL,
	[itbms_cargo] [float] NULL,
	[saldo_cargo_manejo] [float] NULL,
	[cobracia_mora] [bit] NULL,
	[mora_cobro_especial] [bit] NULL,
	[resultado_renv] [varchar](5) NULL,
	[motivo_resultado] [varchar](100) NULL,
	[detalle_resultado] [varchar](8000) NULL,
	[fecha_resul_renv] [smalldatetime] NULL,
	[fuente_extranjera] [bit] NULL,
	[secartendoso] [int] NULL,
	[descrendosoprima] [varchar](100) NULL,
	[DeclaracionNo] [varchar](10) NULL,
	[resultado_aseg] [int] NULL,
	[fecha_camb_resp_cobro] [datetime] NULL,
	[primalocal_fact] [float] NULL,
	[comisioncobro_fact] [float] NULL,
	[factorcomision_fact] [float] NULL,
	[saldocomision_fact] [float] NULL,
	[cod_resul_cobracia] [smallint] NULL,
	[no_cobranza] [bit] NULL,
	[descto_tarjeta_endoso] [smallint] NULL,
	[porc_comision_basica] [float] NULL,
	[nombre_en_poliza] [varchar](150) NULL,
	[aviso_prima] [varchar](25) NULL,
	[RepAdministracion] [bit] NULL,
	[FechaRegAdmin] [datetime] NULL,
	[ComenAdmin] [char](10) NULL,
	[UsuarioAdmin] [varchar](50) NULL,
	[FechaSegAdmin] [datetime] NULL,
	[ComentarioGeneral] [varchar](2000) NULL,
	[SumPrimaVida] [float] NULL,
	[pais] [int] NULL,
	[copacreedor] [bit] NULL,
	[fecha_mensajeria] [datetime] NULL,
	[cia_reemplaza] [int] NULL,
	[imprimir_carta] [int] NULL,
	[imprimir_poliza] [int] NULL,
	[poliza_ART] [bit] NULL,
	[nom_recibido_acuse] [varchar](100) NULL,
	[ResulAutomatico] [smallint] NULL,
	[resultado_rescate] [varchar](5) NULL,
	[motivo_resul_rescate] [varchar](40) NULL,
	[detalle_resul_rescate] [varchar](8000) NULL,
	[fecha_resul_rescate] [smalldatetime] NULL,
	[TipoEmisor] [smallint] NULL,
	[imprimir_acreedor] [int] NULL,
	[resultado_rechAseg] [varchar](5) NULL,
	[motivo_resul_rechAseg] [varchar](40) NULL,
	[detalle_resul_rechAseg] [varchar](8000) NULL,
	[fecha_resul_rechAseg] [smalldatetime] NULL,
	[carta_renta] [bit] NULL,
	[venta_organica] [bit] NULL,
	[termino_definido] [bit] NULL,
	[Mostrar_mora_beneficios] [bit] NULL,
	[retira_oficina] [bit] NULL,
	[fecha_retiro_oficina] [datetime] NULL,
	[solicitud_reemplaza] [numeric](18, 0) NULL,
	[resultado_avanceobra] [varchar](5) NULL,
	[fecha_resul_avanceobra] [smalldatetime] NULL,
	[detalle_resul_avanceobra] [varchar](8000) NULL,
	[resultado_cheque] [varchar](5) NULL,
	[fecha_resul_cheque] [smalldatetime] NULL,
	[detalle_resul_cheque] [varchar](8000) NULL,
	[Per_Siniestralidad] [varchar](5) NULL,
	[Cla_Siniestralidad] [varchar](5) NULL,
	[identificador_unico] [varchar](50) NULL,
	[poliza_madre] [varchar](50) NULL,
	[emitida_ducruet] [bit] NULL,
	[devolucion_prima] [bit] NULL,
	[frontofficecol] [int] NULL,
	[backofficecol] [int] NULL,
	[CobAsegPlanGlobal] [bit] NULL,
	[obsv_cob_hosp] [varchar](8000) NULL,
	[usuario_facturo] [varchar](50) NULL,
	[usuario_revision] [varchar](50) NULL,
	[fecha_revision] [varchar](50) NULL,
	[documento_error] [bit] NULL,
	[fecha_usuario_revision] [datetime] NULL,
	[vendedor] [int] NULL,
	[cedpagador] [varchar](20) NULL,
	[pagador] [varchar](50) NULL,
	[devolucion_cheque] [bit] NULL,
	[fecha_bajadevolucion] [datetime] NULL,
	[usuario_bajadevolucion] [varchar](50) NULL,
	[desc_error] [varchar](100) NULL,
	[frecuencia_factura] [varchar](15) NULL,
	[id_men] [varchar](50) NULL,
	[enviar_email] [bit] NULL,
	[enviar_original] [bit] NULL,
	[usuario_solicito] [varchar](50) NULL,
	[fecha_edicion] [datetime] NULL,
	[resultado_llamada] [varchar](10) NULL,
	[motivo_resul_llamada] [varchar](40) NULL,
	[detalle_resul_llamada] [varchar](8000) NULL,
	[fecha_resul_llamada] [smalldatetime] NULL,
	[FacultativoEspecial] [bit] NULL,
	[prontopago] [bit] NULL,
	[suscriptor] [int] NULL,
	[vendedor_agencia] [int] NULL,
	[moneda_facturacion] [smallint] NULL,
	[valor_moneda_inicial] [float] NULL,
	[programa] [varchar](10) NULL,
	[autentica] [float] NULL,
	[num_factura] [varchar](50) NULL,
	[usuario_solicito_endoso] [varchar](25) NULL,
	[unidad_nueva] [int] NULL,
	[regional_pma] [bit] NULL,
	[regional_pais] [bit] NULL,
	[gasto_emision] [float] NULL,
	[factor_recargo_fracc] [float] NULL,
	[opcion_recargo_fracc] [float] NULL,
	[poliza_traspaso] [bit] NULL,
	[prima_traspaso_comisionable] [float] NULL,
	[financieras] [int] NULL,
	[flotilla_colaboradores] [int] NULL,
	[pagada_en_aseguradora] [int] NULL,
	[factura_anticipada] [int] NULL,
	[referidas_a_unity] [int] NULL,
	[referidas_de_unity] [int] NULL,
	[version_solicitud] [int] NULL,
	[prima_proyectada_anual_salud] [float] NULL,
	[prima_proyectada_anual_vida] [float] NULL,
	[ingreso_proyectado_anual_salud] [float] NULL,
	[ingreso_proyectado_anual_vida] [float] NULL,
	[ConservacionCart] [bit] NULL,
	[desc_breve_carta_endoso] [varchar](200) NULL,
	[fecha_vencimiento_contrato] [datetime] NULL,
	[meses_contrato] [int] NULL,
	[asunendoso] [varchar](200) NULL,
	[asignado] [int] NULL,
	[vigi_sg] [datetime] NULL,
	[hora_ini] [datetime] NULL,
	[nombramiento] [char](1) NULL,
	[venta_cruzada] [char](1) NULL,
	[venta_referida] [char](1) NULL,
	[varios_pagadores] [char](1) NULL,
	[hq] [varchar](50) NULL,
	[pais_hq] [varchar](50) NULL,
	[co] [varchar](50) NULL,
	[nombre_co] [varchar](50) NULL,
	[mail_co] [varchar](50) NULL,
	[co_hub] [varchar](50) NULL,
	[nombre_co_hub] [varchar](50) NULL,
	[mail_co_hub] [varchar](50) NULL,
	[pais_cg] [varchar](50) NULL,
	[colocacion] [varchar](50) NULL,
	[reasegurador] [varchar](50) NULL,
	[poliza_maestra] [varchar](50) NULL,
	[fee_cg] [varchar](50) NULL,
	[comision_cg] [varchar](50) NULL,
	[fee_cg_m] [decimal](18, 2) NULL,
	[comision_cg_m] [decimal](18, 2) NULL,
	[linea_de_negocio] [varchar](50) NULL,
	[comentarios_cg] [varchar](255) NULL,
 CONSTRAINT [PK_poliza] PRIMARY KEY CLUSTERED 
(
	[ramo] ASC,
	[poliza] ASC,
	[secren] ASC,
	[cliente] ASC,
	[tipo] ASC,
	[secendoso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ramos]    Script Date: 13/07/2017 09:07:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ramos](
	[ramo] [smallint] NOT NULL,
	[asociadocon] [smallint] NULL,
	[descr] [varchar](50) NULL,
	[impuesto] [bit] NOT NULL,
	[porcimpuesto] [float] NULL,
	[fechareg] [smalldatetime] NULL,
	[dano] [bit] NOT NULL,
	[IdRamo] [char](1) NULL,
	[declarativa] [bit] NULL,
	[porcGastosEmision] [float] NULL,
 CONSTRAINT [PK_ramos] PRIMARY KEY CLUSTERED 
(
	[ramo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[seg_catalogo]    Script Date: 13/07/2017 09:07:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[seg_catalogo](
	[tab_cod_tabla] [varchar](25) NOT NULL,
	[cat_cod_catalogo] [char](10) NOT NULL,
	[cat_descr_catalogo] [varchar](150) NOT NULL,
	[cat_estado] [char](1) NULL,
 CONSTRAINT [PK_seg_catalogo] PRIMARY KEY CLUSTERED 
(
	[tab_cod_tabla] ASC,
	[cat_cod_catalogo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[seg_marcas]    Script Date: 13/07/2017 09:07:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[seg_marcas](
	[marca] [int] NOT NULL,
	[descr_marca] [varchar](100) NOT NULL,
	[estatus] [char](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[marca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[seg_monedas]    Script Date: 13/07/2017 09:07:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[seg_monedas](
	[mnd_id] [smallint] NOT NULL,
	[mnd_moneda] [varchar](50) NULL,
	[mnd_simbolo] [varchar](5) NULL,
 CONSTRAINT [Llave_Primaria] PRIMARY KEY CLUSTERED 
(
	[mnd_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[asegurado] ADD  CONSTRAINT [DF_asegurado_cia_carta_motvo]  DEFAULT ((0)) FOR [cia_carta_movto]
GO
ALTER TABLE [dbo].[asegurado] ADD  CONSTRAINT [DF_asegurado_no_carta_movto]  DEFAULT ((0)) FOR [no_carta_movto]
GO
ALTER TABLE [dbo].[asegurado] ADD  CONSTRAINT [DF_asegurado_numero_solicitud]  DEFAULT ((0)) FOR [numero_solicitud]
GO
ALTER TABLE [dbo].[autos] ADD  CONSTRAINT [DF__autos__primaUnid__7C910454]  DEFAULT ((0)) FOR [primaUnidad]
GO
ALTER TABLE [dbo].[ciaseg] ADD  CONSTRAINT [DF_ciaseg_orden_cotizador]  DEFAULT ((0)) FOR [orden_cotizador]
GO
ALTER TABLE [dbo].[clientes] ADD  CONSTRAINT [DF_clientes_corporativo]  DEFAULT ('N') FOR [corporativo]
GO
ALTER TABLE [dbo].[clientes] ADD  CONSTRAINT [DF_clientes_estado]  DEFAULT ('A') FOR [estado]
GO
ALTER TABLE [dbo].[clientes] ADD  CONSTRAINT [DF_clientes_carnet]  DEFAULT ((0)) FOR [carnet]
GO
ALTER TABLE [dbo].[gestores] ADD  CONSTRAINT [DF_gestores_comision_nueva]  DEFAULT ((0)) FOR [comision_nueva]
GO
ALTER TABLE [dbo].[gestores] ADD  CONSTRAINT [DF_gestores_comision_renovacion]  DEFAULT ((0)) FOR [comision_renovacion]
GO
ALTER TABLE [dbo].[gestores] ADD  CONSTRAINT [DF_gestores_comision_organica]  DEFAULT ((0)) FOR [comision_organica]
GO
ALTER TABLE [dbo].[poliza] ADD  CONSTRAINT [DF_poliza_saldo]  DEFAULT ((0)) FOR [saldo]
GO
ALTER TABLE [dbo].[poliza] ADD  CONSTRAINT [DF_poliza_saldoimpuesto]  DEFAULT ((0)) FOR [saldoimpuesto]
GO
ALTER TABLE [dbo].[poliza] ADD  CONSTRAINT [DF_poliza_saldototal]  DEFAULT ((0)) FOR [saldototal]
GO
ALTER TABLE [dbo].[poliza] ADD  CONSTRAINT [DF_poliza_descuento]  DEFAULT ((0)) FOR [descuento]
GO
ALTER TABLE [dbo].[poliza] ADD  CONSTRAINT [DF_poliza_secendoso]  DEFAULT ((0)) FOR [secendoso]
GO
ALTER TABLE [dbo].[poliza] ADD  CONSTRAINT [DF_poliza_facultativo]  DEFAULT ((0)) FOR [facultativo]
GO
ALTER TABLE [dbo].[poliza] ADD  CONSTRAINT [DF_poliza_declarativa]  DEFAULT ((0)) FOR [declarativa]
GO
ALTER TABLE [dbo].[poliza] ADD  CONSTRAINT [DF_poliza_coaseguro]  DEFAULT ((0)) FOR [coaseguro]
GO
ALTER TABLE [dbo].[poliza] ADD  CONSTRAINT [DF_poliza_mostrar_web]  DEFAULT ((1)) FOR [mostrar_web]
GO
ALTER TABLE [dbo].[poliza] ADD  CONSTRAINT [DF_poliza_anios_finan]  DEFAULT ((0)) FOR [anios_finan]
GO
ALTER TABLE [dbo].[poliza] ADD  CONSTRAINT [DF_poliza_poliza_termino]  DEFAULT ((0)) FOR [poliza_termino]
GO
ALTER TABLE [dbo].[poliza] ADD  CONSTRAINT [DF_poliza_cobracia_mora]  DEFAULT ((0)) FOR [cobracia_mora]
GO
ALTER TABLE [dbo].[poliza] ADD  CONSTRAINT [DF_poliza_mora_cobro_especial]  DEFAULT ((0)) FOR [mora_cobro_especial]
GO
ALTER TABLE [dbo].[ramos] ADD  DEFAULT ((0)) FOR [porcGastosEmision]
GO
ALTER TABLE [dbo].[ciaseg]  WITH CHECK ADD  CONSTRAINT [FK_ciaseg_ciaseg] FOREIGN KEY([cia])
REFERENCES [dbo].[ciaseg] ([cia])
GO
ALTER TABLE [dbo].[ciaseg] CHECK CONSTRAINT [FK_ciaseg_ciaseg]
GO
