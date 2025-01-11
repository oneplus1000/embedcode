#define GPIO_BASE 0x50000000UL
#define GPIO_DIRSET (*(volatile unsigned int *)(GPIO_BASE + 0x518)) // Direction set register
#define GPIO_OUTSET (*(volatile unsigned int *)(GPIO_BASE + 0x508)) // Output set register
#define GPIO_OUTCLR (*(volatile unsigned int *)(GPIO_BASE + 0x50C)) // Output clear register
#define LED_PIN 30                                                  // Replace with your actual LED pin number

void gpio_init(void);
void led_on(void);
void led_off(void);