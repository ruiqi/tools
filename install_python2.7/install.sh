set -e

LOCAL=$1
mkdir -p $1

wget -c https://www.python.org/ftp/python/2.7.7/Python-2.7.7.tgz --no-check-certificate
wget -c https://pypi.python.org/packages/source/s/setuptools/setuptools-5.2.tar.gz --no-check-certificate
wget -c https://pypi.python.org/packages/source/p/pip/pip-1.5.6.tar.gz --no-check-certificate

tar xzvf Python-2.7.7.tgz
(cd Python-2.7.7 && ./configure --prefix=$LOCAL && sudo make && sudo make install)
sudo rm -rf Python-2.7.7

tar xzvf setuptools-5.2.tar.gz
(cd setuptools-5.2 && sudo $LOCAL/bin/python setup.py install)
sudo rm -rf setuptools-5.2

tar xzvf pip-1.5.6.tar.gz
(cd pip-1.5.6 && sudo $LOCAL/bin/python setup.py install)
sudo rm -rf pip-1.5.6
