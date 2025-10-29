/*
1.Write an 8086 assembly language program using MASM to perform addition and multiplication of two 8-bit numbers
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

    ; --- Multiplication ---
    mov al, 2        ; First number for multiplication
    mov bl, 3        ; Second number
    mul bl           ; AL = AL × BL → AL = 6
    add al, '0'      ; Convert to ASCII
    mov dl, al       ; Move ASCII to DL
    mov ah, 02h      ; DOS function to print character
    int 21h          ; Print result of multiplication

    ; --- Exit program ---
    mov ah, 4Ch
    int 21h
end start
