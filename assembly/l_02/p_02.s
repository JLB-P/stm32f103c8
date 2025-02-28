;Programa que calcula el factorial de un número (n)
;en donde n < 13

;Definición de nombres para registros
number	rn r0	;número de entrada	
count	rn r1	;contador de iteraciones
temp	rn r2

;area de variables
;-------------------------
			area mis_variables, data, readwrite
			align
input		dcd		0x12345678	;entrada del número	
	
;area de programa
;----------------
			area l_02, code, readonly		; area de código de solo lectura
			entry
			export __main					; se exporta a startup_stm32f10x_md.s
			
;inicio del programa
;-------------------
__main
	ldr temp,=input
	ldr number,[temp]		;lee el número
	mov number,#7
	mov count,number		;iteraciones = número a calcular el factorial
	
ciclo
	subs count,count, #1	;decrement counter
	cmp count,#0			;es 0 ?
	beq guarda
	mul number,number,count	;number = number x count
	b ciclo					;Ciclo infinito
guarda
	str number,[temp]
fin	b fin
			
	end
;fin del programa
;----------------
		