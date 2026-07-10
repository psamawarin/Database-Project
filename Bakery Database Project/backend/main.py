from flask import Flask
from flask_cors import CORS

app = Flask(__name__)
CORS(app)

@app.get("/")
def home():
    return {"message": "Bakery API is running!"}

if __name__ == "__main__":
    app.run(debug=True)