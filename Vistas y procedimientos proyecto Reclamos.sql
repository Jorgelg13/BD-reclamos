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

SELECT t0.poliza, t0.ramo, t0.vigi,t0.vigf, t2.gst_nombre, t3.nombre, t0.cliente, t0.status, t1.nombre, t1.apellido, t1.tipo, t1.direccion
FROM  dbo.poliza AS t0 INNER JOIN dbo.clientes AS t1 ON t1.cliente = t0.cliente
inner join gestores as t2 on t0.gestor = t2.gst_codigo_gestor
inner join ciaseg as t3 on t0.cia = t3.cia 
WHERE (t0.ramo NOT IN (2, 123, 7, 9)) AND (t0.vigf > GETDATE()) AND (UPPER(t0.status) <> 'CANCELADA') AND (UPPER(t0.status) <> 'SOLICITUD') AND (UPPER(t0.tipo) = 'POLIZA') order by poliza




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
select distinct t0.ramo, t0.poliza, t0.tipo, t0.clase, t0.parentesco, t0.asegurado  from asegurado as t0 INNER JOIN 
( select max(secren) maxren, poliza
 from poliza where ramo in (7,9,123) and tipo ='poliza'  and status <> 'cancelada' and vigf > getdate()  group by poliza) t1 on t0.poliza = t1.poliza and t0.secren = t1.maxren 




 ---------------------------------------
 --- tablas para enlasar informacion en autos
 select *from seg_modelos

select *from seg_marcas

select *from ciaseg

select *from gestores
