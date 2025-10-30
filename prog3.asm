/*
3. Develop an 8086 assembly language program using MASM to perform unsigned division and addition of two 8-bit numbers
*/
.model small
.stack 100h
.code
start:
    ; --- Addition ---
    mov al, 2        ; First number for addition
    add al, 3        ; Add second number → AL = 5
    add al, '0'      ; Convert to ASCII
    mov dl, al       ; Move ASCII to DL
    mov ah, 02h      ; DOS function to print character
    int 21h          ; Print result of addition

    ; --- Print space ---
    mov dl, ' '      ; Space separator
    mov ah, 02h
    int 21h

    ; --- Division ---
    mov al, 6        ; Dividend
    mov bl, 2        ; Divisor
    xor ah, ah       ; Clear AH before division
    div bl           ; AL = AL / BL → AL = 3, AH = remainder
    add al, '0'      ; Convert quotient to ASCII
    mov dl, al       ; Move ASCII to DL
    mov ah, 02h      ; DOS function to print character
    int 21h          ; Print result of division

    ; --- Exit program ---
    mov ah, 4Ch
    int 21h
end start
