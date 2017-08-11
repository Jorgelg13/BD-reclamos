
select *from asegurado where status != 'Activo'
select *from clientes

SELECT *from seg_direccion

CREATE VIEW vista_cumpleaneros
AS
select t0.cliente, t0.fechanac, t1.dir_e_mail as Correo, t0.nombre + ' ' + t0.segundo_nombre + ' ' + t0.apellido + ' ' + t0.segundo_apellido as Asegurado from clientes as t0
inner join seg_direccion as t1 on t1.dir_cliente = t0.cliente
where (estado = 'A' and tipo = 'Jur' or tipo = 'Nat') and (len (dir_e_mail) > 3 and dir_e_mail != '') 
and t0.cliente in (select distinct cliente from poliza where vigf >= GETDATE() )
and ( DAY(fechanac) = day(GETDATE())   and  month(fechanac) = month(GETDATE())) 

select cliente, Asegurado, Correo from vista_cumpleaneros 