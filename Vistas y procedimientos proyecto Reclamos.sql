BEGIN TRY
    BEGIN TRANSACTION
      truncate table ViewBusquedaAuto
		    --Primero crear una vista con el query que se usara para la busqueda de los datos
			--que tiene un automovil para ello utilizo el siguiente query
			insert into [reclamos].[dbo].[ViewBusquedaAuto]
			SELECT 
		    [ramo],
			t0.[poliza],
			t1.vigi,
		    t1.vigf,
			t3.nombre,
			t6.cat_descr_catalogo as color,
			t2.gst_nombre,
			t4.nombre + ' ' + t4.segundo_nombre + ' ' + t4.apellido + ' ' + t4.segundo_apellido as contratante,
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
			t4.direccion,
		    t1.cia,
			t1.secren,
			t1.cliente
			FROM [192.168.5.205].seguro.dbo.autos t0
			inner join (
			select max(secren) maxren, poliza, gestor,cia,vigi, vigf, contratante, cliente,sumaaseg, status,tipo,moneda_facturacion,secren
			from [192.168.5.205].seguro.dbo.poliza where tipo !='endoso' group by poliza,gestor,cia,vigi, vigf,contratante,cliente,sumaaseg, status,tipo,moneda_facturacion, secren) t1 on t0.poliza = t1.poliza and t0.secren = t1.maxren
			inner join [192.168.5.205].seguro.dbo.gestores as t2 on t1.gestor = t2.gst_codigo_gestor
			inner join [192.168.5.205].seguro.dbo.ciaseg as t3 on t1.cia = t3.cia
			inner join [192.168.5.205].seguro.dbo.clientes as t4 on t1.cliente = t4.cliente
			inner join [192.168.5.205].seguro.dbo.seg_marcas as t5 on  t0.marca = t5.marca
			left join [192.168.5.205].seguro.dbo.seg_monedas as t7 on t1.moneda_facturacion = t7.mnd_id
			inner join (select cat_descr_catalogo, cat_cod_catalogo from [192.168.5.205].seguro.dbo.seg_catalogo where tab_cod_tabla = 'seg_color_auto') t6 on t0.color = t6.cat_cod_catalogo
			 --ejecutar update en base de datos reclamos para actualizar el campo vip
			 use reclamos
			 update ViewBusquedaAuto SET vip= 'Si' where (numero_gestor = 138 or numero_gestor = 440) 
		COMMIT
	  END TRY
	BEGIN CATCH
		ROLLBACK 
		insert into errores_insercion(numero, descripcion,seccion)values(ERROR_NUMBER(),ERROR_MESSAGE(),'Autos')
		SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH


---------------------------------------------------------------------------------------------------------------
-- para la busqueda de los reclamos para daños varios se hace un select y se inserta en la tabla --------------
-- vistaReclamosDaños en la bd de reclamos---------------------------------------------------------------------

BEGIN TRY
    BEGIN TRANSACTION
       truncate table vistaReclamosDaños   
			insert into [reclamos].[dbo].[vistaReclamosDaños]
			SELECT 
			t0.poliza, 
			t5.descr as ramo, 
			t0.vigi, 
			t0.vigf, 
			t2.gst_nombre, 
			t3.nombre,
			t4.nombre + ' ' + t4.segundo_nombre + ' ' + t4.apellido + ' ' + t4.segundo_apellido as contratante, 
			t0.cliente, 
			t0.status, 
			t1.tipo, 
			t1.direccion, 
			t4.nombre +' '+ t4.segundo_nombre +' '+ t4.apellido +' '+t4.segundo_apellido as asegurado, 
			t0.sumaaseg, 
			t4.vip,t0.gestor, 
			t6.mnd_moneda,
			t0.ramo,
			t0.gestor,
			t0.cia,
			t0.secren
			FROM [192.168.5.205].[seguro].[dbo].[poliza] AS t0 
			INNER JOIN [192.168.5.205].[seguro].[dbo].[clientes] AS t1 ON t1.cliente = t0.cliente 
			INNER JOIN [192.168.5.205].[seguro].[dbo].[gestores] AS t2 ON t0.gestor = t2.gst_codigo_gestor
			INNER JOIN [192.168.5.205].[seguro].[dbo].[ciaseg] AS t3 ON t0.cia = t3.cia
			INNER JOIN [192.168.5.205].[seguro].[dbo].[clientes] as t4 on t1.cliente = t4.cliente
			INNER JOIN [192.168.5.205].[seguro].[dbo].[ramos] as t5 on t0.ramo = t5.ramo
			lEFT JOIN [192.168.5.205].[seguro].[dbo].[seg_monedas] as t6 on t0.moneda_facturacion = t6.mnd_id
			WHERE (t0.ramo NOT IN (2, 123, 7, 9))  AND (UPPER(t0.status) <> 'SOLICITUD') AND (UPPER(t0.tipo) = 'POLIZA')

		    --ejecutar update en base de datos reclamos para actualizar el campo vip
		    use reclamos
		    update vistaReclamosDaños SET vip= 'Si' where (numero_gestor = 138 or numero_gestor = 440) 
       COMMIT
     END TRY
