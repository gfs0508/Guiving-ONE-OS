[BITS 16]
[ORG 0000h]

jmp OSStart

;_________________________________________________________________________
; Directives and Inclusions ______________________________________________

%INCLUDE "hardware/windows.lib"
%INCLUDE "hardware/monitor.lib"
%INCLUDE "hardware/disk.lib"

;_________________________________________________________________________


;________________________________________________________________________
;Starting the System ____________________________________________________

OSStart:
    call ConfigSegments
    call ConfigStack
	call VGA.SetVideMode
	call DrawBackround
	call Intro_Load
	;;call Windows_Load
	call CMD_Load
	jmp END

Intro_Load:
	mov BYTE[Sector], 3
	mov BYTE[Drive], 80h
	mov BYTE[NumSectors], 1
	mov WORD[SegmentAddr], 0800h
	mov WORD[OffestAddr], 0500h
	call ReadDisk
	call WindowAddress
ret

;;Windows_Load:
	;;mov BYTE[Sector], 4
	;;mov BYTE[Drive], 80h
	;;mov BYTE[NumSectors], 1
	;;mov WORD[SegmentAddr], 0800h
	;;mov WORD[OffestAddr], 0700h
	;;call ReadDisk
	;;call WindowAddress
;;ret

CMD_Load:
	mov BYTE[Sector], 4
	mov BYTE[Drive], 80h
	mov BYTE[NumSectors], 1
	mov WORD[SegmentAddr], 0800h
	mov WORD[OffestAddr], 0700h
	call ReadDisk
	call WindowAddress
ret
	

ConfigSegments:
    mov ax, es
    mov ds, ax
ret

ConfigStack:
    mov ax, 7D00h
    mov ss, ax      ;7D00h:03FEh
    mov sp, 03FEh
ret

END:
	mov ah, 00h
	int 16h
	mov ax, 0040h
	mov ds, ax
	mov ax, 1234h
	mov [0072h], ax
	jmp 0FFFFh:0000h