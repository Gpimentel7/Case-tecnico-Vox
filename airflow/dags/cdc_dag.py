from airflow import DAG
from airflow.operators.python import PythonOperator
from datetime import datetime
from cdc_tasks import ingestao_cdc  # Importando a função de outro arquivo

dag = DAG(
    'cdc_airflow_dag',
    description='DAG de CDC para capturar mudanças nas tabelas rental e payment',
    schedule_interval='@hourly',
    start_date=datetime(2025, 4, 11),
    catchup=False,
)

t1 = PythonOperator(
    task_id='ingestao_cdc_task',
    python_callable=ingestao_cdc,
    dag=dag,
)
