# Vehicle Accidents in Costa Rica (2018-2024)

SQL database project analyzing vehicle accident data in Costa Rica from 2018 to 2024.

## Database

- **Type**: SQLite
- **Records**: 104,898 accidents
- **Source**: Costa Rican accident database with victims

## Data Structure

The `accidents` table contains 21 columns including:
- Accident class and type
- Year, time, and location (province, canton, district)
- Road conditions (route, surface type, weather)
- Severity (deaths, serious injuries, minor injuries)

## Setup

1. Install dependencies:
```bash
pip install pandas
```

2. Create the database:
```bash
python import_to_sqlite.py
```

This will create `vehicle_accidents.db` from the CSV source file.

## Usage

Connect to the database using any SQLite client or Python:

```python
import sqlite3
conn = sqlite3.connect('vehicle_accidents.db')
cursor = conn.cursor()

# Example query
cursor.execute("SELECT * FROM accidents LIMIT 10")
```

## Data source:

https://datosabiertos.csv.go.cr/datasets/193472/consolidado-de-accidentes-de-transito-con-victimas/

## Data Source

Base de accidentes con víctimas 2018-2024 (Costa Rica)
