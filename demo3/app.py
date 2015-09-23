from flask import Flask, render_template, request
from subprocess import Popen, PIPE
app = Flask(__name__)

@app.route("/")
def hello():

    if request.args.get('rebuild') == 'makecatalogs':
        p = Popen(['/usr/local/munki/makecatalogs', '/Users/jesse/munki'], stdout=PIPE, stderr=PIPE)
        output, _ = p.communicate()
    else:
        output = ''

    return render_template('hello.html', output=output)

if __name__ == "__main__":
    app.run(debug=True)
