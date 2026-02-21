--exploratory analysis
select count(*) from accidents;

--provinces with more accidents
select 
row_number() over(order by count(*) desc) as "#",
Provincia as Province,
count(id) as total_accidents
from accidents
group by Provincia
order by count(id) desc;

--25 cantones with more accidents
select 
row_number() over(order by count(*) desc) as "#",
Cantón,
count(id) as total_accidents
from accidents
group by Cantón
order by count(id) desc
limit 25;

--rural vs urban accidents
select 
row_number() over(order by count(*) desc) as "#",
"Rural o urbano" as Rural_or_Urban,
count(id) as total_accidents
from accidents
group by "Rural o urbano"
order by count(id) desc;

--count of accident types
select 
row_number() over(order by count(*) desc) as "#",
"Tipo de accidente" as Accident_type,
count("Tipo de accidente") as count
from accidents
group by "Tipo de accidente"
order by count("Tipo de accidente") desc;

--details regarding motorcyles accidents
select 
row_number() over(order by count(*) desc) as "#",
count(*) as total_accidents,
"Calzada vertical" as road_slope,
"Tipo de calzada" as road_surface,
"Estado del tiempo" as weather,
"Estado de la calzada" as road_condition
from accidents
where "Tipo de accidente" like "%motocicleta%"
group by
"Calzada vertical",
"Tipo de calzada",
"Estado del tiempo",
"Estado de la calzada"
order by count("Tipo de accidente") desc;

--days with more accidents
select 
trim(substr("Día", instr("Día", '.') + 1)) as day,
count(Día) as accidents
from accidents
group by Día
order by count(Día) desc;

-- top 10 most frequent time of day for accidents
select 
row_number() over(order by count(Hora) desc) as "#",
Hora as time,
count(Hora) as accidents
from accidents
group by Hora
order by accidents desc
limit 10;