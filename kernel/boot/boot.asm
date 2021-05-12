BITS 16

start:
	mov ax, 07C0h		
	add ax, 288		    ; (512 + 4096) / 16 = 288
	mov ss, ax
	mov sp, 4096
	
	mov ax, 07C0h
	mov ds, ax
	mov si, text_string	; Put string position into SI
	
	call print_string	; Call our string-printing routine
	jmp $			    ; Jump here - infinite loop!

	text_string db 'Welcome to Bitate OS. I am getting my hands dirty on Operating System.', 0

print_string:			; print string in si register to screen
	mov ah, 0Eh		    ; setup BIOS interrupt parameter

.repeat:
	lodsb			; Load one byte at address DS:SI into AL
	cmp al, 0
	je .done		; If char is zero, end of string
	int 10h			; Otherwise, print it
	jmp .repeat

.done:
	ret

times 510-($-$$) db 0	; Pad remainder of boot sector with 0s
dw 0xAA55		        ; The standard PC boot signature