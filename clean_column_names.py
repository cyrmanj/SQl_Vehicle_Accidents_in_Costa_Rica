import sqlite3
import pandas as pd

conn = sqlite3.connect('vehicle_accidents.db')

# Get all tables
cursor = conn.cursor()
cursor.execute("SELECT name FROM sqlite_master WHERE type='table'")
tables = [row[0] for row in cursor.fetchall()]

for table in tables:
    # Skip system tables
    if table.startswith('sqlite_'):
        continue
        
    print(f"Processing table: {table}")
    
    # Read data
    df = pd.read_sql(f"SELECT * FROM {table}", conn)
    
    # Remove trailing spaces from column names
    df.columns = df.columns.str.strip()
    
    # Drop old table
    conn.execute(f"DROP TABLE {table}")
    
    # Create new table with cleaned column names
    df.to_sql(table, conn, if_exists='replace', index=False)
    
    print(f"  Cleaned {len(df.columns)} columns")

# Verify accidents table
cursor.execute("PRAGMA table_info(accidents)")
print("\nAccidents table columns:")
for row in cursor.fetchall():
    print(f"  - {row[1]}")

conn.close()
print("\nAll trailing spaces removed!")
