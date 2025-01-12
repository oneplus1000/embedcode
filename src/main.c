#include "uart.h"

extern signed int add(signed int a, signed int b);

int main(void)
{
  int a = add(1, 2);
  if (a == 3)
  {
    uart_send_string("xxxx\n");
  }
  uart_send_string("Hello, world!\n");
  return 0;
}