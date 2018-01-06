[bits 16]
switch_to_pm:
	cli ; disable intterupts
	lgdt [gdt_descriptor] ; load GDT Descriptor
	mov eax, cr0
	or eax, 0x1 ; set 32-bit mode bit in cr0
	mov cr0, eax
	jmp CODE_SEG:init_pm ; far jump by using a diff seg

[bits 32]
init_pm:
	mov ax, DATA_SEG ; update segment registers
	mov ds, ax
	mov ss, ax,
	mov es, ax
	mov fs, ax
	mov gs, ax
	
	mov ebp, 0x90000 ; update the stack
	mov esp, ebp
	
	call BEGIN_PM ; call useful code
