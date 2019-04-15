		;		ARM Programming Assignment #2: 32 bit signed integer multiplier
		;
		;		Write a 32-bit SIGNED multiplier. It should take only a small modification to your
		;       unsigned version. Remember (-6)*(-6) = 36, (-6)*6 = -36.
		;		Use the standard shift-and-add operation.
		;		Use the two numbers as an example but write it so it works for any two 16-bit numbers.
		;		Write the result in the provided "fill" word.
		;		Indicate if there was a high-bit carry using the provided "fill" word.

		;		Your code here



		ADR		R0, numbers
		LDR		R1, [R0]     ;LOW ORDER MULTIPICANT
		MOV		R3, #0       ;hIGH ORDER MULTIPICANT
		LDR		R2, [R0, #4] ; MULTIPYER
		MOV		R5, #0       ; LOW ORDER RESULT
		MOV		R6, #1       ; HIGH ORDER RESULT
		
loop		TST		R2, #1    ; IS MULTIPLYER 1
		ADDSNE	R5,R5,R1  ; ADD AND SET CARRY FLAG IF R2 IS 1
		TST		R2, #1    ;
		ADCNE	R6, R6, R3
		LSLS		R1, R1, #1
		LSL		R3, R3, #1
		ADC		R3, R3, #0
		LSRS		R2, R2, #1
		BNE		loop
		
Done
		
		
		
numbers	DCD		0xA0BCFF0D, 0xFFF0ADEA
result	FILL		8
carry	FILL		4
