# AWS Manufacturing Data Pipeline

This project simulates a manufacturing data workflow using AWS services to automate ingestion, transformation, and monitoring.

## Architecture
S3 raw -> Lambda trigger -> Glue transform -> RDS load -> CloudWatch alerts

## Structure
- `lambda/` – AWS Lambda functions for ingestion & validation  
- `glue_jobs/` – Glue scripts for transformation  
- `infrastructure/terraform/` – IaC setup  
- `monitoring/` – CloudWatch & alert configuration  
- `sample_data/` – Sample manufacturing data  

