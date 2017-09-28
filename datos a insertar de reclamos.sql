
--select *from reclamosvida order by secuencia
DROP TABLE #TEMP
BEGIN TRY
    BEGIN TRANSACTION
				declare @sec int
                select @sec=max(secuencia) from [192.168.5.205].seguro.dbo.reclamos  
                select CONVERT(int,ROW_NUMBER() OVER(ORDER BY poliza ASC))+ @sec as secuencia,  
		        reg_reclamo_varios.num_ramo,
				reg_reclamo_varios.poliza, 
				reg_reclamo_varios.cia,
				reg_reclamo_varios.secren,
				reg_reclamo_varios.gestor,
				reclamos_varios.num_reclamo,
				cast(reclamos_varios.fecha as datetime) as fecha,
                cast(reclamos_varios.fecha_commit as datetime) as fecha_creacion,
                cast(reclamos_varios.fecha_cierre_reclamo as datetime) as fecha_cierre,
				reclamos_varios.usuario_unity,
				reclamos_varios.ubicacion,
				reclamos_varios.version,
				contactos_reclamos_varios.nombre
				into #TEMP
			    from reclamos_varios 
				inner JOIN reg_reclamo_varios on reg_reclamo_varios.id = reclamos_varios.id_reg_reclamos_varios 
				inner JOIN contactos_reclamos_varios on contactos_reclamos_varios.id_reclamos_varios = reclamos_varios.id
				where (reclamos_varios.estado_unity = 'Cerrado') and acs = 0
				--insertando al servidor 205
				insert into [seguro].[dbo].[reclamos] (secuencia,ramo,poliza,cia,secren,gestor,reclamo, fechasin,fechainf, fechacierre, usuario, lugar_accidente,causa_siniestro, contacto_corp)
				select *from #TEMP
			update reclamos_varios set acs = 1 where acs = 0
		COMMIT
	  END TRY
	BEGIN CATCH
		ROLLBACK 
		insert into errores_insercion(numero, descripcion,seccion)values(ERROR_NUMBER(),ERROR_MESSAGE(),'Autos')
		SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH


BEGIN TRY
    BEGIN TRANSACTION
				declare @sec int
				select @sec=max(secuencia) from [192.168.5.205].seguro.dbo.reclamos  
				select CONVERT(int,ROW_NUMBER() OVER(ORDER BY poliza ASC))+ @sec as secuencia,  
				auto_reclamo.numRamo,
				auto_reclamo.poliza, 
				auto_reclamo.cia,
				auto_reclamo.secren,
				auto_reclamo.numero_gestor,
				reclamo_auto.num_reclamo,
				cast(reclamo_auto.fecha as datetime) as fecha,
				cast(reclamo_auto.fecha_commit as datetime) as fecha_commit,
				cast(reclamo_auto.fecha_cierre_reclamo as datetime) as fecha_cierre,
				reclamo_auto.telefono,
				auto_reclamo.placa,
				reclamo_auto.usuario_unity,
				reclamo_auto.ubicacion,
				talleres.nombre,
				reclamo_auto.version,
				contacto_auto.contacto
				into #TEMP2
				from [reclamos].[dbo].[reclamo_auto] 
				INNER JOIN auto_reclamo on reclamo_auto.id_auto_reclamo = auto_reclamo.id 
				INNER JOIN talleres on reclamo_auto.id_taller = talleres.id 
				INNER JOIN contacto_auto on reclamo_auto.id = contacto_auto.id_reclamo_auto 
				where (reclamo_auto.estado_unity = 'Cerrado') and reclamo_auto.acs = 0
				
				insert into seguro.dbo.reclamos (secuencia,ramo,poliza,cia, secren,gestor,reclamo, fechasin,fechainf, fechacierre, telconductor, placa, usuario, lugar_accidente, relac_conduct_aseg,causa_siniestro, contacto_corp)
				select *from #TEMP2 
			    update reclamo_auto set acs = 1 where acs = 0
	     	COMMIT
	    END TRY
	BEGIN CATCH
		ROLLBACK 
		insert into errores_insercion(numero, descripcion,seccion)values(ERROR_NUMBER(),ERROR_MESSAGE(),'Autos')
		SELECT 
        ERROR_NUMBER() AS ErrorNumber,
        ERROR_MESSAGE() AS ErrorMessage;
END CATCH



























