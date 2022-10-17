#!/bin/sh

git clone https://github.com/micropython/micropython.git
cd micropython
git submodule init
git submodule update
