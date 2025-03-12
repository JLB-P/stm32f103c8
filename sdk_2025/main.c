/*GPIO functional description (p.158)
Memory and bus architecture (p.46)

*/

//user defined libs
#include "gpio.h"
#include "leds.h"

int main(void){
	init_gpio();
	led_on_off(10);
	while(1){
	
	}
}