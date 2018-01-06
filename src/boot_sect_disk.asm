disk_load:
	pusha
	
	push dx
	
	mov ah, 0x02 ; 0x02 = read
	mov al, dh ; num of sectors tor read
	mov cl, 0x02 ; read from sector 2
	mov ch, 0x00 ; cylinder number
	mov dh, 0x00 ; head number

	int 0x13 ; interupt
	jc disk_error
	
	pop dx
	cmp al, dh ; bios sets al to sectors read
	jne sectors_error
	popa
	ret

disk_error:
	mov bx, DISK_ERROR
	call print
	call print_nl
	mov dh, ah
	call print_hex
	jmp disk_loop

sectors_error:
	mov bx, SECTORS_ERROR
	call print

disk_loop:
	jmp $

DISK_ERROR: db "Disk read error", 0
SECTORS_ERROR: db "Incorrect number of sectors read", 0
