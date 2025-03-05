#include "stm32f10x.h"  

void init_gpio(void){
	RCC->APB2ENR |= (1 << 4);
	GPIOC->CRH &= ~((1 << 23)|(1 << 22)|(1 << 20));
	GPIOC->CRH |= (1 << 21);
	
	GPIOC->ODR ^=(1 << 13);
}
