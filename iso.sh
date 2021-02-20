#!/bin/sh
set -e
. ./build.sh

mkdir -p isodir
mkdir -p isodir/boot
mkdir -p isodir/boot/grub

cp sysroot/boot/yos.kernel isodir/boot/yos.kernel
cat > isodir/boot/grub/grub.cfg << EOF
menuentry "yos" {
	multiboot /boot/yos.kernel
}
EOF
grub-mkrescue -o yos.iso isodir
