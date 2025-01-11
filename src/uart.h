#define UART0_DR (*((volatile unsigned int *)0x4000C000))
#define UART0_FR (*((volatile unsigned int *)0x4000C018))

void uart_send_char(char c);
void uart_send_string(const char *str);