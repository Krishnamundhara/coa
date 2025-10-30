/*
4. Write an 8086 assembly language program using MASM to perform the multiplication and subtraction of two 8-bit unsigned numbers.
*/
.model small
.stack 100h
.data
    msg1 db 'Subtraction: $'
    msg2 db 'Multiplication: $'
.code
start:
    mov ax, @data
    mov ds, ax

    ; --- Print "Subtraction: " ---
    lea dx, msg1
    mov ah, 09h
    int 21h

    ; --- Subtraction ---
    mov al, 8        ; First number (minuend)
    mov bl, 3        ; Second number (subtrahend)
    sub al, bl       ; AL = AL - BL → AL = 5
    add al, '0'      ; Convert result to ASCII
    mov dl, al
    mov ah, 02h
    int 21h          ; Print result

    ; --- New line ---
    mov dl, 13       ; Carriage return
    mov ah, 02h
    int 21h
    mov dl, 10       ; Line feed
    int 21h

    ; --- Print "Multiplication: " ---
    lea dx, msg2
    mov ah, 09h
    int 21h

    ; --- Multiplication ---
    mov al, 2        ; First number
    mov bl, 3        ; Second number
    mul bl           ; AL = AL × BL → AL = 6
    add al, '0'      ; Convert result to ASCII
    mov dl, al
    mov ah, 02h
    int 21h          ; Print result

    ; --- Exit program ---
    mov ah, 4Ch
    int 21h
end start

