#!/bin/sh

. venv/bin/activate
cp src/main.py micropython/ports/rp2/modules/
cd micropython
git checkout master
git pull origin master
git submodule update
make clean -C ports/rp2 submodules 
make -C ports/rp2 submodules
make clean -C mpy-cross
make -C mpy-cross
cd ports/rp2
make clean
make
cp build-PICO/*.elf ../../../
cp build-PICO/*.uf2 ../../../
