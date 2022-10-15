#!/bin/sh

cp .vimrc ~/
python3 -m venv venv
. venv/bin/activate
pip install -r requirements.txt
git submodule add https://github.com/micropython/micropython.git
cd micropython
git submodule update --init
make -C ports/rp2 submodules
make -C mpy-cross
cd ports/rp2
make
cp build-PICO/firmware.elf ../../../
cp build-PICO/firmware.uf2 ../../../
# cd ../../../
# mkdir mp-template
# cd mp-template
# touch main.py
