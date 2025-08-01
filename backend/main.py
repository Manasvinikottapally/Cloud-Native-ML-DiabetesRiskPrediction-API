from fastapi import FastAPI
from pydantic import BaseModel
import joblib
import numpy as np
from prometheus_fastapi_instrumentator import Instrumentator

# Load the model
model = joblib.load("diabetes_model.pkl")

# Initialize the FastAPI app
app = FastAPI()

# Enable metrics collection and exposure at /metrics
Instrumentator().instrument(app).expose(app)

# Define input schema
class PatientData(BaseModel):
    Pregnancies: int
    Glucose: float
    BloodPressure: float
    SkinThickness: float
    Insulin: float
    BMI: float
    DiabetesPedigreeFunction: float
    Age: int
#health check endpoint
@app.get("/healthz")
def health():
    return {"status": "ok"}

# Define prediction endpoint
@app.post("/predict")
def predict(data: PatientData):
    # Convert data to numpy array for prediction
    input_data = np.array([[ 
        data.Pregnancies,
        data.Glucose,
        data.BloodPressure,
        data.SkinThickness,
        data.Insulin,
        data.BMI,
        data.DiabetesPedigreeFunction,
        data.Age
    ]])
    
    # Make prediction
    prediction = model.predict(input_data)[0]
    result = "Positive (High Risk)" if prediction == 1 else "Negative (Low Risk)"
    return {"prediction": result}

if __name__ == "__main__":
    import uvicorn
    uvicorn.run("main:app", host="0.0.0.0", port=8080, reload=True)
