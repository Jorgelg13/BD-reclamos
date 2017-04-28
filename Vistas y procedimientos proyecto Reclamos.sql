--Primero crear una vista con el query que se usara para la busqueda de los datos
--que tiene un automovil para ello utilizo el siguiente query


 CREATE VIEW ViewBusquedaAuto
 AS 
 insert into [reclamos].[dbo].[ViewBusquedaAuto]
 SELECT  [ramo], t0.[poliza], t1.vigi, t1.vigf, t3.nombre, t6.cat_descr_catalogo as color, t2.gst_nombre, t4.nombre as contratante, [motor], [chasis], t5.descr_marca as marca, [placa], [solicitud], [secart], Year(aaauto) as modelo, [valorauto], [propietario], t1.status,t1.sumaaseg,t1.tipo,t4.nombre + ' '+ t4.apellido as asegurado
 FROM [autos] t0 inner join ( select max(secren) maxren, poliza, gestor,cia,vigi, vigf, contratante, cliente,sumaaseg, status,tipo
 from poliza where tipo !='endoso' group by poliza,gestor,cia,vigi, vigf,contratante,cliente,sumaaseg, status,tipo) t1 on t0.poliza = t1.poliza and t0.secren = t1.maxren 
 inner join gestores as t2 on t1.gestor = t2.gst_codigo_gestor
 inner join ciaseg as t3 on t1.cia = t3.cia
 inner join clientes as t4 on t1.cliente = t4.cliente
 inner join seg_marcas as t5 on t0.marca = t5.marca
 inner join (select cat_descr_catalogo, cat_cod_catalogo from seg_catalogo where tab_cod_tabla = 'seg_color_auto') t6 on t0.color = t6.cat_cod_catalogo


 create view viewCoberturasAutos
 as
 SELECT DISTINCT t3.descr, t0.placa, t2.limite1, t2.limite2, t2.deducible, t2.prima,t1.sumaaseg
 FROM [autos] t0 inner join ( select max(secren) maxren, poliza,sumaaseg from poliza where tipo ='poliza'  and status <> 'cancelada' and vigf >GETDATE() group by poliza,sumaaseg) t1 on t0.poliza = t1.poliza and t0.secren = t1.maxren
 inner join cobeart t2 on t2.secart = t0.secart and t2.poliza = t1.poliza and t2.secren = t1.maxren 
 inner join cobertura t3 on t3.cobertura= t2.cober and t3.ramo = 2 





---------------------------------------------------------------------------------------------------------------
-- para la busqueda de los reclamos para daños varios creo una vista con la siguiente estructura
-- donde viene todas las polizas de esos ramos vigentes

create view vistaReclamosDaños
as

insert into [reclamos].[dbo].[vistaReclamosDaños]
SELECT t0.poliza, t5.descr as ramo, t0.vigi, t0.vigf, t2.gst_nombre, t3.nombre,t4.nombre as contratante, t0.cliente, t0.status, t1.tipo, t1.direccion, t1.nombre + ' ' + t1.apellido as asegurado, t0.sumaaseg
FROM dbo.poliza AS t0 
INNER JOIN dbo.clientes AS t1 ON t1.cliente = t0.cliente 
INNER JOIN dbo.gestores AS t2 ON t0.gestor = t2.gst_codigo_gestor
INNER JOIN dbo.ciaseg AS t3 ON t0.cia = t3.cia
INNER JOIN clientes as t4 on t1.cliente = t4.cliente
INNER JOIN ramos as t5 on t0.ramo = t5.ramo
WHERE (t0.ramo NOT IN (2, 123, 7, 9))  AND (UPPER(t0.status) <> 'SOLICITUD') AND (UPPER(t0.tipo) = 'POLIZA')




--luego creo una vista para la busqueda de las coberturas de los reclamos de daños varios

create view busqCoberturasPolizasDaños
as
SELECT DISTINCT t4.descr, t0.poliza, t1.m, t3.secart, t3.limite1, t3.limite2, t3.deducible
FROM  dbo.poliza AS t0 INNER JOIN
(SELECT MAX(secren) AS m, poliza FROM dbo.poliza
GROUP BY poliza) AS t1 ON t0.poliza = t1.poliza AND t0.secren = t1.m AND t0.tipo = 'poliza' AND t0.status NOT IN ('solicitud') AND t0.ramo NOT IN (7, 9, 123, 2) INNER JOIN
dbo.ramos AS t2 ON t0.ramo = t2.ramo INNER JOIN
dbo.cobeart AS t3 ON t2.ramo = t3.ramo AND t0.secren = t3.secren AND t0.poliza = t3.poliza INNER JOIN
dbo.cobertura AS t4 ON t4.cobertura = t3.cober AND t2.ramo = t4.ramo



----------------------------------------------------------------------------------------------------------
----- query para busqueda de las polizas medicas------------------------


