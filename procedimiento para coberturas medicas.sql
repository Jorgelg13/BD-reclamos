USE [seguro]
GO
/****** Object:  StoredProcedure [dbo].[pa_buscar_beneficios_hospital_por_poliza_]    Script Date: 24/05/2017 14:50:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER procedure [dbo].[pa_buscar_beneficios_hospital_por_poliza_]
(
 @i_ramo                    int          = 0,
 @i_poliza                  varchar(40)  = null,
 @i_secren                  smallint     = 0,
 @o_valor_retorno           int          = 0     output
)
as

set nocount on
delete from hospitales_beneficios
--create table hospitales_beneficios
--(
--grupo           int,
--codCobertura    char(10),
--descripcion     varchar(150),
--clase1          varchar(150),
--clase2          varchar(150),
--clase3          varchar(150),
--clase4          varchar(150),
--clase5          varchar(150),
--clase6          varchar(150),
--clase7          varchar(150),
--clase8          varchar(150),
--clase9          varchar(150),
--clase10         varchar(150)
--)


--if not exists(select 1 from   beneficios_hospitalarios
--                       where  ramo     = @i_ramo
--                         and  poliza   = @i_poliza
--                         and  secren   = @i_secren)
--begin
--   select @o_valor_retorno  = -1
--   goto Salir
--end

------------------------------------------------MARRIOLA-------------------------------------------------
--se quitó la validación por ramo para que muestre juntas las coberturas de Vida y Gastos Medicos
---------------------------------------------------------------------------------------------------------

--If @i_ramo = 96 or @i_ramo = 97 or @i_ramo = 43 or @i_ramo = 7 or @i_ramo = 11
--   begin
	insert hospitales_beneficios
	select
		grupo,
		codCobertura,
		descripcion,
		clase1=convert(varchar(150),''),
		clase2=convert(varchar(150),''),
		clase3=convert(varchar(150),''),
		clase4=convert(varchar(150),''),
		clase5=convert(varchar(150),''),
		clase6=convert(varchar(150),''),
		clase7=convert(varchar(150),''),
		clase8=convert(varchar(150),''),
		clase9=convert(varchar(150),''),
		clase10=convert(varchar(150),'')
	from coberturas_hospitalarias
    where grupo = 12
 --  end

--If @i_ramo = 123 or @i_ramo = 9 or @i_ramo = 42 or @i_ramo = 95 or @i_ramo = 127
--   begin
	insert hospitales_beneficios
	select
		grupo,
		codCobertura,
		descripcion,
		clase1=convert(varchar(150),''),
		clase2=convert(varchar(150),''),
		clase3=convert(varchar(150),''),
		clase4=convert(varchar(150),''),
		clase5=convert(varchar(150),''),
		clase6=convert(varchar(150),''),
		clase7=convert(varchar(150),''),
		clase8=convert(varchar(150),''),
		clase9=convert(varchar(150),''),
		clase10=convert(varchar(150),'')
	from coberturas_hospitalarias
    where grupo <> 12
--   end

update hospitales_beneficios
  set descripcion = cat_descr_catalogo
from hospitales_beneficios a, seg_catalogo b
where tab_cod_tabla = 'seg_grupo_cob_beneficios'
  and a.grupo = convert(int,cat_cod_catalogo)
  and a.codCobertura = 0

update hospitales_beneficios
   set clase1=beneficio
from beneficios_hospitalarios a, hospitales_beneficios b
where  ramo          = @i_ramo
  and  poliza        = @i_poliza
  and  secren        = @i_secren  
  and  a.grupo        = b.grupo
  and  a.codcobertura = b.codcobertura
  and  clase          = 1

update hospitales_beneficios
   set clase2=beneficio
from beneficios_hospitalarios a, hospitales_beneficios b
where  ramo          = @i_ramo
  and  poliza        = @i_poliza
  and  secren        = @i_secren  
  and a.grupo        = b.grupo
  and a.codcobertura = b.codcobertura
  and clase          = 2

update hospitales_beneficios
   set clase3=beneficio
from beneficios_hospitalarios a, hospitales_beneficios b
where  ramo          = @i_ramo
  and  poliza        = @i_poliza
  and  secren        = @i_secren  
  and a.grupo        = b.grupo
  and a.codcobertura = b.codcobertura
  and clase          = 3

update hospitales_beneficios
   set clase4=beneficio
from beneficios_hospitalarios a, hospitales_beneficios b
where  ramo          = @i_ramo
  and  poliza        = @i_poliza
  and  secren        = @i_secren  
  and a.grupo        = b.grupo
  and a.codcobertura = b.codcobertura
  and clase          = 4

update hospitales_beneficios
   set clase5=beneficio
from beneficios_hospitalarios a, hospitales_beneficios b
where  ramo          = @i_ramo
  and  poliza        = @i_poliza
  and  secren        = @i_secren  
  and a.grupo        = b.grupo
  and a.codcobertura = b.codcobertura
  and clase          = 5

update hospitales_beneficios
   set clase6=beneficio
from beneficios_hospitalarios a, hospitales_beneficios b
where  ramo          = @i_ramo
  and  poliza        = @i_poliza
  and  secren        = @i_secren  
  and a.grupo        = b.grupo
  and a.codcobertura = b.codcobertura
  and clase          = 6

update hospitales_beneficios
   set clase7=beneficio
from beneficios_hospitalarios a, hospitales_beneficios b
where  ramo          = @i_ramo
  and  poliza        = @i_poliza
  and  secren        = @i_secren  
  and a.grupo        = b.grupo
  and a.codcobertura = b.codcobertura
  and clase          = 7

update hospitales_beneficios
   set clase8=beneficio
from beneficios_hospitalarios a, hospitales_beneficios b
where  ramo          = @i_ramo
  and  poliza        = @i_poliza
  and  secren        = @i_secren  
  and a.grupo        = b.grupo
  and a.codcobertura = b.codcobertura
  and clase          = 8

update hospitales_beneficios
   set clase9=beneficio
from beneficios_hospitalarios a, hospitales_beneficios b
where  ramo          = @i_ramo
  and  poliza        = @i_poliza
  and  secren        = @i_secren  
  and a.grupo        = b.grupo
  and a.codcobertura = b.codcobertura
  and clase          = 9

update hospitales_beneficios
   set clase10=beneficio
from beneficios_hospitalarios a, hospitales_beneficios b
where  ramo          = @i_ramo
  and  poliza        = @i_poliza
  and  secren        = @i_secren  
  and a.grupo        = b.grupo
  and a.codcobertura = b.codcobertura
  and clase          = 10

Salir:

   select  * from hospitales_beneficios

return

