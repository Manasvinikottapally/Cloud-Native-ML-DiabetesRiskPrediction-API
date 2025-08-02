
# Diabetes Risk Prediction - ML API

This project uses the Pima Indians Diabetes dataset to train a machine learning model that predicts the likelihood of diabetes based on patient health features.

##  Tech Stack
- Python
- Pandas, scikit-learn
- Virtualenv
- joblib (for saving model)

##  Files
- `train_model.py`: trains and saves a Random Forest model
- `diabetes.csv`: input dataset
- `diabetes_model.pkl`: saved model file (ignored in Git)

##  Next Steps
- Build FastAPI app for predictions
- Dockerize and deploy on Kubernetes
- CI/CD with Jenkins
- Cloud deployment on AWS/GCP


A FastAPI-based RESTful service that predicts diabetes risk using a trained machine learning model. The application is containerized with Docker for consistent, portable deployment.

---

## 🔍 Features
- Predict diabetes risk from medical input data using a trained `RandomForestClassifier`
- REST API built with FastAPI
- Interactive Swagger docs at `/docs`
- Fully Dockerized
- Ready for CI/CD & cloud deployment

---

## 🛠️ Tech Stack3
- Python, FastAPI, Scikit-learn
- Docker
- Joblib, NumPy, Pydantic

---

## 📦 Requirements

Install dependencies:

```bash
pip install -r requirements.txt

# Cloud-Native Diabetes Risk Prediction API 🩺

This project builds a cloud-native machine learning API that predicts the risk of diabetes from health data. It uses a trained ML model served via FastAPI, containerized with Docker, and set up for CI/CD using GitHub Actions.

---

## 🚀 Features

- 🔍 Real-time diabetes risk prediction using an ML model
- ⚙️ Built with FastAPI + scikit-learn
- 🐳 Dockerized for portability
- ✅ Tested with Postman
- 🔄 CI/CD pipeline with GitHub Actions
- 📦 Ready for cloud deployment (EC2 or GCP)

---

## 🧠 Model Details

- Dataset: [Pima Indians Diabetes Dataset](https://www.kaggle.com/datasets/uciml/pima-indians-diabetes-database)
- Algorithm: Logistic Regression
- Trained on 70% of data, tested on 30%
- Output: Positive (High Risk) or Negative (Low Risk)

---

## 📦 Tech Stack

| Tool        | Purpose                          |
|-------------|----------------------------------|
| **Python**  | Machine learning + FastAPI       |
| **FastAPI** | REST API framework               |
| **Docker**  | Containerization                 |
| **GitHub Actions** | CI/CD automation         |
| **Postman** | API testing                      |

---

## 🧪 API Usage

### Endpoint: `/predict` (POST)

```json
{
  "Pregnancies": 2,
  "Glucose": 120,
  "BloodPressure": 70,
  "SkinThickness": 20,
  "Insulin": 85,
  "BMI": 28.4,
  "DiabetesPedigreeFunction": 0.5,
  "Age": 35
}

yaml code

---

## 🐳 Docker Instructions

**Build and Push Docker Image:**

```bash
# Local build
docker build -t manasvini26/diabetes-api:latest .

# Push to Docker Hub
docker login
docker push manasvini26/diabetes-api:latest

#Terraform deployment steps
cd terraform/

# Initialize Terraform
terraform init

# Preview plan
terraform plan

# Apply configuration
terraform apply

📊 Prometheus Integration for Monitoring
This project includes built-in support for Prometheus to monitor the FastAPI-based Diabetes Prediction API in real time.

✅ What is Monitored?
- API request metrics (total requests, duration, status codes)

- Python system metrics (memory, garbage collection, CPU, etc.)

- Custom FastAPI endpoints via Prometheus /metrics path

⚙️ Prometheus Setup & Automation Steps
Build FastAPI app with Prometheus instrumentation using prometheus-fastapi-instrumentator

Expose /metrics endpoint for live API and system metrics

Automate Prometheus installation and extraction via Terraform EC2 user_data

Configure Prometheus to scrape metrics from the FastAPI container on port 80

Open Prometheus UI access via port 9090 using AWS Security Group rules

View and query metrics at http://<EC2-PUBLIC-IP>:9090 to monitor API performance


wget https://github.com/prometheus/prometheus/releases/download/v2.52.0/prometheus-2.52.0.linux-amd64.tar.gz
tar -xvf prometheus-2.52.0.linux-amd64.tar.gz

#Library to access /Matric
from prometheus_fastapi_instrumentator import Instrumentator
Instrumentator().instrument(app).expose(app)
Configure Prometheus Target in prometheus.yml
Prometheus is configured to scrape metrics from the FastAPI app running on port 80:

after doing this
# Optional: Move to a standard location if you want
            mv prometheus-2.52.0.linux-amd64 prometheus
            cd prometheus

# Start Prometheus manually if needed:
            ./prometheus --config.file=prometheus.yml

#in scrap configuration file we need to add this (very important)
scrape_configs:
  - job_name: 'fastapi-app'
    static_configs:
      - targets: ['localhost:80']  # or 'localhost:80' based on your app


  # The job name is added as a label `job=<job_name>` to any timeseries scraped from this config.
  - job_name: "prometheus"

    # metrics_path defaults to '/metrics'
    # scheme defaults to 'http'.

    static_configs:
      - targets: ["localhost:9090"]

      
Access Prometheus UI
After EC2 boots up, visit:

cpp
Copy
Edit
http://<your-ec2-public-ip>:9090
Use queries like:

nginx
Copy
Edit
http_requests_total
process_resident_memory_bytes
Security Group Opened for Prometheus
Terraform opens port 9090 to allow external access to the Prometheus UI:

hcl
Copy
Edit
ingress {
  from_port   = 9090
  to_port     = 9090
  protocol    = "tcp"
  cidr_blocks = ["0.0.0.0/0"]


✅ CI/CD Pipeline with GitHub Actions
This project now includes a fully automated CI/CD pipeline using GitHub Actions, Docker Hub, and AWS EC2.

🔁 CI/CD Workflow Overview
On every push to the main branch:

GitHub Actions is triggered.

The FastAPI app is built into a Docker image using buildx.

The Docker image is pushed to Docker Hub:
manasvini26/diabetes-api:latest

GitHub Actions SSHs into the EC2 instance using a .pem key.

On EC2:

The latest Docker image is pulled and deployed.

Existing containers are stopped and removed.

A new container is launched on port 80.

Prometheus is downloaded and extracted for metrics monitoring.

