#!/bin/sh

. venv/bin/activate
cd micropython
git pull
git submodule update
make clean -C ports/rp2 submodules 
make -C ports/rp2 submodules
make clean -C mpy-cross
make -C mpy-cross
cd ports/rp2
make
cp build-PICO/firmware.elf ../../../
cp build-PICO/firmware.uf2 ../../../
