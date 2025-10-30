/*
6. Implement an 8086 assembly program to reverse a given string stored in memory and display the reversed string on the screen using INT 21H.
*/
.model small
.stack 100h
.data
str db 'HELLO$'
rev db 5 dup('$')
len dw 5          ; 👈 make it word instead of byte

.code
main proc
    mov ax, @data
    mov ds, ax

    lea si, str
    lea di, rev
    add si, len    ; both are 16-bit now
    dec si
    mov cx, len

rev_loop:
    mov al, [si]
    mov [di], al
    dec si
    inc di
    loop rev_loop

    mov ah, 09h
    lea dx, rev
    int 21h

    mov ah, 4Ch
    int 21h
main endp
end main