create view vistaReclamosMedicos
as
insert into [reclamos].[dbo].[vistaReclamosMedicos]

 select t0.ramo, t0.poliza, t0.tipo, t0.clase,t0.asegurado, t2.nombre, t3.gst_nombre,t4.nombre as contratante, t1.vigi, t1.vigf, t1.status, maxren from asegurado as t0 INNER JOIN 
( select max(secren) maxren, poliza, cia, gestor, vigi, vigf, cliente,status
 from poliza where ramo in (7,9,123) and tipo ='poliza' group by poliza,cia,gestor,vigi, vigf, cliente, status) t1 on t0.poliza = t1.poliza and t0.secren = t1.maxren 
 inner join ciaseg as t2 on t1.cia = t2.cia
 inner join gestores as t3 on t1.gestor = t3.gst_codigo_gestor 
 inner join clientes as t4 on t1.cliente = t4.cliente


----------------------------------------------------------------
-------------procedimientos almacenados para reportes -------------------
create procedure pa_ReportesAutos
@fechaInicio date,
@fechaFin date
as
SELECT
dbo.reclamo_auto.id,
dbo.auto_reclamo.poliza,
dbo.auto_reclamo.asegurado,
dbo.auto_reclamo.placa,
dbo.auto_reclamo.chasis,
dbo.auto_reclamo.motor,
dbo.auto_reclamo.marca,
dbo.auto_reclamo.modelo,
dbo.auto_reclamo.color,
dbo.auto_reclamo.propietario,
dbo.auto_reclamo.ejecutivo,
dbo.auto_reclamo.aseguradora,
dbo.auto_reclamo.contratante,
dbo.auto_reclamo.estado_poliza,
dbo.reclamo_auto.boleta,
dbo.reclamo_auto.titular,
dbo.reclamo_auto.ubicacion,
dbo.reclamo_auto.hora,
dbo.reclamo_auto.fecha,
dbo.reclamo_auto.reportante,
dbo.reclamo_auto.piloto,
dbo.reclamo_auto.edad,
dbo.reclamo_auto.telefono,
dbo.reclamo_auto.ajustador,
dbo.reclamo_auto.version,
dbo.reclamo_auto.hora_commit,
dbo.reclamo_auto.fecha_commit,
dbo.reclamo_auto.estado_unity,
dbo.reclamo_auto.usuario_unity,
dbo.reclamo_auto.fecha_cierre,
dbo.reclamo_auto.hora_cierre,
dbo.cabina.nombre as cabina,
dbo.sucursal.nombre as sucursal,
dbo.empresa.nombre as empresa,
dbo.pais.nombre as pais,
dbo.usuario.nombre as usuario

FROM
dbo.auto_reclamo
INNER JOIN dbo.reclamo_auto ON dbo.reclamo_auto.id_auto_reclamo = dbo.auto_reclamo.id
INNER JOIN dbo.cabina ON dbo.reclamo_auto.id_cabina = dbo.cabina.id
INNER JOIN dbo.sucursal ON dbo.cabina.id_sucursal = dbo.sucursal.id
INNER JOIN dbo.empresa ON dbo.sucursal.id_empresa = dbo.empresa.id
INNER JOIN dbo.pais ON dbo.empresa.id_pais = dbo.pais.id
INNER JOIN dbo.usuario ON dbo.usuario.id_cabina = dbo.cabina.id AND dbo.reclamo_auto.id_usuario = dbo.usuario.id
where (fecha_cierre between @fechaInicio and @fechaFin ) and (reclamo_auto.id_estado = 2)


----------------------------------------------------------------
-------------procedimientos almacenados para reportes de reclamos no cerrados -------------------
create procedure pa_ReportesAutosPendientes
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

where (fecha between @fechaInicio and @fechaFin ) and (reclamo_auto.id_estado = 1)


---------------------------------------
--procedimientos daños--------------
create procedure pa_ReportesDaños
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
dbo.reg_reclamo_varios.asegurado,
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




---------------------------------------
--procedimientos daños--------------
create procedure pa_ReportesDañosPendientes
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
where (fecha between @fechaInicio and @fechaFin) and (reclamos_varios.id_estado = 1)


-------------------------------------------------------
--------Procediemientos reclamos Medicos---------------
create procedure pa_ReportesMedicos
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



-------------------------------------------------------
--------Procediemientos reclamos Medicos---------------
create procedure pa_ReportesMedicosPendientes
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
where (fecha_commit between @fechaInicio and @fechaFin) and (reclamos_medicos.id_estado = 1)







------------------------------------------------------------
---------------Procedimiento autorizaciones------------------
create procedure pa_reportesAutorizacionesAbiertas
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
where (fecha_commit between @fechaInicio and @fechaFin) and (autorizaciones.tipo_estado != 'Cerrado')













