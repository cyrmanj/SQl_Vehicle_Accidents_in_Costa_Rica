-- Create accidents table with proper schema
CREATE TABLE IF NOT EXISTS accidents (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    clase_accidente TEXT,
    tipo_accidente TEXT,
    anio INTEGER,
    hora TEXT,
    hora_recodificada TEXT,
    provincia TEXT,
    canton TEXT,
    distrito TEXT,
    ruta TEXT,
    kilometro TEXT,
    rural_urbano TEXT,
    calzada_vertical TEXT,
    calzada_horizontal TEXT,
    tipo_calzada TEXT,
    tipo_circulacion TEXT,
    estado_tiempo TEXT,
    estado_calzada TEXT,
    region_mideplan TEXT,
    tipo_ruta TEXT,
    dia TEXT,
    mes TEXT
);

-- Create provincias table
CREATE TABLE IF NOT EXISTS provincias (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL
);

-- Create cantones table
CREATE TABLE IF NOT EXISTS cantones (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT NOT NULL,
    provincia_id INTEGER,
    FOREIGN KEY (provincia_id) REFERENCES provincias(id)
);
