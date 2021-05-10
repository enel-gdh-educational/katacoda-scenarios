from fastapi import FastAPI

# INITIATE API
app = FastAPI(title="Prediction API", docs_url="/", version="1.0.0")

@app.get("/health")
def healthcheck():
    return {"health": True}