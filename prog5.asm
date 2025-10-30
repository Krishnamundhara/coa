/*
5. Implementation of two 8-bit BCD addition with accepting input from keyboard and displaying output on monitor using INT 21H interrupts.
*/
.model small
.stack 100h
.data
    msg1 db 'Enter first BCD digit: $'
    msg2 db 13,10,'Enter second BCD digit: $'
    msg3 db 13,10,'Sum is: $'
.code
start:
    mov ax, @data
    mov ds, ax

    ; --- Prompt for first digit ---
    lea dx, msg1
    mov ah, 09h
    int 21h

    ; --- Read first digit ---
    mov ah, 01h
    int 21h
    sub al, '0'      ; Convert ASCII to binary
    mov bl, al       ; Store first digit in BL

    ; --- Prompt for second digit ---
    lea dx, msg2
    mov ah, 09h
    int 21h

    ; --- Read second digit ---
    mov ah, 01h
    int 21h
    sub al, '0'      ; Convert ASCII to binary
    add bl, al       ; Add to first digit → BL = sum

    ; --- Convert sum to ASCII ---
    mov al, bl
    add al, '0'

    ; --- Display result ---
    lea dx, msg3
    mov ah, 09h
    int 21h

    mov dl, al
    mov ah, 02h
    int 21h

    ; --- Exit program ---
    mov ah, 4Ch
    int 21h
end start
