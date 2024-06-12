#!/bin/bash

#
# we need this anyway for pip
#
sudo apt install -yq python3 python3-pip

python_release=$PYTHON_VERSION

sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo apt update

sudo apt install -yq python$python_release python$python_release-distutils python$python_release-dev python$python_release-venv

# python3-tk is needed for gluoncv
# installation won't work if you have python3-tk already installed
# you need to remove python3-tk first;
# this script is not intended to delete anything from your system
sudo apt install -yq python$python_release-tk

# this is used for cv2 import in docker
sudo apt install -yq libsm6 libxext6 libxrender-dev

sudo python$python_release -m ensurepip --upgrade

sudo python$python_release -m pip install --upgrade pip
sudo python$python_release -m pip install --upgrade setuptools
sudo python$python_release -m pip install  pipenv

cd $BASE_DEPS/python_deps

if [ -z "$WITH_PIPFILE" ]; then
    source $(pwd)/gen_pipfile.sh
else
    cp "$WITH_PIPFILE" $(pwd)
    pipfile_name=$(echo $(git ls-files --others --exclude-standard))
    if [ "$pipfile_name" != "Pipfile" ]; then
        mv $pipfile_name Pipfile
    fi
fi

python$python_release -m pipenv --python=$(which python$python_release) install --skip-lock

rm $(echo $(git ls-files --others --exclude-standard))

cd $ROOT_DIR

venv_bin_path=$WORKON_HOME/$(ls $WORKON_HOME)/bin

source $venv_bin_path/activate

python -m ipykernel install --name python-cv-workspace
python -m pip install jupyter

echo 'export WORKON_HOME='$WORKON_HOME >> $SETUP_SCRIPT
echo 'export PATH='$venv_bin_path':$PATH' >> $SETUP_SCRIPT
