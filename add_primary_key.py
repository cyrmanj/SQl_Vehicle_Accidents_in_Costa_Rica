import sqlite3
import pandas as pd

conn = sqlite3.connect('vehicle_accidents.db')

# Read existing data
df = pd.read_sql("SELECT * FROM accidents", conn)

# Drop old table
conn.execute("DROP TABLE accidents")

# Create new table with primary key
conn.execute("""
CREATE TABLE accidents (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    "Clase de accidente" TEXT,
    "Tipo de accidente" TEXT,
    "Año" INTEGER,
    "Hora" TEXT,
    "Hora recodificada" TEXT,
    "Provincia " TEXT,
    "Cantón" TEXT,
    "Distrito" TEXT,
    "Ruta" TEXT,
    "Kilómetro" TEXT,
    "Rural o urbano" TEXT,
    "Calzada vertical" TEXT,
    "Calzada horizontal" TEXT,
    "Tipo de calzada" TEXT,
    "Tipo de circulación" TEXT,
    "Estado del tiempo" TEXT,
    "Estado de la calzada" TEXT,
    "Región Mideplan" TEXT,
    "Tipo ruta" TEXT,
    "Día " TEXT,
    "Mes " TEXT
)
""")

# Insert data back
df.to_sql('accidents', conn, if_exists='append', index=False)

# Verify
cursor = conn.cursor()
cursor.execute("SELECT COUNT(*) FROM accidents")
print(f"Records: {cursor.fetchone()[0]}")

cursor.execute("PRAGMA table_info(accidents)")
pk_col = [row for row in cursor.fetchall() if row[5] == 1]
print(f"Primary key: {pk_col[0][1] if pk_col else 'None'}")

conn.close()
print("Primary key added successfully!")
