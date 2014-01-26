from flask import Flask
app = Flask(__name__)

@app.route('/todo/api/v1.0/tasks', methods = ['GET'])
def displayData():
  data = request.form['data']
  return data

@app.route('/api', methods=['GET'])
def returnInfo(request):
  print request.args
  # print request.args
  # info = int(request.args['info'])
  # return info

@app.route('/', methods=['GET'])
def returnInfo(request):
  print accel.json
  # print request.args
  # info = int(request.args['info'])
  # return info


@app.route('/test')
def test():
  print("test")
  return "test"
	
if __name__ == '__main__':
  app.run(host="127.0.0.1", port=8080)