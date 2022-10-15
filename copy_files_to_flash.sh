#!/bin/sh

. venv/bin/activate
mpremote connect /dev/ttyA* cp main.py :
