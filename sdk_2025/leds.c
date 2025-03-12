#include <stm32f10x.h>
#include "systickdelay.h"

void led_on_off(int repeat){
		for(int i=1; i <= repeat; i++){
		GPIOC->ODR ^=(1 << 13);
		systickdelay(1);
		}
}