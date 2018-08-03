#!/bin/sh

tar -zxvf cmake-3.8.0-rc2.tar.gz
cd cmake-3.8.0-rc2

mkdir -p /home/hnishi/local/sw/cmake
./bootstrap --prefix=/home/hnishi/local/sw/cmake

gmake 
gmake install

