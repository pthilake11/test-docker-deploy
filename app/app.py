from flask import Flask, jsonify

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello from Flask behind Nginx!"

@app.route("/api/health")
def health():
    return jsonify(status="ok", service="flask-app")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