SELECT
reclamo_auto.usuario_unity,
auto_reclamo.poliza,
auto_reclamo.placa,
auto_reclamo.marca,
auto_reclamo.color,
auto_reclamo.modelo,
auto_reclamo.chasis,
auto_reclamo.motor,
auto_reclamo.propietario,
auto_reclamo.ejecutivo,
auto_reclamo.aseguradora,
auto_reclamo.contratante,
auto_reclamo.estado_poliza,
reclamo_auto.boleta,
reclamo_auto.titular,
reclamo_auto.hora,
reclamo_auto.fecha,
reclamo_auto.ubicacion,
reclamo_auto.reportante,
reclamo_auto.piloto,
reclamo_auto.edad,
reclamo_auto.telefono,
reclamo_auto.ajustador,
reclamo_auto.usuario_unity,
cabina.nombre as cabina,
sucursal.nombre as sucursal,
empresa.nombre as empresa,
pais.nombre as pais,
usuario.nombre as usuario

FROM
dbo.auto_reclamo
INNER JOIN reclamo_auto ON reclamo_auto.id_auto_reclamo = auto_reclamo.id
INNER JOIN cabina ON reclamo_auto.id_cabina = cabina.id
INNER JOIN sucursal ON cabina.id_sucursal = sucursal.id
INNER JOIN empresa ON sucursal.id_empresa = empresa.id
INNER JOIN pais ON empresa.id_pais = pais.id
INNER JOIN usuario ON usuario.id_cabina = cabina.id AND reclamo_auto.id_usuario = usuario.id



---- buscar clientes por poliza o nombre vista para el celular

create View vistaBusquedaPolizaMovil
as
SELECT t0.tipo as tipoPol, t0.poliza,t0.ramo as NumRamo, t5.descr as ramo, t0.vigi, t0.vigf, t2.gst_nombre, t3.nombre as aseguradora,t4.nombre as contratante, t0.cliente, t0.status, t1.nombre + ' '+ t1.apellido as NombreCliente,  t1.tipo, t1.direccion, t0.sumaaseg
FROM dbo.poliza AS t0 INNER JOIN dbo.clientes AS t1 ON t1.cliente = t0.cliente INNER JOIN
dbo.gestores AS t2 ON t0.gestor = t2.gst_codigo_gestor
INNER JOIN dbo.ciaseg AS t3 ON t0.cia = t3.cia
INNER JOIN clientes as t4 on t1.cliente = t4.cliente
INNER JOIN ramos as t5 on t0.ramo = t5.ramo
WHERE(t0.tipo = 'POLIZA') OR (t0.tipo like '%' +'Solici'+ '%')

--coberturas para autos
create view vistaBusquedaMovilCoberturaAuto 
as
 SELECT DISTINCT t3.descr,t0.poliza, t0.placa,t0.chasis,t0.motor,t6.cat_descr_catalogo as color, t5.descr_marca as marca,Year(aaauto) as modelo, t2.limite1, t2.limite2, t2.deducible, t2.prima,t1.sumaaseg
 FROM [autos] t0 inner join ( select max(secren) maxren, poliza,sumaaseg from poliza where tipo ='poliza'  and status <> 'cancelada' and vigf >GETDATE() group by poliza,sumaaseg) t1 on t0.poliza = t1.poliza and t0.secren = t1.maxren
 inner join cobeart t2 on t2.secart = t0.secart and t2.poliza = t1.poliza and t2.secren = t1.maxren 
 inner join cobertura t3 on t3.cobertura= t2.cober and t3.ramo = 2
 inner join seg_marcas as t5 on t0.marca = t5.marca
 inner join (select cat_descr_catalogo, cat_cod_catalogo from seg_catalogo where tab_cod_tabla = 'seg_color_auto') t6 on t0.color = t6.cat_cod_catalogo
 where (t0.poliza = '91-0033551#117')



---buscar coberturas de polizas medicas
 select maxren, t0.ramo, t0.poliza, t0.tipo, t0.clase,t0.asegurado, t2.nombre, t3.gst_nombre,t4.nombre as contratante, t1.vigi, t1.vigf, t1.status from asegurado as t0 INNER JOIN 
( select max(secren) maxren, poliza, cia, gestor, vigi, vigf, cliente,status
 from poliza where ramo in (7,9,123) and tipo ='poliza' group by poliza,cia,gestor,vigi, vigf, cliente, status) t1 on t0.poliza = t1.poliza and t0.secren = t1.maxren 
 inner join ciaseg as t2 on t1.cia = t2.cia
 inner join gestores as t3 on t1.gestor = t3.gst_codigo_gestor 
 inner join clientes as t4 on t1.cliente = t4.cliente



declare @horaActualTime as time
declare @horaActualDateTime as datetime
declare @fecha2 as time

set @horaActualDateTime = GETDATE()
set @horaActualTime = @horaActualDateTime
set @fecha2 = '11:01:00'

--convirtiendo tu fecha en datetime
select CAST( @fecha2 as datetime ),DATEDIFF( MI , @fecha2 , @horaActualDateTime )  as diferenciaDatetime, DATEDIFF( MI , @fecha2 , @horaActualTime )  as diferenciaTime