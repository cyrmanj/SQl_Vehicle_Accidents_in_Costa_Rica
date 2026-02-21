-- 1. Create the Provinces Table
create table provincias (
    id int primary key,
    nombre varchar(50) not null
);

-- 2. Create the Cantones Table (Sub-divisions)
create table cantones (
    id int primary key, -- Official 3-digit code (e.g., 101)
    provincia_id int,
    nombre varchar(100) not null,
    foreign key (provincia_id) references provincias(id)
);

-- 3. Create the Main Accidents Table
-- Note: 'tipo_accidente' allows you to filter for motorcycles specifically.
create table accidentes (
    accident_id int AUTO_INCREMENT primary key,
    anio int,
    fecha_hora datetime,
    provincia_id int,
    canton_id int,
    clase_accidente varchar(100), -- e.g., 'Atropello', 'Colisión'
    tipo_accidente varchar(100),  -- e.g., 'Colisión con Motocicleta'
    gravedad varchar(50),        -- e.g., 'Fatal', 'Herido Leve'
    zona varchar(20),            -- e.g., 'Urbana', 'Rural'
    foreign key (provincia_id) references provincias(id),
    foreign key (canton_id) references cantones(id)
);

-- 4. Insert Official Province Data
insert into provincias (id, nombre) values
(1, 'San José'),
(2, 'Alajuela'),
(3, 'Cartago'),
(4, 'Heredia'),
(5, 'Guanacaste'),
(6, 'Puntarenas'),
(7, 'Limón');

-- 5. Insert Sample Cantons (Examples from COSEVI data)
insert into cantones (id, provincia_id, nombre) values
(101, 1, 'San José'),
(102, 1, 'Escazú'),
(201, 2, 'Alajuela'),
(210, 2, 'San Carlos'),
(501, 5, 'Liberia'),
(701, 7, 'Limón');
