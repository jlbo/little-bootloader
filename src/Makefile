TARGET = 32bit-main
ASM = nasm
ASMFLAGS = -f bin

build:
	$(ASM) $(ASMFLAGS) $(TARGET).asm -o $(TARGET).bin

run: build
	qemu-system-x86_64 $(TARGET).bin

clean:
	rm *.bin
