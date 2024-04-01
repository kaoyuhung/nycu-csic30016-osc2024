#include "dtb.h"
#include "interrupt.h"
#include "shell.h"
#include "uart1.h"
#include "utli.h"
extern void *_dtb_ptr;
extern void core_timer_enable();
extern void enable_interrupt();

void kernel_init(void *arg) {
  _dtb_ptr = arg;
  shell_init();
  fdt_traverse(get_cpio_addr);
  print_cur_el();
  print_cur_sp();
  enable_interrupt();
  core_timer_enable();
  // core0_timer_interrupt_enable();
}

void main(void *arg) {
  kernel_init(arg);
  shell_start();
}