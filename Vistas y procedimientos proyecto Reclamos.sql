--Primero crear una vista con el query que se usara para la busqueda de los datos
--que tiene un automovil para ello utilizo el siguiente query


 CREATE VIEW ViewBusquedaAuto
 AS 
 --SELECT [ramo], t0.[poliza], [vigi], [vigf], [marca], [color], [motor], [chasis], [placa], [solicitud], [secart], [modelo], [valorauto], [propietario], [estado] 
 --FROM [autos] t0 inner join ( select max(secren) maxren, poliza
 --from poliza where tipo ='poliza'  and status <> 'cancelada' group by poliza) t1 on t0.poliza = t1.poliza and t0.secren = t1.maxren 

 SELECT [ramo], t0.[poliza], t1.vigi, t1.vigf, t3.nombre, [color], t2.gst_nombre, [motor], [chasis], [placa], [solicitud], [secart], [modelo], [valorauto], [propietario], t0.estado 
 FROM [autos] t0 inner join ( select max(secren) maxren, poliza, gestor,cia,vigi, vigf
 from poliza where tipo ='poliza' and vigf> GETDATE() and status <> 'cancelada' group by poliza,gestor,cia,vigi, vigf) t1 on t0.poliza = t1.poliza and t0.secren = t1.maxren 
 inner join gestores as t2 on t1.gestor = t2.gst_codigo_gestor
 inner join ciaseg as t3 on t1.cia = t3.cia
 
 --luego para la busqueda de las coberturas del automovil especifico
 --creo un procedimiento almacenado con la siguiente estructura

  create procedure crearReclamo
  @placa varchar(50),
  @propietario varchar(50)

 as
 SELECT DISTINCT t3.descr, t0.placa, t2.limite1, t2.limite2, t2.deducible, t2.prima
 FROM [autos] t0 inner join ( select max(secren) maxren, poliza from poliza where tipo ='poliza'  and status <> 'cancelada' group by poliza) t1 on t0.poliza = t1.poliza and t0.secren = t1.maxren
 inner join cobeart t2 on t2.secart = t0.secart and t2.poliza = t1.poliza and t2.secren = t1.maxren 
 inner join cobertura t3 on t3.cobertura= t2.cober and t3.ramo = 2 

  WHERE (placa like '%' + @placa + '%') OR (propietario like '%' + @propietario + '%') 







---------------------------------------------------------------------------------------------------------------
-- para la busqueda de los reclamos para daños varios creo una vista con la siguiente estructura
-- donde viene todas las polizas de esos ramos vigentes

create view vistaReclamosDaños
as

SELECT t0.poliza, t0.ramo, t0.vigi, t0.vigf, t2.gst_nombre, t3.nombre, t0.cliente, t0.status, t1.apellido, t1.tipo, t1.direccion, t1.nombre AS NombreCliente
FROM dbo.poliza AS t0 INNER JOIN dbo.clientes AS t1 ON t1.cliente = t0.cliente INNER JOIN
dbo.gestores AS t2 ON t0.gestor = t2.gst_codigo_gestor
INNER JOIN dbo.ciaseg AS t3 ON t0.cia = t3.cia
WHERE (t0.ramo NOT IN (2, 123, 7, 9)) AND (t0.vigf > GETDATE()) AND (UPPER(t0.status) <> 'CANCELADA') AND (UPPER(t0.status) <> 'SOLICITUD') AND (UPPER(t0.tipo) = 'POLIZA')

--luego creo una vista para la busqueda de las coberturas de los reclamos de daños varios
--


create view busqCoberturasPolizasDaños
as
SELECT t4.descr, t0.poliza, t1.m, t3.secart
FROM  dbo.poliza AS t0 INNER JOIN
(SELECT MAX(secren) AS m, poliza FROM dbo.poliza
GROUP BY poliza) AS t1 ON t0.poliza = t1.poliza AND t0.secren = t1.m AND t0.tipo = 'poliza' AND t0.status NOT IN ('cancelada', 'solicitud') AND t0.ramo NOT IN (7, 9, 123, 2) AND t0.vigf > GETDATE() INNER JOIN
dbo.ramos AS t2 ON t0.ramo = t2.ramo INNER JOIN
dbo.cobeart AS t3 ON t2.ramo = t3.ramo AND t0.secren = t3.secren AND t0.poliza = t3.poliza INNER JOIN
dbo.cobertura AS t4 ON t4.cobertura = t3.cober AND t2.ramo = t4.ramo


----------------------------------------------------------------------------------------------------------
----- query para busqueda de las polizas medicas------------------------


create view vistaReclamosMedicos
as
--select distinct t0.ramo, t0.poliza, t0.tipo, t0.clase, t0.parentesco, t0.asegurado  from asegurado as t0 INNER JOIN 
--( select max(secren) maxren, poliza
-- from poliza where ramo in (7,9,123) and tipo ='poliza'  and status <> 'cancelada' and vigf > getdate()  group by poliza) t1 on t0.poliza = t1.poliza and t0.secren = t1.maxren order by asegurado

 select distinct t0.ramo, t0.poliza, t0.tipo, t0.clase,t0.asegurado, t2.nombre, t3.gst_nombre, t1.vigi, t1.vigf from asegurado as t0 INNER JOIN 
( select max(secren) maxren, poliza, cia, gestor, vigi, vigf
 from poliza where ramo in (7,9,123) and tipo ='poliza'  and status <> 'cancelada' and vigf > getdate()  group by poliza,cia,gestor,vigi, vigf) t1 on t0.poliza = t1.poliza and t0.secren = t1.maxren 
 inner join ciaseg as t2 on t1.cia = t2.cia
 inner join gestores as t3 on t1.gestor = t3.gst_codigo_gestor 




















--------------agregando vistas para la creacion de reclamos--------------

create view VistaReportesAutos
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

----------------------------------------------------
--------vista reportes reclamos daños-------
create view vistaReportesDaños
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


----------------------------------------
-----vista reclamos medicos----------------
create view vistaReportesMedicos
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





----------------------------------------------------------------
-------------procedimientos almacenados para reportes -------------------
create procedure pa_ReportesAutos
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
