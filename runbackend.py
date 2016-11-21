from backend import app
import logging

log = logging.getLogger('werkzeug')
log.setLevel(logging.ERROR)

if __name__ == '__main__':
    app.run(debug=False)

