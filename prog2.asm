/*
2. Write an 8086 assembly language program using MASM to perform subtraction and division of two 8-bit numbers.
*/
.model small
.stack 100h
.code
start:
    mov ax, @data
    mov ds, ax

    ; -------- Subtraction --------
    mov al, 8       ; First number
    mov bl, 3       ; Second number
    sub al, bl      ; AL = AL - BL
    add al, '0'     ; Convert result to ASCII
    mov dl, al
    mov ah, 02h     ; Print character
    int 21h

    ; Newline
    mov dl, 13
    int 21h
    mov dl, 10
    int 21h

    ; -------- Division --------
    mov al, 8       ; Dividend
    mov ah, 0       ; Clear AH
    mov bl, 2       ; Divisor
    div bl          ; AL = AL / BL
    add al, '0'     ; Convert result to ASCII
    mov dl, al
    mov ah, 02h     ; Print character
    int 21h

    ; Exit
    mov ah, 4Ch
    int 21h
end start
