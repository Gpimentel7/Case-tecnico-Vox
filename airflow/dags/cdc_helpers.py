import psycopg2

def connect_to_db():
    return psycopg2.connect(
        host="localhost", 
        database="airflow", 
        user="airflow", 
        password="airflow"
    )

def fetch_modified_data():
    conn = connect_to_db()
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM rental WHERE last_update > '2025-01-01';")
    rows = cursor.fetchall()
    conn.close()
    return rows
