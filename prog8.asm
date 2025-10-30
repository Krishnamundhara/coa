/*8. Develop an 8086 Assembly program to calculate the length of a string stored in memory using MASM.*/

.MODEL SMALL
.STACK 100H
.DATA
S DB 'HELLO$',0

MSG DB 'LENGTH: $'
LEN DB 0

.CODE
START:
    MOV AX, @DATA
    MOV DS, AX
    LEA SI, S
    MOV CL, 0
AGAIN:
    MOV AL, [SI]
    CMP AL, '$'
    JZ SHOW
    INC SI
    INC CL
    JMP AGAIN
SHOW:
    MOV LEN, CL
    LEA DX, MSG
    MOV AH, 09H
    INT 21H
    MOV DL, LEN
    ADD DL, '0'
    MOV AH, 02H
    INT 21H
    MOV AH, 4CH
    INT 21H
END START
