---- vaciar las tablas de la base de datos reclamos
use reclamos
truncate table ViewBusquedaAuto
truncate table vistaReclamosDaños
truncate table vistaReclamosMedicos

--Primero crear una vista con el query que se usara para la busqueda de los datos
--que tiene un automovil para ello utilizo el siguiente query

use seguro
 insert into [reclamos].[dbo].[ViewBusquedaAuto]
 SELECT  [ramo],
 t0.[poliza],
 t1.vigi,
 t1.vigf,
 t3.nombre,
 t6.cat_descr_catalogo as color,
 t2.gst_nombre,
 t4.nombre as contratante,
 [motor], 
 [chasis], 
 t5.descr_marca as marca, 
 [placa], 
 [solicitud], 
 [secart], 
 Year(aaauto) as modelo, 
 [valorauto], 
 [propietario], 
 t1.status, 
 t1.sumaaseg,
 t1.tipo,
 t4.nombre +' '+ t4.segundo_nombre +' '+ t4.apellido +' '+t4.segundo_apellido as asegurado,
 t4.vip,
 t1.gestor,
 t0.inciso_cia, 
 t7.mnd_moneda,
 t4.direccion
 FROM [autos] t0 
 inner join ( 
 select max(secren) maxren, poliza, gestor,cia,vigi, vigf, contratante, cliente,sumaaseg, status,tipo,moneda_facturacion
 from poliza where tipo !='endoso' group by poliza,gestor,cia,vigi, vigf,contratante,cliente,sumaaseg, status,tipo,moneda_facturacion) t1 on t0.poliza = t1.poliza and t0.secren = t1.maxren 
 inner join gestores as t2 on t1.gestor = t2.gst_codigo_gestor
 inner join ciaseg as t3 on t1.cia = t3.cia
 inner join clientes as t4 on t1.cliente = t4.cliente
 inner join seg_marcas as t5 on REPLACE(t0.marca, '|', '') = t5.marca
 left join seg_monedas as t7 on t1.moneda_facturacion = t7.mnd_id
 inner join (select cat_descr_catalogo, cat_cod_catalogo from seg_catalogo where tab_cod_tabla = 'seg_color_auto') t6 on t0.color = t6.cat_cod_catalogo
 

 --ejecutar update en base de datos reclamos para actualizar el campo vip
 use reclamos
 update ViewBusquedaAuto SET vip= 'Si' where (numero_gestor = 138 or numero_gestor = 440) 


 create view viewCoberturasAutos
 as
 SELECT DISTINCT t3.descr, t0.placa,t0.chasis, t2.limite1, t2.limite2, t2.deducible, t2.prima,t1.sumaaseg
 FROM [autos] t0 inner join ( select max(secren) maxren, poliza,sumaaseg from poliza where tipo ='poliza'  and status <> 'cancelada' and vigf >GETDATE() group by poliza,sumaaseg) t1 on t0.poliza = t1.poliza and t0.secren = t1.maxren
 inner join cobeart t2 on t2.secart = t0.secart and t2.poliza = t1.poliza and t2.secren = t1.maxren 
 inner join cobertura t3 on t3.cobertura= t2.cober and t3.ramo = 2 





---------------------------------------------------------------------------------------------------------------
-- para la busqueda de los reclamos para daños varios se hace un select y se inserta en la tabla
-- vistaReclamosDaños en la bd de reclamos


insert into [reclamos].[dbo].[vistaReclamosDaños]
SELECT t0.poliza, t5.descr as ramo, t0.vigi, t0.vigf, t2.gst_nombre, t3.nombre,t4.nombre as contratante, t0.cliente, t0.status, t1.tipo, t1.direccion, t4.nombre +' '+ t4.segundo_nombre +' '+ t4.apellido +' '+t4.segundo_apellido as asegurado, t0.sumaaseg, t4.vip,t0.gestor, t6.mnd_moneda
FROM dbo.poliza AS t0 
INNER JOIN dbo.clientes AS t1 ON t1.cliente = t0.cliente 
INNER JOIN dbo.gestores AS t2 ON t0.gestor = t2.gst_codigo_gestor
INNER JOIN dbo.ciaseg AS t3 ON t0.cia = t3.cia
INNER JOIN clientes as t4 on t1.cliente = t4.cliente
INNER JOIN ramos as t5 on t0.ramo = t5.ramo
lEFT JOIN seg_monedas as t6 on t0.moneda_facturacion = t6.mnd_id
WHERE (t0.ramo NOT IN (2, 123, 7, 9))  AND (UPPER(t0.status) <> 'SOLICITUD') AND (UPPER(t0.tipo) = 'POLIZA')


 --ejecutar update en base de datos reclamos para actualizar el campo vip
 use reclamos
 update vistaReclamosDaños SET vip= 'Si' where (numero_gestor = 138 or numero_gestor = 440) 




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
--------------------------------------- query para busqueda de las polizas medicas------------------------

insert into [reclamos].[dbo].[vistaReclamosMedicos]

 select t0.ramo, t0.poliza, t0.tipo, t0.clase,LOWER(t0.asegurado), t2.nombre, t3.gst_nombre,t4.nombre as contratante, t1.vigi, t1.vigf, t1.status, maxren,t4.vip,t1.gestor, t0.secren from asegurado as t0 INNER JOIN 
( select max(secren) maxren, poliza, cia, gestor, vigi, vigf, cliente,status
 from poliza where ramo in (7,9,123) and tipo ='poliza' and status != 'Cancelada' group by poliza,cia,gestor,vigi, vigf, cliente, status) t1 on t0.poliza = t1.poliza and t0.secren = t1.maxren 
 inner join ciaseg as t2 on t1.cia = t2.cia
 inner join gestores as t3 on t1.gestor = t3.gst_codigo_gestor 
 inner join clientes as t4 on t1.cliente = t4.cliente


  --ejecutar update en base de datos reclamos para actualizar el campo vip
  use reclamos
 update vistaReclamosMedicos SET vip= 'Si' where (numero_gestor = 138 or numero_gestor = 440) 








-----------------------------------------------------------------------------------
---------- buscar clientes por poliza o nombre vista para el celular  -------------


create View vistaBusquedaPolizaMovil
as
SELECT  t0.tipo AS tipoPol, t0.poliza, t0.ramo AS NumRamo, t5.descr AS ramo, t0.vigi, t0.vigf, t2.gst_nombre, t3.nombre AS aseguradora, t4.nombre AS contratante, t0.cliente, t0.status, t1.nombre + ' ' + t1.segundo_nombre + ' ' + t1.apellido + ' ' + t1.segundo_apellido AS Asegurado, t1.tipo, t1.direccion, t0.sumaaseg
FROM  dbo.poliza AS t0 
INNER JOIN dbo.clientes AS t1 ON t1.cliente = t0.cliente 
INNER JOIN dbo.gestores AS t2 ON t0.gestor = t2.gst_codigo_gestor
INNER JOIN dbo.ciaseg AS t3 ON t0.cia = t3.cia
INNER JOIN dbo.clientes AS t4 ON t1.cliente = t4.cliente 
INNER JOIN dbo.ramos AS t5 ON t0.ramo = t5.ramo
WHERE  (t0.tipo <> 'endoso')



 ---- actualiza fechas
 update autorizaciones set total_tiempo =CONCAT(
	DATEDIFF(MINUTE, fecha_completa_commit,fecha_completa_cierre)/60, ':',
	DATEDIFF(MINUTE, fecha_completa_commit,fecha_completa_cierre)%60, ':',
	DATEDIFF(SECOND, fecha_completa_commit,fecha_completa_cierre)%60
) where 

