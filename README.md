
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

## 🛠️ Tech Stack
- Python, FastAPI, Scikit-learn
- Docker
- Joblib, NumPy, Pydantic

---

## 📦 Requirements

Install dependencies:

```bash
pip install -r requirements.txt

