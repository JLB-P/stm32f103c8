/*GPIO functional description (p.158)
Memory and bus architecture (p.46)

*/

//user defined libs
#include "gpio.h"
#include "leds.h"
#include "timers.h"
#include "interrupts.h"
#include "servo.h"
#include "usart.h"
#include "dma.h"

int main(void){
	init_gpio();
	//led_off();
	led_on_off(20);
	//led_onoff_timer2(1000);
	//ext_interrupt();
	
	/*Using timers
	***************/
	//timer2_ch1_oc();
	//timer3_ch1_pwm();
	//servo2();
	/*using usart*/
	//usart1_polling();
	//usart1_w_interrupt();
	usart1_via_dma();
	/* using DMA
	*************/
	dma_mem_to_mem();
	while(1){
	
	}
}