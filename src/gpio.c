#include "gpio.h"

void gpio_init(void)
{
  GPIO_DIRSET = (1 << LED_PIN); // Set LED_PIN as output
  GPIO_OUTSET = (1 << LED_PIN); // Turn off the LED (active-low)
}

void led_on(void)
{
  GPIO_OUTCLR = (1 << LED_PIN); // Clear the pin to turn on the LED (active-low)
}

void led_off(void)
{
  GPIO_OUTSET = (1 << LED_PIN); // Set the pin to turn off the LED
}