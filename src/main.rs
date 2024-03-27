#![no_std]
#![no_main]
use core::panic::PanicInfo;

mod vga_buffer;

#[panic_handler]
fn panic(info: &PanicInfo) -> ! {
    println!();
    print_panic!("{}", info);
    loop {}
}

static KERN_VER: &[u8] = b"ANX v.0.0.1";

#[no_mangle]
pub extern "C" fn _start() -> ! {
    print_important!("ANX System 0.0.1\n");
    println!("\tANX which stands for Author has No eXperince :D");
    println!("\t<Codename: Initiator | v.0.0.1>");
    panic!("System has no idea what to do");
    loop {}
}
