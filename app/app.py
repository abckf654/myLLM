
---

### `app/app.py`
```python
from flask import Flask, request, render_template

app = Flask(__name__)

# This will hold the conversation history
chat_history = []

@app.route("/", methods=["GET", "POST"])
def index():
    global chat_history
    if request.method == "POST":
        user_input = request.form["user_input"]
        response = call_ollama_api(user_input)
        chat_history.append(("User", user_input))
        chat_history.append(("Deepseek", response))
    return render_template("chat.html", history=chat_history)

def call_ollama_api(prompt):
    import requests
    url = "http://localhost:11434/api/generate"
    data = {"model": "deepseek-coder-1.3b", "prompt": prompt}
    response = requests.post(url, json=data)
    return response.json().get("response", "Error: Unable to get response.")

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