BEGIN CATCH
        INSERT INTO errores_insercion(numero, descripcion,seccion)values(ERROR_NUMBER(),ERROR_MESSAGE(),'Daños')
		SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH



----------------------------------------------------------------------------------------------------------
--------------------------------------- query para busqueda de las polizas medicas------------------------

BEGIN TRY
    BEGIN TRANSACTION
       truncate table vistaReclamosMedicos
		   insert into [reclamos].[dbo].[vistaReclamosMedicos]
			 select 
			 t0.ramo, 
			 t0.poliza, 
			 t0.tipo, 
			 t0.clase,
			 t0.asegurado, 
			 t2.nombre, 
			 t3.gst_nombre,
			 t4.nombre + ' '+ t4.segundo_nombre + ' ' + t4.apellido + ' ' + t4.segundo_apellido as contratante, 
			 t1.vigi, 
			 t1.vigf, 
			 t1.status, 
			 maxren,
			 t4.vip,
			 t1.gestor, 
			 t0.secren,
			 t5.mnd_moneda,
			 t0.certificado,
			 t1.cliente
			 from [192.168.5.205].[seguro].[dbo].[asegurado] as t0 
			 INNER JOIN 
			 (select max(secren) maxren, poliza, cia, gestor, vigi, vigf, cliente,status, moneda_facturacion
			 from [192.168.5.205].[seguro].[dbo].[poliza] where ramo in (7,9,123) and tipo ='poliza' and status != 'Cancelada' and YEAR(vigf) >= YEAR('2017') group by poliza,cia,gestor,vigi, vigf, cliente, status, moneda_facturacion) t1 on t0.poliza = t1.poliza and t0.secren = t1.maxren 
			 INNER JOIN [192.168.5.205].[seguro].[dbo].[ciaseg] as t2 on t1.cia = t2.cia
			 INNER JOIN [192.168.5.205].[seguro].[dbo].[gestores] as t3 on t1.gestor = t3.gst_codigo_gestor 
			 INNER JOIN [192.168.5.205].[seguro].[dbo].[clientes] as t4 on t1.cliente = t4.cliente
			 lEFT JOIN [192.168.5.205].[seguro].[dbo].[seg_monedas] as t5 on t1.moneda_facturacion = t5.mnd_id

			 --ejecutar update en base de datos reclamos para actualizar el campo vip
			 use reclamos
			 update vistaReclamosMedicos SET vip= 'Si' where (numero_gestor = 138 or numero_gestor = 440) 
      COMMIT
   END TRY
BEGIN CATCH
    ROLLBACK
	INSERT INTO errores_insercion(numero, descripcion,seccion)values(ERROR_NUMBER(),ERROR_MESSAGE(),'Medicos')
		SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH




