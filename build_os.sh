echo "Building kernel.c ..."
i686-unknown-elf-gcc -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra

echo "Building boot.asm ..."

nasm -felf32 boot.asm -o boot.o

echo "Linking..."

i686-unknown-elf-gcc -T linker.ld -o myos.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc

echo "Copying to isodir..."

cp myos.bin isodir/boot
cp grub.cfg isodir/boot/grub

echo "Building ISO file..."
grub-mkrescue -o myos.iso isodir

echo "Cleaning after build..."
rm *.o
rm *.bin

echo "Running qemu..."
qemu-system-i386 -cdrom myos.iso

