CC=/opt/i686-elf-tools-linux/bin/i686-elf-gcc

BUILDFLAGS=-std=gnu99 -ffreestanding -Wall -Wextra -I./include
LINKFLAGS=-ffreestanding -nostdlib -lgcc

mkdir -p bin/isodir/boot/grub

# build code into objects
$CC $BUILDFLAGS -c src/main.c -o bin/main.o

# link objects
$CC $LINKFLAGS -T link.ld -o bin/isodir/boot/kernel.elf lib/kasm.o lib/cpu_detect.o lib/gdt.o lib/interdesctbl.o lib/kbd.o lib/ports.o lib/qemu_log.o lib/shell.o lib/string.o lib/tty.o

cp grub.cfg bin/isodir/boot/grub/grub.cfg
grub-mkrescue -o bin/tic-tac-toe.iso bin/isodir/

# clear temporary files
rm -Rfv bin/isodir