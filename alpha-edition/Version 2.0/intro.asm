[BITS 16]
[ORG 0500h]
pusha
	call Intro
popa
	jmp Return
	
; _________________________________________
; Inclusion Files _________________________

%INCLUDE "hardware/windows.lib"
%INCLUDE "hardware/monitor.lib"
%INCLUDE "hardware/colors.lib"
%INCLUDE "hardware/intro.lib"
; _________________________________________

Intro:
    call IntroStart
    mov BYTE[Color], 8
    call ClearBackround
ret

IntroStart:
    call GuivingOS
    call Edition
    call Version
    call Loading
ret

GuivingOS:
    mov bl, byte[LightBlue]
	mov dh, 9
	mov dl, 12
    call EffectInit
ret
Edition:
    mov bl, byte[LightCyan]
	mov dh, 11
	mov dl, 13
	call MoveCursor
	mov si, edition
	call PrintString
ret
Version:
    mov dh, 13
	mov dl, 14
	call MoveCursor
	mov si, version
	call PrintString
ret
Loading:
    mov bl, BYTE[LightGreen]
    mov dh, 20
	mov dl, 14
	call MoveCursor
	mov si, loading
	call PrintString
ret


Return:
    ret