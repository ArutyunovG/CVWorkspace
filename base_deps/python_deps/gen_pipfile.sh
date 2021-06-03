#!/bin/bash

PIPFILE=$BASE_DEPS/python_deps/Pipfile

if test -f "$PIPFILE"; then
    rm $PIPFILE
fi

touch $PIPFILE

echo '[[source]]' >> $PIPFILE
echo 'name = "pypi"' >> $PIPFILE
echo 'url = "https://pypi.org/simple"' >> $PIPFILE
echo 'verify_ssl = true' >> $PIPFILE

echo '[dev-packages]' >> $PIPFILE

echo '[packages]' >> $PIPFILE
echo 'enum34 = "*"' >> $PIPFILE
echo 'scipy = "*"' >> $PIPFILE
echo 'scikit-image = "*"' >> $PIPFILE
echo 'networkx = "*"' >> $PIPFILE
echo 'matplotlib = "*"' >> $PIPFILE
echo 'nose = "*"' >> $PIPFILE
echo 'tensorboardx = "*"' >> $PIPFILE
echo 'protobuf = "=='$PROTOBUF_VERSION'"' >> $PIPFILE
echo 'future = "*"' >> $PIPFILE
echo 'typing = "*"' >> $PIPFILE
echo 'requests = "*"' >> $PIPFILE
echo 'tqdm = "*"' >> $PIPFILE
echo 'opencv-python = ">=3.2,<4.0"' >> $PIPFILE
echo 'mock = "*"' >> $PIPFILE
echo 'Cython = "*"' >> $PIPFILE
echo 'onnx = "*"' >> $PIPFILE
echo 'portalocker = "*"' >> $PIPFILE
echo 'setuptools = "==45.0"' >> $PIPFILE
echo 'ipykernel = "*"' >> $PIPFILE
echo 'keras_applications = "*"' >> $PIPFILE
echo 'keras_preprocessing = "*"' >> $PIPFILE
echo 'contextlib2 = "*"' >> $PIPFILE
echo 'lxml = "*"' >> $PIPFILE
echo 'tf_slim = "*"' >> $PIPFILE
echo 'pyyaml = "*"' >> $PIPFILE
echo 'numpy = "<1.19"' >> $PIPFILE
echo 'albumentations = "*"' >> $PIPFILE
echo 'imgaug = "*"' >> $PIPFILE

echo '[requires]' >> $PIPFILE
echo 'python_version = "'$PYTHON_VERSION'"' >> $PIPFILE
