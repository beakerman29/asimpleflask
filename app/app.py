from flask import Flask
app = Flask(__name__)

@app.route('/')
def default():
    return 'Congratulations you are running flask in a container'

if __name__ == '__main__':
    app.run(debug=True,host='0.0.0.0')
