TITLE Test Floating - point output       (asmMain.asm)

; Test the printf and scanf functions from the C library.
; Test the printSingle function in the C++ module.

INCLUDE Irvine32.inc

; printSingle is a function in the startup C++ program,
; which will be called from this module.

printSingle PROTO C,
aSingle:REAL4,
	precision : DWORD

	TAB = 9

	.code
asmMain PROC C			; Entry point for this module

;---------- test the printf function --------------
; Note: do not pass REAL4 variables to printf using INVOKE

.data
prompt BYTE "Enter a float, followed by a double: ",0
formatTwo BYTE "%.2f",TAB,"%.3f",0dh,0ah,0
val1 REAL8 456.789
val2 REAL8 864.231
.code
INVOKE printf, ADDR formatTwo, val1, val2

;--------- test the scanf function -------------
.data
strSingle BYTE "%f",0
strDouble BYTE "%lf",0
float1 REAL4 1234.567
double1 REAL8  1234567.890123
.code

; Input a float, then a double:
INVOKE printf, ADDR prompt

INVOKE scanf, ADDR strSingle, ADDR float1
INVOKE scanf, ADDR strDouble, ADDR double1

;--------------------------------------------------------
; Passing a single-precision value to printf is tricky
; because it expects the argument to be a double.
; The following code emulates code generated by Visual C++.
; It may not make much sense until you read Chapter 17.

.data
valStr BYTE "float1 = %.3f",0dh,0ah,0
.code
	fld	float1					; load float1 onto FPU stack
	sub	esp,8					; reserve runtime stack space
	fstp	qword ptr [esp]		; put on runtime stack as a double
	push	OFFSET valStr
	call	printf
	add	esp,12
	
;----------------------------------------------------------
; Call our a C function in the main program for printing single-precision.
; Pass the number and the desired precision.

	INVOKE printSingle, float1, 3
	call	Crlf
		
	ret
asmMain ENDP

END