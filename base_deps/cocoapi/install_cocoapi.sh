#!/bin/bash

git clone https://github.com/cocodataset/cocoapi.git
cd cocoapi/PythonAPI
python setup.py install
cd ../.. && rm -rf cocoapi
