#![no_std]
#![no_main]
use core::panic::PanicInfo;

mod vga_buffer;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

static HELLO: &[u8] = b"Hello World from my_OS v.0.0.1";

#[no_mangle]
pub extern "C" fn _start() -> ! {
    vga_buffer::demo_printing();
    loop {}
}