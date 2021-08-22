PREFIX=/usr CC=gcc ./configure.sh -G -O3

make
make test
make install