[BITS 16]
[ORG 0700h]
pusha
	call Cmd_Window_Create
popa
	jmp Return
	
; _________________________________________
; Inclusion Files _________________________

%INCLUDE "hardware/monitor.lib"
%INCLUDE "hardware/colors.lib"
%INCLUDE "hardware/cmd.lib"

; _________________________________________

Cmd_Window_Create:
    mov cx, 2
    mov dx, 2
	mov al, byte[LightGray]
	int 10h
	inc cx
    cmp cx, 250
	jnz Cmd_Window_Create

    mov bl, byte[White]
	mov dh, 2
	mov dl, 2
	call MoveCursor
	mov si, cmd_title
	call PrintString
	cmd_title db "Promot Command - Alpha", 0

Promot_load:
    mov bl, byte[White]
	mov dh, 3
	mov dl, 3
	call MoveCursor
	mov si, cmd_com

    
Return:
    ret