-----------------------------------------------------------------------------------
---------- buscar clientes por poliza o nombre vista para el celular  -------------
BEGIN TRY
    BEGIN TRANSACTION
       TRUNCATE TABLE vistaBusquedaPolizaMovil
	      insert into [reclamos].[dbo].[vistaBusquedaPolizaMovil]
			SELECT  
			t0.tipo AS tipoPol, 
			t0.poliza, 
			t0.ramo AS NumRamo, 
			t5.descr AS ramo, 
			t0.vigi, 
			t0.vigf, 
			t2.gst_nombre, 
			t3.nombre AS aseguradora, 
			t4.nombre + ' ' + t4.segundo_nombre + ' ' + t4.apellido + ' ' + t4.segundo_apellido AS contratante, 
			t0.cliente, 
			t0.status, 
			t1.nombre + ' ' + t1.segundo_nombre + ' '+ t1.apellido + ' ' + t1.segundo_apellido AS Asegurado, 
			t1.tipo, 
			t1.direccion, 
			t0.sumaaseg
			FROM  [192.168.5.205].[seguro].[dbo].[poliza] AS t0 
			INNER JOIN [192.168.5.205].[seguro].[dbo].[clientes] AS t1 ON t1.cliente = t0.cliente 
			INNER JOIN [192.168.5.205].[seguro].[dbo].[gestores] AS t2 ON t0.gestor = t2.gst_codigo_gestor
			INNER JOIN [192.168.5.205].[seguro].[dbo].[ciaseg] AS t3 ON t0.cia = t3.cia
			INNER JOIN [192.168.5.205].[seguro].[dbo].[clientes] AS t4 ON t1.cliente = t4.cliente 
			INNER JOIN [192.168.5.205].[seguro].[dbo].[ramos] AS t5 ON t0.ramo = t5.ramo
			WHERE  (t0.tipo <> 'endoso')
           COMMIT
    END TRY
BEGIN CATCH
    ROLLBACK
    INSERT INTO errores_insercion(numero, descripcion,seccion)values(ERROR_NUMBER(),ERROR_MESSAGE(),'Busqueda Movil')
		SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH


----------------------------------------------------------------------------------
---------- insertar las coberturas de las polizas  autos -------------
BEGIN TRY
    BEGIN TRANSACTION
       TRUNCATE TABLE viewCoberturasAutos
	      insert into [reclamos].[dbo].[viewCoberturasAutos]
		  select 
		    *FROM [192.168.5.205].[seguro].[dbo].viewCoberturasAutos
           COMMIT
    END TRY
BEGIN CATCH
    ROLLBACK
    INSERT INTO errores_insercion(numero, descripcion,seccion)values(ERROR_NUMBER(),ERROR_MESSAGE(),'Coberturas')
		SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH

----------------------------------------------------------------------------------
---------- insertar las coberturas de las polizas de daños  -------------
BEGIN TRY
    BEGIN TRANSACTION
       TRUNCATE TABLE busqCoberturasPolizasDaños
	      insert into [reclamos].[dbo].[busqCoberturasPolizasDaños]
		  select 
		    *FROM [192.168.5.205].[seguro].[dbo].busqCoberturasPolizasDaños
           COMMIT
    END TRY
BEGIN CATCH
    ROLLBACK
    INSERT INTO errores_insercion(numero, descripcion,seccion)values(ERROR_NUMBER(),ERROR_MESSAGE(),'Coberturas daños')
		SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH


----------------------------------------------------------------------------------
---------- inserta direcciones de los clientes -------------
BEGIN TRY
    BEGIN TRANSACTION
       TRUNCATE TABLE direcciones_clientes_gm
	      insert into [reclamos].[dbo].[direcciones_clientes_gm]		   
            select distinct p.cliente, p.poliza, d.dir_direccion
              from [192.168.5.205].seguro.dbo.poliza as p
              inner join [192.168.5.205].seguro.dbo.seg_direccion as d on d.dir_cliente = p.cliente
               where p.tipo !='endoso' and p.ramo in (7,9,123) and p.status != 'Cancelada' order by p.cliente
           COMMIT
    END TRY
BEGIN CATCH
    ROLLBACK
    INSERT INTO errores_insercion(numero, descripcion,seccion)values(ERROR_NUMBER(),ERROR_MESSAGE(),'direcciones')
		SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH


