#![no_std]
#![no_main]
use core::{fmt::write, panic::PanicInfo};

use crate::vga_buffer::WRITER;

mod vga_buffer;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

static HELLO: &[u8] = b"Hello World from my_OS v.0.0.1";

#[no_mangle]
pub extern "C" fn _start() -> ! {
    use core::fmt::Write;
    WRITER.lock().write_str("Hello from ANX ").unwrap();
    write!(WRITER.lock(), "(Author has No eXperience) Kernel v.0.0.{}" , 1).unwrap();
    loop {}
}