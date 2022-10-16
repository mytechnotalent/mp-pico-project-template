#!/bin/sh

. venv/bin/activate
mpremote connect /dev/ttyAC* cp main.py :
