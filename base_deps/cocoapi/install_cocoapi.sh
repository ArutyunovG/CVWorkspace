#!/bin/bash

git clone https://github.com/cocodataset/cocoapi.git -b $COCOAPI_VERSION
cd cocoapi/PythonAPI
python setup.py install
cd ../.. && rm -rf cocoapi
