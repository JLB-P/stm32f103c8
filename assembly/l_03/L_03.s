;Programa que envía una señal por el pin del puerto
;
;Steps to Program GPIO
;1) Power on GPIO by enabling Power to Port-c by setting bit 4 of APB2ENR register
;this is part Reset and Clock Control (RCC) structure
;2) Default Function of Port-C 13 pin is GPIO (from Hardware manual you can get this information)
;3) Configure relevant registers of GPIO
;Set Direction of GPIO as output  push pull mode
;by writing 1 to 21st bit of CRH register
;4) then turn Port-C.13 pin on and off by writing in to BSRR and BRR register 13th bit with software delay in between



;directivas de ensamblador
;-------------------------
			area constantes, data, readonly 	;area de código de solo lectura	
RCC_APB2ENR equ	0x40021018						;registro reloj de puertos (p.50)
GPIOC_CRL	equ	0x40011000						;registro para configuración de puerto C (parte baja p.171)
GPIOC_CRH	equ	0x40011004						;registro para configuración de puerto C (parte alta p.172)
GPIOC_ODR	equ 0x4001100C						;Puerto de salida(p.173)
	
;area de programa
			area p_01, code, readonly 	; area de código de solo lectura
			entry
			export __main				; se exporta a startup_stm32f10x_md.s
;inicio del programa
;-------------------
__main
	ldr r0, =0x00000010		;r0 valor para habilitar reloj de puerto C (bit4=1)
	ldr r1, =RCC_APB2ENR	;r1 apunta al registro de reloj de puertos
	str r0, [r1]			;almacena '1' en el bit 4 del registro
	
	ldr r0,=0x44444444		;r0 valor para reset
	ldr r1,=GPIOC_CRL
	str r0,[r1]				;reset al puerto
	
	ldr r0,=0x44344444		;Pc13 como salida(p.172)
	ldr r1,=GPIOC_CRH
	str r0,[r1]				
ciclo	
	ldr r0,=0x00002000		;escribe 1 en salida (p.172)
	ldr r1,=GPIOC_ODR
	str r0,[r1]			
	
	ldr r0,=0x00000000		;escribe 0 en salida (p.173)
	ldr r1,=GPIOC_ODR
	str r0,[r1]				
	
	b ciclo		; ciclo infinito
;fin del programa
;----------------
	end	