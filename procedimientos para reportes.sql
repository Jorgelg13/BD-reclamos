----------------------------------------------------------------
-------------procedimientos almacenados para reclamos de autos -------------------
create procedure pa_ReportesAutos
@fechaInicio date,
@fechaFin date
as
SELECT
dbo.reclamo_auto.id,
dbo.auto_reclamo.asegurado,
dbo.auto_reclamo.poliza,
dbo.auto_reclamo.estado_poliza,
dbo.auto_reclamo.placa,
dbo.auto_reclamo.marca,
dbo.auto_reclamo.modelo,
dbo.auto_reclamo.color,
dbo.auto_reclamo.chasis,
dbo.auto_reclamo.motor,
dbo.auto_reclamo.propietario,
dbo.auto_reclamo.ejecutivo,
dbo.auto_reclamo.aseguradora,
dbo.auto_reclamo.contratante,
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
dbo.reclamo_auto.hora_cierre,
dbo.reclamo_auto.fecha_cierre,
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




---------------------------------------
--procedimientos daños--------------
create procedure pa_ReportesDaños
@fechaInicio date,
@fechaFin date
as
SELECT
dbo.reclamos_varios.id,
dbo.reg_reclamo_varios.poliza,
dbo.reg_reclamo_varios.asegurado,
dbo.reg_reclamo_varios.aseguradora,
dbo.reg_reclamo_varios.contratante,
dbo.reg_reclamo_varios.ejecutivo,
dbo.reg_reclamo_varios.ramo,
dbo.reg_reclamo_varios.status,
dbo.reg_reclamo_varios.tipo,
dbo.reg_reclamo_varios.direccion,
dbo.reclamos_varios.boleta,
dbo.reclamos_varios.titular,
dbo.reclamos_varios.reportante,
dbo.reclamos_varios.telefono,
dbo.reclamos_varios.ajustador,
dbo.reclamos_varios.version,
dbo.reclamos_varios.ubicacion,
dbo.reclamos_varios.hora,
dbo.reclamos_varios.fecha,
dbo.reclamos_varios.hora_commit,
dbo.reclamos_varios.fecha_commit,
dbo.reclamos_varios.hora_cierre,
dbo.reclamos_varios.fecha_cierre,
dbo.cabina.nombre as cabina,
dbo.sucursal.nombre as sucursal,
dbo.empresa.nombre as empresa,
dbo.pais.nombre as pais,
dbo.usuario.nombre as usuario

FROM
dbo.reg_reclamo_varios
INNER JOIN dbo.reclamos_varios ON dbo.reclamos_varios.id_reg_reclamos_varios = dbo.reg_reclamo_varios.id
INNER JOIN dbo.cabina ON dbo.reclamos_varios.id_cabina = dbo.cabina.id
INNER JOIN dbo.sucursal ON dbo.cabina.id_sucursal = dbo.sucursal.id
INNER JOIN dbo.empresa ON dbo.sucursal.id_empresa = dbo.empresa.id
INNER JOIN dbo.pais ON dbo.empresa.id_pais = dbo.pais.id
INNER JOIN dbo.usuario ON dbo.usuario.id_cabina = dbo.cabina.id AND dbo.reclamos_varios.id_usuario = dbo.usuario.id
where (fecha_cierre between @fechaInicio and @fechaFin) and (reclamos_varios.id_estado = 2)




-------------------------------------------------------
--------Procediemientos reclamos Medicos---------------
create procedure pa_ReportesMedicos
@fechaInicio date,
@fechaFin date
as
SELECT
dbo.reclamos_medicos.id,
dbo.reg_reclamos_medicos.poliza,
dbo.reg_reclamos_medicos.asegurado,
dbo.reg_reclamos_medicos.aseguradora,
dbo.reg_reclamos_medicos.contratante,
dbo.reg_reclamos_medicos.ejecutivo,
dbo.reg_reclamos_medicos.ramo,
dbo.reg_reclamos_medicos.tipo,
dbo.reg_reclamos_medicos.clase,
dbo.reg_reclamos_medicos.estado_poliza,
dbo.reclamos_medicos.reportante,
dbo.reclamos_medicos.tipo_consulta,
dbo.reclamos_medicos.correo,
dbo.reclamos_medicos.telefono,
dbo.reclamos_medicos.hora_commit,
dbo.reclamos_medicos.fecha_commit,
dbo.reclamos_medicos.hora_cierre,
dbo.reclamos_medicos.fecha_cierre,
dbo.cabina.nombre as cabina,
dbo.sucursal.nombre as sucursal,
dbo.empresa.nombre as empresa,
dbo.pais.nombre as pais,
dbo.usuario.nombre as usuario

FROM
dbo.reg_reclamos_medicos
INNER JOIN dbo.reclamos_medicos ON dbo.reclamos_medicos.id_reg_reclamos_medicos = dbo.reg_reclamos_medicos.id
INNER JOIN dbo.cabina ON dbo.reclamos_medicos.id_cabina = dbo.cabina.id
INNER JOIN dbo.sucursal ON dbo.cabina.id_sucursal = dbo.sucursal.id
INNER JOIN dbo.empresa ON dbo.sucursal.id_empresa = dbo.empresa.id
INNER JOIN dbo.pais ON dbo.empresa.id_pais = dbo.pais.id
INNER JOIN dbo.usuario ON dbo.usuario.id_cabina = dbo.cabina.id AND dbo.reclamos_medicos.id_usuario = dbo.usuario.id
where (fecha_cierre between @fechaInicio and @fechaFin) and (reclamos_medicos.id_estado = 2)




------------------------------------------------------------
---------------Procedimiento autorizaciones cerradas ------------------
create procedure pa_reportesAutorizaciones
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
dbo.autorizaciones.fecha_cierre,
dbo.autorizaciones.hora_cierre,
dbo.autorizaciones.tipo_estado,
dbo.autorizaciones.total_tiempo,
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
where (fecha_cierre between @fechaInicio and @fechaFin) and (autorizaciones.tipo_estado = 'Cerrado')



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
