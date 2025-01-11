#include "deplay.h"

void delay(volatile unsigned int delay_time)
{
  while (delay_time--)
  {
    __asm__("nop"); // Prevent compiler optimization
  }
}