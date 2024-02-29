TOOLCHAIN_PREFIX = aarch64-linux-gnu-
CC = $(TOOLCHAIN_PREFIX)gcc
LD = $(TOOLCHAIN_PREFIX)ld
OBJCPY = $(TOOLCHAIN_PREFIX)objcopy

CFLAGS = -Wall

.PHONY: all clean run

all: kernel8.img

kernel8.img: main.o
	$(LD) -T linker.ld -o kernel8.elf main.o
	$(OBJCPY) -O binary kernel8.elf kernel8.img

main.o: main.s
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f *.o kernel8*

run:
	qemu-system-aarch64 -M raspi3b -kernel kernel8.img -display none -d in_asm
