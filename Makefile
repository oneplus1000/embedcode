AS = arm-none-eabi-as  
CC = arm-none-eabi-gcc  
CCFLAGS = -mcpu=cortex-m0 -mthumb 
ASFLAGS = -mcpu=cortex-m0 -mthumb 
LD = arm-none-eabi-ld   
LDFLAGS =  -T link.ld
OBJCOPY = arm-none-eabi-objcopy   
 

 
SRCS = $(wildcard src/*.s) $(wildcard src/*.c) 

# Object files (replace .c with .o in source file names)
OBJS = $(SRCS:.s=.o)
OBJS := $(OBJS:.c=.o)
 
TARGER = program.elf
TARGER_BIN = program.bin 
TARGER_HEX = program.hex

RUST_DIR = rust
RUST_LIB_DIR = rust/target/thumbv7m-none-eabi/release
RUST_LIB = $(RUST_LIB_DIR)/libmy_embedded_project.rlib

all: $(TARGER) $(TARGER_BIN) $(TARGER_HEX) 


$(TARGER):  $(OBJS) $(RUST_LIB)
	$(LD) $(LDFLAGS) -o $@ $(OBJS) $(RUST_LIB)

$(TARGER_BIN): $(TARGER)
	 $(OBJCOPY) -O binary $< $@

$(TARGER_HEX): $(TARGER)
	 $(OBJCOPY) -O ihex $< $@

%.o: %.s
	$(AS) $(ASFLAGS) -c $< -o $@

%.o: %.c
	$(CC) $(CCFLAGS) -c $< -o $@

$(RUST_LIB):
	cd $(RUST_DIR) && cargo build --release --target=thumbv7m-none-eabi
 
clean:
	rm -f $(TARGER) $(TARGER_BIN) $(TARGER_HEX)
	rm -f src/*.o
	cd $(RUST_DIR) && cargo clean