#include "uart.h"

void uart_send_char(char c)
{
  // Wait until the UART is not full
  while (UART0_FR & (1 << 5))
    ;
  UART0_DR = c;
}

void uart_send_string(const char *str)
{
  while (*str)
  {
    uart_send_char(*str++);
  }
}
