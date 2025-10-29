/*
7. Implement an 8086 assembly program to display string stored in memory and display the reversed string on the screen using INT 21H.
*/
.MODEL SMALL
.STACK 100H

.DATA
msg1    DB 'Original String: $'
msg2    DB 0DH,0AH,'Reversed String: $'
string  DB 'HELLO WORLD$'
revStr  DB 20 DUP('$')          ; reserve 20 bytes for reversed string

.CODE
MAIN PROC
    MOV AX, @DATA
    MOV DS, AX

    ;---------------------------------------
    ; Display original string
    ;---------------------------------------
    LEA DX, msg1
    MOV AH, 09H
    INT 21H

    LEA DX, string
    MOV AH, 09H
    INT 21H

    ;---------------------------------------
    ; Find length of string (excluding '$')
    ;---------------------------------------
    LEA SI, string
    MOV CX, 0
FIND_LEN:
    MOV AL, [SI]
    CMP AL, '$'
    JE REVERSE
    INC SI
    INC CX
    JMP FIND_LEN

;---------------------------------------
; Reverse string
;---------------------------------------
REVERSE:
    LEA SI, string
    ADD SI, CX        ; point to end ('$')
    DEC SI            ; point to last valid char

    LEA DI, revStr
REV_LOOP:
    MOV AL, [SI]
    MOV [DI], AL
    DEC SI
    INC DI
    LOOP REV_LOOP

    MOV BYTE PTR [DI], '$'   ; terminate reversed string

;---------------------------------------
; Display reversed string
;---------------------------------------
    LEA DX, msg2
    MOV AH, 09H
    INT 21H

    LEA DX, revStr
    MOV AH, 09H
    INT 21H

;---------------------------------------
; Exit to DOS
;---------------------------------------
    MOV AH, 4CH
    INT 21H
MAIN ENDP
END MAIN

