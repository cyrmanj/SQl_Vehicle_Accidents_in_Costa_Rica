import sqlite3
import pandas as pd

# Read CSV
df = pd.read_csv('2 Base de accidentes con victimas 2018_ 2024_UTF8.csv', 
                 sep=';', encoding='utf-8')

# Create SQLite database
conn = sqlite3.connect('vehicle_accidents.db')

# Import data to table
df.to_sql('accidents', conn, if_exists='replace', index=False)

# Verify import
cursor = conn.cursor()
cursor.execute("SELECT COUNT(*) FROM accidents")
print(f"Total records imported: {cursor.fetchone()[0]}")

cursor.execute("SELECT * FROM accidents LIMIT 3")
print("\nFirst 3 records:")
for row in cursor.fetchall():
    print(row)

conn.close()
print("\nDatabase 'vehicle_accidents.db' created successfully!")
