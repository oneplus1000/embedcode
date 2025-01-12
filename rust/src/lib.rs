#![no_std] // No standard library, essential for embedded programming
           //#![feature(allocator_api)] // Enable heap allocation (optional)

//use core::panic::PanicInfo;

#[no_mangle]
pub extern "C" fn add(a: i32, b: i32) -> i32 {
    return a + b + b;
}

// Panic handler for embedded systems
//#[panic_handler]
//fn panic(_info: &PanicInfo) -> ! {
//    loop {}
//}
