Newlib from git://sourceware.org/git/newlib-cygwin.git with xtensa & locking patches see https://github.com/ourairquality/newlib and built from commit e06f70041061344a62c2e5b8f0a602a902e72306

The build commands were:

mkdir build
cd build
../configure --with-newlib --enable-multilib --disable-newlib-io-c99-formats --enable-newlib-supplied-syscalls --enable-target-optspace --program-transform-name="s&^&xtensa-lx106-elf-&" --disable-option-checking --with-target-subdir=xtensa-lx106-elf --target=xtensa-lx106-elf --enable-newlib-nano-malloc --enable-newlib-nano-formatted-io --enable-newlib-reent-small --disable-newlib-mb --enable-newlib-global-stdio-streams --prefix=/tmp/libc
env CROSS_CFLAGS="-DSIGNAL_PROVIDED -DABORT_PROVIDED" make
make install
