#!/bin/bash

MDBOTHOME=$HOME/.local/mdbot

mkdir -p $MDBOTHOME
cp -r bin share $MDBOTHOME
chmod +x $MDBOTHOME/bin/*

echo "Normal installation. Congratulations!"