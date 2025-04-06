# GCP Data Pipeline with Composer & BigQuery

This project demonstrates a complete GCP-based ETL workflow using **Cloud Composer (Airflow)**, **Google Cloud Storage (GCS)**, and **BigQuery**.

---

## 🚀 Project Highlights
- **Airflow DAG**: Automates CSV file ingestion from GCS to BigQuery.
- **Terraform**: Provisions a Composer 2 environment using Infrastructure as Code.
- **GitHub Actions**: CI/CD pipeline for deploying Airflow DAGs to Composer.

---

## 📁 Project Structure
```bash
├── dags/
│   └── gcs_to_bigquery_etl.py      # Airflow DAG
├── data/
│   └── sample_data.csv             # Sample input file
├── terraform/
│   ├── main.tf                     # Composer infra config
│   ├── variables.tf                # Variables for Composer
│   └── terraform.tfvars            # Your specific values
├── .github/workflows/
│   └── deploy-composer.yml         # GitHub Actions workflow
├── README.md
```

---

## 🌐 Prerequisites
- A Google Cloud Project
- Enabled services: Composer, GCS, BigQuery
- A GCS bucket to upload DAGs (Composer managed)

---

## 🧱 Terraform Deployment
```bash
cd terraform
terraform init
terraform apply -var-file="terraform.tfvars"
```

---

## ⛓ GitHub Actions CI/CD
Add the following **GitHub Secrets**:
- `GCP_PROJECT_ID`
- `GCP_SA_KEY` (JSON credentials string)
- `COMPOSER_BUCKET`

GitHub Actions will auto-sync any changes in `dags/` to the Composer bucket.

---

## 📊 Output Example (in BigQuery)
| id | name     | age |
|----|----------|-----|
| 1  | Alice    | 25  |
| 2  | Bob      | 30  |

---

## 💡 Use Cases
- Cloud-native ETL pipelines
- Scheduled data ingestion into BigQuery
- Infrastructure-as-Code with Terraform
- CI/CD for Airflow DAGs

---

## 👨‍💻 Author
**Kewal Dangore**  
[LinkedIn](https://www.linkedin.com/in/kewal-dangore)  
DevOps & GCP Engineer

---

## 📌 Tags
`#gcp` `#composer` `#bigquery` `#terraform` `#ci-cd` `#airflow`
