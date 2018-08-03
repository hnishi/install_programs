#!/bin/sh

tar -zxvf gromacs-4.6.6.orig.tar.gz
cd gromacs-4.6.6

cd src/contrib/fftw/CMakeLists.txt src/contrib/fftw/CMakeLists.txt_org
vi src/contrib/fftw/CMakeLists.txt

mkdir -p build1_serial_double
cd build1_serial_double

/home/hnishi/local/sw/cmake/bin/cmake  ..  \
         -DCMAKE_INSTALL_PREFIX=/home/hnishi/local/sw/gromacs-4.6.6-serial-d  \
         -DGMX_DOUBLE=ON \
         -DGMX_BUILD_OWN_FFTW=on \
         -DGMX_CPU_ACCELERATION=SSE2
         #-DCMAKE_C_COMPILER=mpicc \
         #-DCMAKE_CXX_COMPILER=mpicxx  \
         #-DGMX_OPENMP=on \
         #-DGMX_MPI=on \
         #-DCMAKE_C_FLAGS="-cc=gcc" \
         #-DCMAKE_CXX_FLAGS="-cc=g++"

         #-DBUILD_SHARED_LIBS=off \
         #-DGMX_FFT_LIBRARY=mkl  \
         #-DGMX_THREAD_MPI=on \

make install

exit

[hnishi@kan04 fftw]$ diff CMakeLists.txt_org CMakeLists.txt
37c37,38
< set(GMX_BUILD_OWN_FFTW_URL "http:////www.fftw.org/fftw-${EXTERNAL_FFTW_VERSION}.tar.gz" CACHE PATH "URL from where to download fftw, (use an absolute path when offline)")
---
> #set(GMX_BUILD_OWN_FFTW_URL "http:////www.fftw.org/fftw-${EXTERNAL_FFTW_VERSION}.tar.gz" CACHE PATH "URL from where to download fftw, (use an absolute path when offline)")
> set(GMX_BUILD_OWN_FFTW_URL "/home/hnishi/local/zipped/fftw-3.3.6-pl1.tar.gz" CACHE PATH "URL from where to download fftw, (use an absolute path when offline)")
