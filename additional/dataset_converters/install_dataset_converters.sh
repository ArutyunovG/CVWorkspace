#!/bin/bash

git clone https://github.com/ISSResearch/Dataset-Converters.git -b $DATASET_CONVERTERS_VERSION
cd Dataset-Converters 
python -m pip install -r requirements.txt
cd .. && cp -r Dataset-Converters $LIBS_BASE/Dataset-Converters
rm -rf Dataset-Converters

echo 'export PATH=$PATH:$LIBS_BASE/Dataset-Converters' >> $SETUP_SCRIPT
