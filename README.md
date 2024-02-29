# OSC2024

| Github Account | Student ID | Name          |
|----------------|------------|---------------|
| kaoyuhung      | 10955004   | Yu-Hung Kao   |

## Requirements

* a cross-compiler for aarch64
* (optional) qemu-system-arm

## Build 

```
*make* or *make kernel.img*
```

## Test With QEMU

```
*make run* or *qemu-system-aarch64 -M raspi3b -kernel kernel8.img -display none -d in_asm*
```
