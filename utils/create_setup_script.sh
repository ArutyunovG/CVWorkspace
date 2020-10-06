#!/bin/bash

if test -f "$SETUP_SCRIPT"; then
    return
fi

mkdir -p $(dirname "$SETUP_SCRIPT")
touch $SETUP_SCRIPT

if [ "$SOURCE_SETUP_SCRIPT_IN_BASHRC" -eq "1" ]; then
    echo 'source '$SETUP_SCRIPT >> $HOME/.bashrc
fi

echo 'UTILS_BASE='$UTILS_BASE >> $SETUP_SCRIPT
echo 'LIBS_BASE='$LIBS_BASE >> $SETUP_SCRIPT
echo 'export UTILS_BASE=$UTILS_BASE' >> $SETUP_SCRIPT
echo 'export LIBS_BASE=$LIBS_BASE' >> $SETUP_SCRIPT
echo 'export SETUP_SCRIPT='$SETUP_SCRIPT >> $SETUP_SCRIPT
echo 'export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64' >> $SETUP_SCRIPT
