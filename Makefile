AS = arm-none-eabi-as  
CC = arm-none-eabi-gcc  
CCFLAGS = -mcpu=cortex-m0 -mthumb 
ASFLAGS = -mcpu=cortex-m0 -mthumb 
LD = arm-none-eabi-ld   
LDFLAGS = -T link.ld
OBJCOPY = arm-none-eabi-objcopy   
 

 
#SRCS = $(wildcard src/*.c)
#SRCS := $(wildcard src/*.s)
SRCS = $(wildcard src/*.s) $(wildcard src/*.c) 

# Object files (replace .c with .o in source file names)
OBJS = $(SRCS:.s=.o)
OBJS := $(OBJS:.c=.o)
 
TARGER = program.elf
TARGER_BIN = program.bin 
TARGER_HEX = program.hex

all: $(TARGER) $(TARGER_BIN) $(TARGER_HEX) 

print:
	@echo $(SRCS)
	@echo $(OBJS)

$(TARGER): $(OBJS)
	$(LD) $(LDFLAGS) -o $@ $(OBJS)

$(TARGER_BIN): $(TARGER)
	 $(OBJCOPY) -O binary $< $@

$(TARGER_HEX): $(TARGER)
	 $(OBJCOPY) -O ihex $< $@

%.o: %.s
	$(AS) $(ASFLAGS) -c $< -o $@

%.o: %.c
	$(CC) $(CCFLAGS) -c $< -o $@


clean:
	rm -f $(TARGER) $(TARGER_BIN) $(TARGER_HEX)
	rm -f src/*.o