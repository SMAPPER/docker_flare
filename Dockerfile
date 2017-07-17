yum install -y python python-devel git
curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
python get-pip.py
cd /opt
git clone https://github.com/austin-taylor/flare.git
cd flare
pip install -r requirements.txt
