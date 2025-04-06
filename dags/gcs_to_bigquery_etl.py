# dags/gcs_to_bigquery_etl.py

from airflow import DAG
from airflow.providers.google.cloud.transfers.gcs_to_bigquery import GCSToBigQueryOperator
from airflow.utils.dates import days_ago
from airflow.utils.task_group import TaskGroup
from datetime import timedelta

default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'start_date': days_ago(1),
    'retries': 1,
    'retry_delay': timedelta(minutes=2),
}

with DAG(
    dag_id='gcs_to_bigquery_etl',
    default_args=default_args,
    description='ETL DAG to load CSV data from GCS to BigQuery',
    schedule_interval='@daily',
    catchup=False,
    tags=['example', 'gcs', 'bigquery'],
) as dag:

    load_csv_to_bq = GCSToBigQueryOperator(
        task_id='load_csv_to_bq',
        bucket='your-gcs-bucket-name',  # Replace with your GCS bucket
        source_objects=['data/sample_data.csv'],
        destination_project_dataset_table='your_dataset.sample_table',  # Replace with your project.dataset.table
        schema_fields=[
            {'name': 'id', 'type': 'INTEGER', 'mode': 'REQUIRED'},
            {'name': 'name', 'type': 'STRING', 'mode': 'NULLABLE'},
            {'name': 'age', 'type': 'INTEGER', 'mode': 'NULLABLE'},
        ],
        write_disposition='WRITE_TRUNCATE',
        skip_leading_rows=1,
        source_format='CSV',
        autodetect=False,
    )

    load_csv_to_bq
