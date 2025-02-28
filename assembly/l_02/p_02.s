;Programa que calcula el factorial de un n�mero (n)
;en donde n < 13

;Definici�n de nombres para registros
number	rn r0	;n�mero de entrada	
count	rn r1	;contador de iteraciones
temp	rn r2

;area de variables
;-------------------------
			area mis_variables, data, readwrite
			align
input		dcd		0x12345678	;entrada del n�mero	
	
;area de programa
;----------------
			area l_02, code, readonly		; area de c�digo de solo lectura
			entry
			export __main					; se exporta a startup_stm32f10x_md.s
			
;inicio del programa
;-------------------
__main
	ldr temp,=input
	ldr number,[temp]		;lee el n�mero
	mov number,#7
	mov count,number		;iteraciones = n�mero a calcular el factorial
	
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
		