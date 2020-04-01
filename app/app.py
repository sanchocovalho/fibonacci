import os
from flask import Flask
from flask import render_template
import redis
from fibonacci import fib_matrix

app = Flask(__name__)
port = int(os.environ.get("PORT", 5000))
redis_client = redis.Redis(host=os.getenv("REDIS_HOST"), port='6379')

@app.errorhandler(404)
def not_found(e):
  return render_template("404.html")

def calc_fibonacci(number, template):
    stored_primary = redis_client.get(number)
    if stored_primary:
        fibo = {'number': number,
                'primary': stored_primary.decode()}
        return render_template(template, fibo=fibo)
    new_primary = fib_matrix(number)
    redis_client.set(number, new_primary)
    fibo = {'number': number,
            'primary': new_primary}
    return render_template(template, fibo=fibo)

@app.route('/')
def index():
    return render_template('index.html')

@app.route("/<number>", methods=['GET'])
def get_fibonacci_primary(number):
    if number.isdigit():
        number = int(number)
        return calc_fibonacci(number, 'index.html')
    else:
        return render_template('404.html')

@app.route("/get=<number>", methods=['GET'])
def get_fibonacci(number):
    if number.isdigit():
        number = int(number)
        return calc_fibonacci(number, 'get.html')
    else:
        return render_template('404.html')

if __name__ == '__main__':
    app.run(debug=False, host='0.0.0.0', port=port)