from flask import Flask, jsonify
import json

# Define Flask app
app = Flask(__name__)

# Define /health endpoint
@app.route("/health")
def health():
    return jsonify({ "status": "running"})

if __name__=="__main__":
    # Run app
    app.run(host="0.0.0.0", port=5000)