#!/bin/bash
# install-samtools.sh
# by ktpickard on 2020-09-27

# Use this script at your own risk. Provided as a starting point only.

# Get samtools
wget https://github.com/samtools/samtools/releases/download/1.10/samtools-1.10.tar.bz2
# Install bzip2 if you don't have it
sudo apt-get install bzip2
# Decompress the file
bzip2 -d samtools-1.10.tar.bz2
# Extract the files
tar xvf samtools-1.10.tar
cd samtools-1.10
# Configure samtools
./configure --prefix=/usr/local/bin
make .
make install

# Some preliminaries if you are starting from bare metal Ubuntu
read =p "To install gcc and libraries, press enter and then return to configure samtools in the script above"
# Install gcc
sudo apt update
sudo apt install build-essential
# Optional: sudo apt-get install manpages-dev
# Check gcc
gcc --version
read -p "Looking good? OK now let's install some libraries..."
# Install curses
sudo apt-get install libcurses5-dev libcursesw5-dev
# Install zlib
sudo apt-get install zlib
# Install bzip
sudo apt-get install libbz2-dev
# Install LZMA
sudo apt-get install liblzma-dev
# Install curl (several options available)
sudo apt-get install libcurl4-openssl-dev
# samtools should compile now (return to configure/make above)
