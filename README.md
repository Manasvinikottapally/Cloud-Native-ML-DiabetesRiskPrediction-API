
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


