#todo add below line for building 32 bit
# ABI=32 ./configure ...

# config to create generic libraries
cp -v configfsf.guess config.guess
cp -v configfsf.sub   config.sub

./configure --prefix=/usr    \
            --enable-cxx     \
            --disable-static \
            --docdir=/usr/share/doc/gmp-6.2.1

make
make html

#Test
make check 2>&1 | tee gmp-check-log

#Ensure that all 197 tests in the test suite passed. Check the results by issuing the following command:
awk '/# PASS:/{total+=$3} ; END{print total}' gmp-check-log

make install
make install-html