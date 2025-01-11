#include "uart.h"

int main(void)
{
  uart_send_string("Hello, world!\n");
  return 0;
}