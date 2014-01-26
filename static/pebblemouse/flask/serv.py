from flask import Flask
app = Flask(__name__)

@app.route('/', methods=['POST', 'GET'])
def analize():
    if request.method == 'POST':
        data = request.form['accel']

        print(data)
        sys.stdout.write(data)
        sys.stdout.flush()

        # x = data.x_value
        # y = data.y_value
        # z = data.z_value

    # return render_template('login.html', error=error)

if __name__ == '__main__':
  app.run(host="12.0.0.1", port=8080)