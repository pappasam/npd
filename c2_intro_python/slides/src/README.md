# Setup instructions

Create a virtual environment using python 3.4. Also, make sure you have npm and bower installed globally. Steps from scratch:

```bash
virtualenv -p python3.4 venv
source venv/bin/activate
pip install -U pip
pip install -r requirements.txt
sudo npm install -g bower
npm install
bower install
make
python application.py
```

Now navigate to localhost:5000 and find your relevant slides
