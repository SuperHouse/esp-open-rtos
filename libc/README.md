Newlib from git://sourceware.org/git/newlib-cygwin.git with xtensa & locking patches see https://github.com/ourairquality/newlib and built from commit 7558d27f9dba58ba0e51e37a2aa3ea6be7214799

The build commands were:

mkdir build
cd build
../configure --with-newlib --enable-multilib --disable-newlib-io-c99-formats --enable-newlib-supplied-syscalls --enable-target-optspace --program-transform-name="s&^&xtensa-lx106-elf-&" --disable-option-checking --with-target-subdir=xtensa-lx106-elf --target=xtensa-lx106-elf --enable-newlib-nano-malloc --enable-newlib-nano-formatted-io --enable-newlib-reent-small --disable-newlib-mb --prefix=/tmp/libc
env CROSS_CFLAGS="-DSIGNAL_PROVIDED -DABORT_PROVIDED" make
make install
