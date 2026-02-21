-- English-speaking view
create view v_motorcycle_fatalities as
select 
    a.anio as year,
    p.nombre as province,
    c.nombre as canton,
    a.gravedad as severity,
    a.fecha_hora
from accidentes a
join provincias p on a.provincia_id = p.id
join cantones c on a.canton_id = c.id
where a.tipo_accidente like '%Motocicleta%' --motorcycles
and a.gravedad = 'Fatal'; 